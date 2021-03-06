<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

    <link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900|RobotoDraft:400,100,300,500,700,900'>
    <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>

    <link rel="stylesheet" href="css/style.css">


</head>

<body>

<!-- Form Mixin-->
<!-- Input Mixin-->
<!-- Button Mixin-->
<!-- Pen Title-->
<div class="pen-title">
    <h1>Mobile Sensor Cloud</h1>
</div>
<!-- Form Module-->
<div class="module form-module">
    <div class="toggle"><i class="fa fa-times fa-pencil"></i>
        <div class="tooltip">New User</div>
    </div>
    <div class="form">
        <h2>Login to your account</h2>
        <form name="login" method="post" action="Login">
            Username<input type="text" name="userid" id="userid"/>
            Password<input type="password" name="pswrd" id="pswrd" />
            <!--Type<input type="text" name="typ" id="typ"/>-->
            <br/>
            <br>
            <input type="submit" name="Submit" value="Login"/>
            <input type="reset" value="Reset"/>

        </form>



    </div>
    <div class="form">
        <h2>Create an account</h2>
        <form>
            Username<input type="text" name="Username" id="Username"/>
            Password<input type="password" name="Password" id="pw"/>
            Email<input type="email" name="Email Address" id="email"/>
            Type<input type="text" name="typ" id="typ"/>

            <input type = "button" onclick = "regis(Username.value,email.value,pw.value,typ.value)" value="Register"/>
        </form>
        <script language="javascript">
            function regis(Username,email,pw,type){

                /*alert("This is name :"+vendorname);
                 alert("This is email :"+email);
                 alert("This is pw :"+pw);*/
//        	$('#vendor-saved-dialog').modal('show')
                jQuery.ajax({
                    type: "POST",
                    url: "http://localhost:8181/"+type,
                    data: formToJSON(Username,email,pw,1001,type),
                    contentType: 'application/json',
                    dataType:"json",
                    success: function(resultData) {
                        alert('Sucessfully registered');


                    },
                });
            }


            function formToJSON(Username,email,pw,plan,type) {

                if (type === "users")
                {
                    alert(plan)
                    return JSON.stringify({
                        "userEmail":email,
                        "planId":plan,
                        "userName":Username,
                        "userPassword":pw

                    });}
                else
                {
                    return JSON.stringify({
                        "vendorEmail":email,
                        "vendorName":Username,
                        "vendorPassword":pw

                    });
                }

            }
        </script>
    </div>
</div>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script type="text/javascript" src="js/check.js"></script>


<script src="js/index.js"></script>

</body>
</html>
