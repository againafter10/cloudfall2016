<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>Mobile Sensor Cloud - User Dashboard</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport'/>
    <meta name="viewport" content="width=device-width"/>
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/light-bootstrap-dashboard.css" rel="stylesheet"/>
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
</head>
<body onload="user_sensor_group();virtualSensorList()">

<div id="session" data-email="${sessionScope.email}" />

<div class="wrapper">
    <div class="sidebar" data-color="black">
        <div class="sidebar-wrapper">
            <div class="logo">
                <a class="simple-text">
                    Mobile Sensor Cloud
                </a>
            </div>
            <ul class="nav">
                <!--<li>
                    <a href="user-dashboard.jsp">
                        <i class="fa fa-dashboard"></i>
                        <p>Dashboard</p>
                    </a>
                </li>-->
                <li>
                    <a href="user-sensors.jsp">
                        <i class="fa fa-wifi"></i>
                        <p>My Sensors</p>
                    </a>
                </li>
                <li class="active">
                    <a href="user-sensor-groups.jsp">
                        <i class="fa fa-wifi"></i>
                        <p>My Sensor Groups</p>
                    </a>
                </li>
                <li>
                    <a href="user-billing.jsp">
                        <i class="fa fa-wifi" ></i>
                        <p>Billing</p>
                    </a>
                </li>
            </ul>
        </div>
    </div>

    <div class="main-panel">
        <nav class="navbar navbar-default navbar-fixed">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse"
                            data-target="#navigation-example-2">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="index.jsp"> Log Out </a>
                        </li>
                        <!--<li>
                            <a href="user-settings.html" class="fa fa-cog fa-fw" data-target="#edit_profile" >
                                </i>
                            </a>
                        </li>-->

                    </ul>
                </div>
            </div>
        </nav>


        <!----Common------>

        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card card-plain">
                            <div class="col-md-12">
                                <div class="card card-plain">
                                    <div class="header">
                                        <h4 class="title">Sensors Groups
                                            <button class="btn btn-info btn-fill pull-right" data-toggle="modal"
                                                    data-target="#create-sensor-modal">Create Group
                                            </button>
                                        </h4>
                                    </div>
                                    <div class="content table-responsive table-full-width">
                                        <table id="user-sensorGroup-table" class="table table-hover">
                                            <col width="10">
                                            <col width="40">
                                            <thead>
                                            <th>Id</th>
                                            <th>Group Name</th>
                                            <th>Group Description</th>
                                            </thead>
                                            <tbody>
                                            <tr>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-8">

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<div id="list-sensor-modal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Sensor Group</h4>
            </div>
            <div class="modal-body">
                <div class="content">
                    <div class="row">
                        <div class="card card-plain">
                            <div class="col-md-14">

                                <div class="card card-plain">

                                    <div class="header" id="title">
                                        <h5 class="title">List of sensors</h5>
                                    </div>
                                    <div class="content table-responsive table-full-width">

                                        <table id="list-sensor-table" class="table table-hover">
                                            <col width="10">
                                            <col width="40">
                                            <thead>
                                            <th>No</th>
                                            <th>Sensor Name</th>
                                            <th>Sensor Type</th>
                                            <th>Sensor status</th>
                                            <th>Sensor Location</th>
                                            </thead>
                                            <tbody>
                                            <tr>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="create-sensor-modal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Sensor Group</h4>
            </div>
            <div class="modal-body">
                <div class="content">
                    <div class="row">
                        <div class="card card-plain">

                            <div class="col-md-7">
                                <div class="form-group">
                                    <label>Sensor Group Name</label>
                                    <input id="sensor-grp-name" type="text" class="form-control"
                                           placeholder="Sensor Group Name" name="sensorGrpName">
                                </div>
                            </div>
                            <div class="col-md-7">
                                <div class="form-group">
                                    <label>Sensor Group Description</label>
                                    <input id="sensor-grp-desc" type="text" class="form-control"
                                           placeholder="Sensor Group Description"
                                           name="sensorGrpDesc">
                                </div>
                            </div>

                            <div class="col-md-14">
                                <div class="card card-plain">
                                    <!--<div class="header">
                                        <h5 class="title">Select sensor</h5>
                                    </div>-->
                                    <div class="content table-responsive table-full-width">

                                        <table id="create-sensor-grp-table" class="table table-hover">
                                            <col width="10">
                                            <col width="40">
                                            <thead>
                                            <th>No</th>
                                            <th>Sensor Name</th>
                                            <th>Sensor Type</th>
                                            <th>Sensor status</th>
                                            <th>Sensor Location</th>
                                            </thead>
                                            <tbody>
                                            <tr>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-7">
                        <div class="form-group">
                            <input onclick="add_sensor_group()" type="button" class="btn btn-info btn-fill" value="Submit">
                            <input onclick="sensor_grp_cancel()" type="button" class="btn btn-info btn-fill btn-danger" value="Cancel"/>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


</body>


<script src="js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/user-sensor-group.js" type="text/javascript"></script>

</html>