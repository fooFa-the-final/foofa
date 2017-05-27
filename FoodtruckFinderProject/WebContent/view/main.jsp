<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<c:set value="${pageContext.request.contextPath}" var="ctx" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FoodtruckMain</title>
<!-- Core CSS - Include with every page -->
<link href="../resources/plugins/bootstrap/bootstrap.css"
	rel="stylesheet" />
<link href="../resources/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<link href="../resources/plugins/pace/pace-theme-big-counter.css"
	rel="stylesheet" />
<link href="../resources/css/style.css" rel="stylesheet" />
<link href="../resources/css/main-style.css" rel="stylesheet" />

</head>

<body class="main-body">
	<!-- navbar top -->

	<nav class=" main-head-top" role="navigation" id="navbar">
		<!-- navbar-header -->
		<br>
		<div class="col-lg-12 top-head-menu" style="">
			<span style="float: right; margin: 20px 30px 0 0;">
			<button type="button" class="btn btn-link loginBtn">Log in</button>
			<button type="button" class="btn btn-outline btn-danger signUpBtn">Sign up</button>
			</span>
		</div>
		<ul class="nav navbar-top-links navbar-main-links navbar-center">
			<li class="row">
				<div class="col-lg-12">
					<a class="navbar-brand" style="align: center"
						href="${ctx }/index.do"> <img src="../resources/img/mainLogo.png"
						alt="" />
					</a>
				</div>
			</li>
			<li class="row">
				<div class="col-lg-12">
					<!-- search section-->
					<div class="input-group custom-search-form">
						<input type="text" class="form-control" placeholder="Search"
							style="width: 400px"> <input type="text"
							class="form-control" placeholder="Location" style="width: 400px">
						<button class="btn btn-danger searchBtn" type="button">
							<i class="fa fa-search"></i>
						</button>
					</div>
					<!--end search section-->
				</div>
			</li>
			<li class="row" style="display: block; float: bottom">
				<div id="col-lg-12">
					<img class="main_img_person" src="../resources/img/user.jpg" />
				</div>
			</li>

		</ul>
		<!-- navbar-top-links -->
	</nav>
	<!-- end navbar top -->

	<!--  main-container -->
	<div class="main-container">
				<h3 class="page-header">Foodtruck Finder</h3>
		<div class="row">
				<h4>How about this?</h4>
				<div class="col-lg-4">
					<div class="panel panel-danger">
						<div class="panel-header">
							<img src="../resources/img/waikiki.jpg" />
						</div>
						<div class="panel-body">
							푸드트럭 이름 <br> 평점 별별별 <br> 리뷰수 : 144
						</div>
					</div>
				
				</div>
				<div class="col-lg-4">
					<div class="panel panel-danger">
						<div class="panel-header">
							<img src="../resources/img/twiceprofile.jpg" />
						</div>
						<div class="panel-body">
							푸드트럭 이름 <br> 평점 별별별 <br> 리뷰수 : 144
						</div>
					</div>
				
				</div>
				<div class="col-lg-4">
					<div class="panel panel-danger">
						<div class="panel-header">
							<img src="../resources/img/waikiki.jpg" />
						</div>
						<div class="panel-body">
							푸드트럭 이름 <br> 평점 별별별 <br> 리뷰수 : 144
						</div>
					</div>
				
				</div>
		</div>
				<div class="row">
				<h4>Hot Reviews</h4>
				<div class="col-lg-4">
					<div class="panel panel-danger">
						<div class="panel-header">
							<img src="../resources/img/waikiki.jpg" />
						</div>
						<div class="panel-body">
							푸드트럭 이름 <br> 평점 별별별 <br> 리뷰수 : 144
						</div>
					</div>
				
				</div>
				<div class="col-lg-4">
					<div class="panel panel-danger">
						<div class="panel-header">
							<img src="../resources/img/twiceprofile.jpg" />
						</div>
						<div class="panel-body">
							푸드트럭 이름 <br> 평점 별별별 <br> 리뷰수 : 144
						</div>
					</div>
				
				</div>
				<div class="col-lg-4">
					<div class="panel panel-danger">
						<div class="panel-header">
							<img src="../resources/img/waikiki.jpg" />
						</div>
						<div class="panel-body">
							푸드트럭 이름 <br> 평점 별별별 <br> 리뷰수 : 144
						</div>
					</div>
				
				</div>
		</div>
				<div class="row">
				<h4>Nearlest Foodtrucks</h4>
				<div class="col-lg-4">
					<div class="panel panel-danger">
						<div class="panel-header">
							<img src="../resources/img/waikiki.jpg" />
						</div>
						<div class="panel-body">
							푸드트럭 이름 <br> 평점 별별별 <br> 리뷰수 : 144
						</div>
					</div>
				
				</div>
				<div class="col-lg-4">
					<div class="panel panel-danger">
						<div class="panel-header">
							<img src="../resources/img/twiceprofile.jpg" />
						</div>
						<div class="panel-body">
							푸드트럭 이름 <br> 평점 별별별 <br> 리뷰수 : 144
						</div>
					</div>
				
				</div>
				<div class="col-lg-4">
					<div class="panel panel-danger">
						<div class="panel-header">
							<img src="../resources/img/waikiki.jpg" />
						</div>
						<div class="panel-body">
							푸드트럭 이름 <br> 평점 별별별 <br> 리뷰수 : 144
						</div>
					</div>
				
				</div>
		</div>
	</div>
	<!-- end main-container -->
    <!-- Core Scripts - Include with every page -->
    <script src="${ctx}/resources/plugins/jquery-1.10.2.js"></script>
    <script src="${ctx}/resources/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="${ctx}/resources/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${ctx}/resources/plugins/pace/pace.js"></script>
    <script src="${ctx}/resources/scripts/siminta.js"></script>

</body>
</html>
