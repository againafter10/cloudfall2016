
function sortByProperty(property) {
    'use strict';
    return function (a, b) {
        var sortStatus = 0;
        if (a[property] < b[property]) {
            sortStatus = -1;
        } else if (a[property] > b[property]) {
            sortStatus = 1;
        }

        return sortStatus;
    };
}



function Sensor(){

    var session = document.getElementById("session"), uid;
    uid = session.getAttribute("data-email");

    jQuery.ajax({

        url: "http://35.161.231.221:8080/sensor_service/sensors?vendor_email="+uid,
        type: "GET",
        contentType: 'application/json',
        dataType:"json",
        success: function(resultData) {
            resultData.sort(sortByProperty('sensorId'));
            $("#sensortable tbody tr").remove();
            $.each(resultData,function (i,item) {
                var status;
                var $d=$('<button class="btn-sm btn-info btn-fill btn-danger btn-right " data-id="'+item.sensorId.toString()+'" toggle="modal" onclick="deleteSensor(event)">Delete</button>');
                var $e=$('<button class="btn-sm btn-info btn-fill btn-warning btn-left " data-id="'+item.sensorId.toString()+'" data-name="'+item.sensorName+'" data-type="'+item.sensorType+'" data-status="'+item.status+'" data-location="'+item.sensorLocation+'"  toggle="modal" onclick="editSensor(event)" >Edit</button>');
                var $s=$('<button class="btn-sm btn-info btn-fill btn-left" data-id="'+item.sensorId.toString()+'" toggle="modal" onclick="sensorGraph(event)">View Sensor Data</button>');



                if(item.sensorStatus==1){
                    status = "on";
                }
                else{
                    status="off";
                }
                $("#sensortable").append($('<tr/>').append($('<td/>').append(item.sensorId)).append($('<td/>').append(item.sensorName)).append($('<td/>').append(item.sensorType)).append($('<td/>').append(status)).append($('<td/>').append(item.sensorLocation)).append($('<td/>').append($e).append('&nbsp;&nbsp;').append($s).append('&nbsp;&nbsp;').append($d)));

            });



            /*$('#sensortable tr').click(function () {
                var row=document.getElementById("sensortable").getElementsByTagName("tr");
                var sensor_id=row[this.rowIndex].getElementsByTagName('td')[0].innerHTML;
                //var rowIndex=this.rowIndex;
                var url='http://localhost:8182/vendor-sensor-data.html?sensor='+encodeURIComponent(sensor_id);
                document.location.href=url;

            });*/
        },
    });

}


function add_sensor(){

    var session = document.getElementById("session"), uid;
    uid = session.getAttribute("data-email");


    var formData = $('#add-form').serializeArray();
    var data = {};
    $(formData ).each(function(index, obj){
        data[obj.name] = obj.value;
    });
    data[data.size]=uid;

    jQuery.ajax({
        url: "http://35.161.231.221:8080/sensor_service/sensors",
        type:"POST",
        contentType: 'application/json',
        data: JSON.stringify(data),
        success: function(data){
            alert("appended successfully");
        }
    });
}

function sensorGraph(event){

    var sensor_id=event.target.dataset.id;
    var url='http://localhost:8184/vendor-sensor-data.jsp?sensor='+encodeURIComponent(sensor_id);
    document.location.href=url;

}

function cancel_add_sensor(){

    $("#add-sensors").modal('hide');
}

function cancel_edit_sensor(){
    $("#edit-sensors").modal('hide');
}

function getSensorData(){


    var fromDate=new Date($( "#fromDate" ).val());
    var isoFromDate=fromDate.toISOString();

    var toDate=new Date($( "#toDate" ).val());
    var isoToDate=toDate.toISOString();

    location.search.substr(1).split("&")
        .forEach(function(item){
            data=item.split("=");
            sensor_id=decodeURIComponent(data[1]);
        });


    jQuery.ajax({
        url: "http://35.161.231.221:8080/sensor_service/sensor_data/" + sensor_id,
        type: "POST",
        contentType: 'application/json',
        data: sensorDateToJSON(isoFromDate, isoToDate),
        success: function (data) {
            var arr=[];
            for (var i = 0; i < data.sensorDataPoints.length; i++) {
                arr.push({x:data.sensorDataPoints[i].timestamp,y:parseFloat(data.sensorDataPoints[i].data)});
            }

            var sensorType=data.sensorDataType;

                //location.reload();
                var chart = new CanvasJS.Chart("sensorDataChart",
                    {
                        zoomEnabled: true,

                        title: {
                            text: sensorType.toUpperCase()+" SENSOR DATA"
                        },

                        data: [
                            {
                                type: "line",
                                xValueType: "dateTime",
                                dataPoints: arr
                            }
                        ]
                    });

                chart.render();

        }
    });

}

function sensorDateToJSON(fromDate,toDate)
{
    return JSON.stringify({
        "from": fromDate,
        "to": toDate
    });
}

function deleteSensor()
{
    var a =event.target.dataset.id;
    var delete_endpoint= "http://35.161.231.221:8080/sensor_service/sensors/"+a;
    jQuery.ajax({
        url: delete_endpoint,
        type:"DELETE",
        contentType: 'application/json',
        //data: JSON.stringify(a),
        success: function(data,textStatus,xhr){

            //alert(xhr.status);
            if(xhr.status==204){
                showDeleteDialog(1);
            }else{
                showDeleteDialog(0);
            }

            window.location.reload();

        }
    });
}

function showDeleteDialog(del_flag){
    var delete_dialog = document.getElementById('delete-dialog');
    var dialog_ok=document.getElementById('dialog_ok');

    if(del_flag==1)
        delete_dialog.show();
    dialog_ok.addEventListener('click',function (e) {
        e.preventDefault();
        delete_dialog.close();
    })

}

function editSensor(event)
{
    $('#edit-sensor-num').prop('readonly', true);
    var ids =event.target.dataset.id;
    var name=event.target.dataset.name;
    var type=event.target.dataset.type;
    var status=event.target.dataset.status;
    var location=event.target.dataset.location;
    $(".modal-body #edit-sensor-num").val(ids);
    $(".modal-body #edit-sensor-name").val(name);
    $(".modal-body #edit-sensor-type").val(type);
    $(".modal-body #edit-sensor-status").val(status);
    $(".modal-body #edit-sensor-location").val(location);

    $("#edit-sensors").modal('show');


    }

function update_sensor(){

    var id=$('#edit-sensor-num').val();
    alert(id);
    var formData = $('#edit-form').serializeArray();
    var data = {};
    $(formData ).each(function(index, obj){
        data[obj.name] = obj.value;
    });

    jQuery.ajax({
        url: "http://35.161.231.221:8080/sensor_service/sensors/"+id,
        type:"PUT",
        contentType: 'application/json',
        data: JSON.stringify(data),
        success: function(data){
            alert("updated successfully");
        }
    });
}




