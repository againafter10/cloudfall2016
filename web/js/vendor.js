function vendor(){

    jQuery.ajax({
        url: "http://35.161.231.221:8080/sensor_service/vendors",
        type: "GET",
        contentType: 'application/json',
        dataType:"json",
        success: function(resultData) {
            $("#vendor-table tbody tr").remove();
            $.each(resultData,function (i,item) {
                //var link=document.createElement("a");
                //link.href="admin-users.jsp";
                $("#vendor-table").append($('<tr/>').append($('<td/>').append(i+1)).append($('<td/>').append(item.vendorName)).append($('<td/>').append(item.vendorEmail)));
            });

            $('#vendor-table tr').click(function () {
                var row=document.getElementById("vendor-table").getElementsByTagName("tr");
                var vendor_email=row[this.rowIndex].getElementsByTagName('td')[2].innerHTML;
                //var rowIndex=this.rowIndex;
                var url='http://localhost:8184/admin-vendor-sensor.jsp?vendor='+encodeURIComponent(vendor_email);
                document.location.href=url;

            });

        },
    });

}

function onLoadSensors(){

    var res=null, data=[];
    location.search.substr(1).split("&")
        .forEach(function(item){
        data=item.split("=");
        res=decodeURIComponent(data[1]);
    });


    jQuery.ajax({
        url: "http://35.161.231.221:8080/sensor_service/sensors?vendor_email="+res,
        type: "GET",
        contentType: 'application/json',
        dataType:"json",
        success: function(resultData) {
            $("#vendor-sensor-table tbody tr").remove();
            $.each(resultData,function (i,item) {
                var status;
                if(item.sensorStatus)
                    status = "on";
                else
                    status="off";

                $("#vendor-sensor-table").append($('<tr/>').append($('<td/>').append(item.sensorId)).append($('<td/>').append(item.sensorName)).append($('<td/>').append(item.sensorType)).append($('<td/>').append(status)).append($('<td/>').append(item.sensorLocation)));
            });
        },
    });


}