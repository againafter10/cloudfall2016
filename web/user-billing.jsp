<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Mobile Sensor Cloud - User Dashboard</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/light-bootstrap-dashboard.css" rel="stylesheet"/>
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
</head>
<body onload="user_dashboard()">
<div class="wrapper">
    <div class="sidebar" data-color="black">
        <div class="sidebar-wrapper">
            <div class="logo">
                <a class="simple-text">
                    Mobile Sensor Cloud
                </a>
            </div>
            <ul class="nav">
                <!--<li class="active">
                    <a href="user-dashboard.jsp">
                        <i class="fa fa-dashboard"></i>
                        <p>Dashboard</p>
                    </a>
                </li>-->
                <li>
                    <a href="user-sensors.jsp">
                        <i class="fa fa-wifi" ></i>
                        <p>My Sensors</p>
                    </a>
                </li>
                <li>
                    <a href="user-sensor-groups.jsp">
                        <i class="fa fa-wifi" ></i>
                        <p>My Sensor Groups</p>
                    </a>
                </li>
                <li class="active">
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
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
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
                        <li>
                            <a href="user-settings.html" class="fa fa-cog fa-fw" data-target="#edit_profile" >
                                </i>
                            </a>
                        </li>

                    </ul>
                </div>
            </div>
        </nav>


        <!----Common------>

        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12" >
                        <div class="card card-plain">
                            <div class="header">
                                <h4 class="title">Resource usage</h4>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table id="bill-table" class="table table-hover" >
                                    <thead>
                                    <th>Resource Type</th>
                                    <th>Usage</th>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>Server(t2.micro)</td>
                                        <td>$0.05 per hour</td>
                                    </tr>
                                    <tr>
                                        <td>Sensor</td>
                                        <td>$0.50 per hour</td>
                                    </tr>

                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12" >
                        <div class="card card-plain">
                            <div class="header">
                                <h4 class="title">Billing Details</h4>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table id="usage-table" class="table table-hover" >
                                    <thead>
                                    <th>Sensor Name</th>
                                    <th>Sensor Location</th>
                                    <th>Duration(minutess)</th>
                                    <th>Charges</th>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>Temp Sensor</td>
                                        <td>SF</td>
                                        <td>24</td>
                                        <td>$12</td>
                                    </tr>
                                    <tr>
                                        <td>IR sensor</td>
                                        <td>Milpitas</td>
                                        <td>15</td>
                                        <td>$7.5</td>
                                    </tr>
                                    <tr>
                                        <td>image sensor</td>
                                        <td>SF</td>
                                        <td>18</td>
                                        <td>$9</td>
                                    </tr>
                                    <tr>
                                        <td>IR sensor 1</td>
                                        <td>SF</td>
                                        <td>20</td>
                                        <td>$10</td>
                                    </tr>
                                    <tr>
                                        <td>Temp sensor 1</td>
                                        <td>Fremont</td>
                                        <td>10</td>
                                        <td>$5</td>
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


</body>


<script src="js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<!--  <script src="js/user_dashboard.js" type="text/javascript"></script -->

</html>