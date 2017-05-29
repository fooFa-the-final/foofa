<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>


<head>
<c:set value="${pageContext.request.contextPath}" var="ctx" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FooFa Login</title>
<!-- Core CSS - Include with every page -->
<link href="${ctx}/resources/plugins/bootstrap/bootstrap.css"
	rel="stylesheet" />
<link href="${ctx}/resources/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<link href="${ctx}/resources/plugins/pace/pace-theme-big-counter.css"
	rel="stylesheet" />
<link href="${ctx}/resources/css/style.css" rel="stylesheet" />
<link href="${ctx}/resources/css/main-style.css" rel="stylesheet" />

<!-- Page-Level CSS -->
<link href="resources/plugins/dataTables/dataTables.bootstrap.css"
	rel="stylesheet" />

<c:set var="ctx">${pageContext.request.contextPath }</c:set>
</head>

<style>
#indexMain {
	margin: 60px;
}

#indexbody {
	margin-left: 350px;
}

#Register {
	margin-left: 330px;
}

#Truck {
	margin-left: 200px;
}

#Location {
	margin-left: 700px;
}
}
</style>

<body>

	<!--  wrapper -->
	<div id="wrapper">
		<!-- navbar top -->

		<nav class="navbar navbar-default navbar-fixed-top" role="navigation"
			id="navbar">
			<!-- navbar-header -->
			<br>

			<ul class="nav navbar-top-links navbar-right">
				<div class="col-xs-10" style="margin-right: 550px">
					<a class="navbar-brand" style="float: center" href="index.html">
						<img src="../../resources/img/MainLogo.png" alt="" />
					</a>
				</div>
			</ul>
			<!-- navbar-top-links -->
			<ul class="nav navbar-top-links navbar-right">
				<li class="row">
					<div class="col-xs-10" style="margin-right: 350px">
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
			</ul>
		</nav>
		<!-- end navbar top -->

		<!-- Core Scripts - Include with every page -->


		<!-- end page-wrapper -->

	</div>
	<!-- end wrapper -->

	<!-- Core Scripts - Include with every page -->

	<script src="assets/plugins/jquery-1.10.2.js"></script>
	<script src="assets/plugins/bootstrap/bootstrap.min.js"></script>
	<script src="assets/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="assets/plugins/pace/pace.js"></script>
	<script src="assets/scripts/siminta.js"></script>

</body>
<br>
<br>
<br>
<br>
<br>
<div id="Register">
	<u><font size="6">Join With us as Seller</font></u>
</div>
<div id="indexbody" class="col-lg-12">
	<h5>
		판매자 가입페이지입니다. <a href="">회원가입페이지</a>
	</h5>
</div>
<br>
<br>
<div class="container">
	<div class="row" id="Truck">

<form action="${ctx }/seller/create.do" method="post">
		<b> <font size="4">ID</font></b> <br> 
		<input id="sellerId1" type="text">
		<button type="button" id="idCheck">아이디중복체크</button>
		<div id="idmessage">
		
	<input id="sellerId"  name="sellerId" class="form-control" type="text" value="" placeholder="ID를 입력해주세요.">
		
		
			<br>
		</div>
		<div>
		<b> 
		<font size="4">Password</font></b> <br> 
		<input id="password" name="password" class="form-control" type="password" name="ps1"> 
		<br> <br> 
		<b>
		<font size="4">Confirm Password</font></b> <br> 
		<input id="password1"  type="password" name="ps2"><b><font size="4"></font></b> <br>
		<br>
		 <b><font size="4">Business Registration Number</font></b> <br>
		<input id="certification" name="certification" class="form-control" type="text" name="ps1"> 
		<br> <br>
		<b><font size="4">Phone</font></b> <br> 
		<input id="phone" name="phone" type="text"  class="form-control" name="phone"> <br> <br>
		<div class="col-md-offset-5 col-sm-25 col-lg-25">
			<input type="submit" value="등록" class="btn btn-primary">
		</div>
		</div>
</form>
	</div>




	<br> <br>
</div>
</html>
