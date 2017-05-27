<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Bootsrtap Free Admin Template - SIMINTA | Admin Dashboad
	Template</title>
<!-- Core CSS - Include with every page -->
<link href="../../resources/plugins/bootstrap/bootstrap.css"
	rel="stylesheet" />
<link href="../../resources/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<link href="../../resources/plugins/pace/pace-theme-big-counter.css"
	rel="stylesheet" />
<link href="../../resources/css/style.css" rel="stylesheet" />
<link href="../../resources/css/main-style.css" rel="stylesheet" />

</head>
<body>
	<header> <%@ include file="../header.jspf"%>
	</header>
	<!--  wrapper -->
	<div id="wrapper">
		<!-- navbar top -->
		<nav class="navbar navbar-default navbar-fixed-top" role="navigation"
			id="navbar"> <!-- navbar-header --> <a class="navbar-brand"
			href="index.html"> <img src="../../resources/img/logo.png" alt="" />
		</a> <!-- navbar-top-links -->
		<ul class="nav navbar-top-links navbar-right">
			<!-- main dropdown -->
			<li class="row">
				<div class="col-xs-10" style="margin-right: 200px">
					<!-- search section-->
					<div class="input-group custom-search-form">
						<input type="text" class="form-control" placeholder="Search"
							style="width: 400px"> <input type="text"
							class="form-control" placeholder="Location" style="width: 400px">
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
					<li><a href="#"><i class="fa fa-gear fa-fw"></i>Settings</a></li>
					<li class="divider"></li>
					<li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i>Logout</a>
					</li>
				</ul> <!-- end dropdown-user --></li>
			<!-- end main dropdown -->
		</ul>
		<!-- end navbar-top-links --> </nav>
		<!-- end navbar top -->

	</div>
	<!--  page-wrapper -->
	<div class="wrap-center container">
		<div class="row">
			<!-- Page Header -->
			<div class="col-lg-10">
				<h1 class="page-header">푸드트럭 등록</h1>
			</div>
			<!--End Page Header -->
		</div>

		<div class="row">
			<div class="col-lg-10">
				<form role="form">
					<div class="form-group">
						<label>Name of Foodtruck</label> <input class="form-control"
							placeholder="Requered">
					</div>
					<div class="form-group">
						<tr>
							<td><label>Category1</label> <input class="form-control"
								placeholder="Requered"></td>
							<td><label>Category2</label> <input class="form-control"
								placeholder="Requered"></td>
							<td><label>Category3</label> <input class="form-control"
								placeholder="Requered"></td>
						</tr>

					</div>

					<div class="form-group">
						<label>Hours</label> <input type="number" class="form-control">~
						<input type="number" class="form-control">
					</div>

					<div class="form-group">
						<label>Location</label> <input class="form-control"
							placeholder="Requered">
					</div>


					<div class="form-group">
						<label>Method of Payment</label>
						<div class="checkbox">
							<label> <input type="checkbox" value="">card
							</label>
						</div>
						<div class="checkbox">
							<label> <input type="checkbox" value="">cash
							</label>
						</div>
					</div>
					<div class="form-group">
						<label>Menu</label> <select multiple class="form-control">
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
						</select>
					</div>
					<input type="text" class="form-control" placeholder="name of menu">
					<input type="text" class="form-control" placeholder="price">
					<button type="submit" class="btn btn-primary">ADD</button>
				</form>
			</div>
		</div>
	</div>

	<!-- Core Scripts - Include with every page -->
	<script src="../../resources/plugins/jquery-1.10.2.js"></script>
	<script src="../../resources/plugins/bootstrap/bootstrap.min.js"></script>
	<script src="../../resources/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="../../resources/plugins/pace/pace.js"></script>
	<script src="../../resources/scripts/siminta.js"></script>

</body>
</html>