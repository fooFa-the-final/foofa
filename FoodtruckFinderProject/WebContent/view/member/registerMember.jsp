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
						<img src="${ctx }/resources/img/logo.png" alt="" />
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
				<br>
				<br>


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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	//아이디  중복 확인 버튼 클릭
	$(document).ready(function() {
	$("#idCheck").click(function() {
		var id = $("#id").val();
		$.ajax({
			type : 'POST',
			url : "${ctx }/member/checkId.do",
			data : {
				id : id
			},
			success : function(data) {
				$("#result").html(data);
				if ($.trim(data) == 'no') {
					$('#idmessage').html("사용 가능한 ID 입니다.");
				} else {
					$('#idmessage').html("사용중인 ID 입니다.");
				}

			}

		});
	});
	});
	
</script>
</body>
<br>
<br>
<br>
<div class="col-lg-12">
	<br>
	<text style="float: right;" />
	판매자로 가입하고싶으세요?? <a href="${ctx }/seller/create.do" target="_blank">판매자가입</a>
</div>
<div id="Register">
	<b><font size="6">Join With us</font></b>
</div>
<br>
<br>
<form action="${ctx }/member/create.do" method="post">
	<div class="container">
		<div class="row" id="Truck">

			<b><font size="4">ID</font></b> <br> <input id="id"
				type="text" name="memberId">
			<button type="button" id="idCheck">중복확인</button>
			<div id="idmessage">
				<br>
			</div>
			<b><font size="4">Password</font></b> <br> <input id="password"
				type="password" name="password"> <br> <br> <b><font
				size="4">Confirm Password</font></b> <br> <input id="password1"
				type="password" name="ps2"> <br><br>
		    <b><font size="4">Email</font></b>
			<br> 
			<input id="email" type="text" name="email"> <br>
			<br> 
			<b><font size="4">BirthDay</font></b> <br> 
			<input id="birthday" type="text" name="birthday"><br>
			<br>
			<div>
				<label>성별</label><br> <label class="radio-inline"> <input
					type="radio" name="gender" id="gender" value="F">F
				</label> <label class="radio-inline"> <input type="radio"
					name="gender" id="gender" value="M">M
				</label>
			</div>
			<div class="col-md-offset-5 col-sm-25 col-lg-25">


				<input type="submit" value="register" class="btn btn-primary">
			</div>
		</div>
	</div>
</form>
</html>
