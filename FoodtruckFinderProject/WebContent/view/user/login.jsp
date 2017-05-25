<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FooFa Login</title>
    <!-- Core CSS - Include with every page -->
    <link href="resources/plugins/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="resources/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="resources/plugins/pace/pace-theme-big-counter.css" rel="stylesheet" />
  <link href="resources/css/style.css" rel="stylesheet" />
      <link href="resources/css/main-style.css" rel="stylesheet" />

    <!-- Page-Level CSS -->
    <link href="resources/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet" />

</head>

<body class="body-Login-back">
 <!--  wrapper -->
    <div id="wrapper">
		<%@ include file="../header.jspf"%>
	</div>
	
 <!--  end wrapper -->
    <div class="container">
       
        <div class="row">
            <div class="col-md-4 col-md-offset-4 text-center logo-margin ">
            	<h1>Login</h1>  
            </div>
            <div class="col-md-6 col-md-offset-3">
                <div class="login-panel panel panel-default">                  
                    <div class="panel-heading">
                        <h3 class="panel-title">Please Sign In</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="E-mail" name="email" type="email" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Password" name="password" type="password" value="">
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input name="remember" type="checkbox" value="Remember Me">Remember Me
                                    </label>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <a href="index.html" class="btn btn-lg btn-success btn-block">Login</a>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

     <!-- Core Scripts - Include with every page -->
    <script src="resources/plugins/jquery-1.10.2.js"></script>
    <script src="resources/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="resources/plugins/metisMenu/jquery.metisMenu.js"></script>

</body>

</html>
