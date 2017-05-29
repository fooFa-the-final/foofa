<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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

	<header>
		<%@ include file="../header.jspf"%>
	</header>
	<div class="col-lg-6">
		<h2>Modify your Info</h2>
		<form role="form" action="${ctx }/seller/modify.do" method="post">
			<div class="form-group">
				<label>ID</label> <input class="form-control" placeholder="${seller.sellerId }">
			</div>
			<div class="form-group">
				<label>Password</label>
				<p>비밀번호 변경</p>
			</div>

			<div class="form-group">
				<label>Business Registration Number</label> <input type="number"
					class="form-control" placeholder="">
			</div>

			<div class="form-group">
				<label>Phone</label> 
				<input id="phone" name="phone" type="number" class="form-control" placeholder="">
			</div>

			<button type="submit" class="btn btn-primary">Modify</button>
		</form>
	</div>
	<!-- Core Scripts - Include with every page -->
	<script src="../../resources/plugins/jquery-1.10.2.js"></script>
	<script src="../../resources/plugins/bootstrap/bootstrap.min.js"></script>
	<script src="../../resources/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="../../resources/plugins/pace/pace.js"></script>
	<script src="../../resources/scripts/siminta.js"></script>

</body>
</html>