<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>admin Advertiset</title>
    <!-- Core CSS - Include with every page -->
    <link href="../../resources/plugins/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="../../resources/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="../../resources/plugins/pace/pace-theme-big-counter.css" rel="stylesheet" />
  <link href="../../resources/css/style.css" rel="stylesheet" />
      <link href="../../resources/css/main-style.css" rel="stylesheet" />

    <!-- Page-Level CSS -->
    <link href="../../resources/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet" />

</head>

<body>
    <!--  wrapper -->
    <div id="wrapper">
        <!-- navbar top -->
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation" id="navbar">
            <!-- navbar-header -->
                <a class="navbar-brand" href="index.html">
                    <img src="../../resources/img/logo.png" alt="" />
                </a>
            <!-- navbar-top-links -->
            <ul class="nav navbar-top-links navbar-right">
                <!-- main dropdown -->
                <li class="row">
                		<div class="col-xs-10" style="margin-right: 200px">
	            			<!-- search section-->
	                        <div class="input-group custom-search-form">
	                        	<input type="text" class="form-control" placeholder="Search" style="width: 400px">
	                            <input type="text" class="form-control" placeholder="Location" style="width: 400px">
	                                <button class="btn btn-default" type="button">
	                                    <i class="fa fa-search"></i>
	                                </button>
	                        </div>
	                		<!--end search section-->
	            		</div>
                </li>
                <li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-user fa-3x"></i>
				</a> <!-- dropdown user-->
					<ul class="dropdown-menu dropdown-user">
						<li><a href="#"><i class="fa fa-user fa-fw"></i>User
								Profile</a></li>
						<li><a href="#"><i class="fa fa-gear fa-fw"></i>Settings</a>
						</li>
						<li class="divider"></li>
						<li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i>Logout</a>
						</li>
					</ul> <!-- end dropdown-user --></li>
				<!-- end main dropdown -->
			</ul>
			<!-- end navbar-top-links -->

		</nav>
		<!-- end navbar top -->
       
		<!-- navbar side -->
		<nav class="navbar-default navbar-static-side" role="navigation">
			<!-- sidebar-collapse -->
			<div class="sidebar-collapse">
				<!-- side-menu -->
				<ul class="nav" id="side-menu">

					<li class="selected"><a href="#"><i
							class="fa fa-flask fa-fw"></i>My Reviews</a>
					<li><a href="#"><i class="fa fa-flask fa-fw"></i>Followers</a>
					<li><a href="#"><i class="fa fa-flask fa-fw"></i>My
							Followers Review</a></li>
					<li><a href="#"><i class="fa fa-table fa-fw"></i>단골</a></li>
					<li><a href="#"><i class="fa fa-edit fa-fw"></i>회원정보수정</a></li>
				</ul>
				<!-- end side-menu -->
			</div>
			<!-- end sidebar-collapse -->
		</nav>
		<!-- end navbar side -->
		<!--  page-wrapper -->
		<div id="page-wrapper" style="background-color: #FFFFFF">
			<div class="container">
				<div class="row">
					<!-- Page Header -->
					<div class="row"
						style="height: 300px; background-color: #FFFFFF; position: absolute; width: 83.5%">
						<a class="navbar-brand" href="#"
							style="margin-top: 10px; margin-left: 20px"> <img
								src="../../resources/img/waikiki.jpg"
								style="height: 250px; width: 250px" />
						</a>
						<div class="user-info">
								<h1>트와이스님의 프로필 페이지</h1>
								<br>
								<h5>twicejjang@chogo</h5>
								<h5>144Followers</h5>
								<h5>255Reviews</h5>
						</div>
						<span style="float: right; margin-right: 90px; margin-top: 30px">
							<a href="#"><button type="button" class="btn btn-default">회원
									탈퇴</button></a> <br> <br> <br> <br> <br> <br>
							<br> <a href="#"><button type="button"
									class="btn btn-default">Make Follow</button></a>
						</span>

					</div>

				</div>
				<!--End Page Header -->
			</div>

			<div class="row">
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br> <br> <br> <br>
				<br>

				<div class="container">

					<h1>Follwer List</h1>
					<br>
					<div id="follwer" style="margin-bottom:50px">

						<a class="navbar-brand" href="#"
							style="margin-top: 10px; margin-left: 20px"> <img
							src="../../resources/img/waikiki.jpg"
							style="height: 70px; width: 70px" />
						</a>
						<div class="user-info">
							<h5><a href="" style="color:black">파이리</a></h5>
							<br>
							<h5>144Followers</h5>
							<h5>255Reviews</h5>
							<br>
						</div>
						<div style="float: right;">
							<br> <br> <br>
							<button type="button" class="btn btn-default" style="inlince-bolck; margin-left: 350px;">UNFOLLOW</button>
						</div>
						<br>
					</div>
				
	
			<div id="follwer" style="margin-bottom:50px">

						<a class="navbar-brand" href="#"
							style="margin-top: 10px; margin-left: 20px"> <img
							src="../../resources/img/waikiki.jpg"
							style="height: 70px; width: 70px" />
						</a>
						<div class="user-info">
							<h5><a href="" style="color:black">파이리</a></h5>
							<br>
							<h5>144Followers</h5>
							<h5>255Reviews</h5>
							<br>
						</div>
						<div style="float: right;">
							<br> <br> <br>
							<button type="button" class="btn btn-default" style="inlince-bolck; margin-left: 350px;">UNFOLLOW</button>
						</div>
						<br>
					</div>
				
                    
                    	<div id="follwer" style="margin-bottom:50px">

						<a class="navbar-brand" href="#"
							style="margin-top: 10px; margin-left: 20px"> <img
							src="../../resources/img/waikiki.jpg"
							style="height: 70px; width: 70px" />
						</a>
						<div class="user-info">
							<h5><a href="" style="color:black">파이리</a></h5>
							<br>
							<h5>144Followers</h5>
							<h5>255Reviews</h5>
							<br>
						</div>
						<div style="float: right;">
							<br> <br> <br>
							<button type="button" class="btn btn-default" style="inlince-bolck; margin-left: 350px;">UNFOLLOW</button>
						</div>
						<br>
					</div>
				

				</div>
				<!-- end page-wrapper -->

			</div>
			<!-- end wrapper -->

    <!-- Core Scripts - Include with every page -->
    <script src="../../resources/plugins/jquery-1.10.2.js"></script>
    <script src="../../resources/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="../../resources/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="../../resources/plugins/pace/pace.js"></script>
    <script src="../../resources/scripts/siminta.js"></script>
    <!-- Page-Level Plugin Scripts-->
    <script src="../../resources/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="../../resources/plugins/dataTables/dataTables.bootstrap.js"></script>
    <script>
        $(document).ready(function () {
            $('#dataTables-example').dataTable();
        });
    </script>

</body>

</html>
