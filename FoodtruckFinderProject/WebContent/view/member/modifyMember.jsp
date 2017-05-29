<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Bootsrtap Free Admin Template - SIMINTA | Admin Dashboad
	Template</title>
<!-- Core CSS - Include with every page -->
<link href="../../resources/plugins/bootstrap/bootstrap.css" rel="stylesheet" />
<link href="../../resources/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href="../../resources/plugins/pace/pace-theme-big-counter.css"
	rel="stylesheet" />
<link href="../../resources/css/style.css" rel="stylesheet" />
<link href="../../resources/css/main-style.css" rel="stylesheet" />



</head>
<body>
	<header><%@ include file="../header.jspf"%></header>

	
	</dir>

	<div class="col-lg-6">
		<h2>Modify your Info</h2>
		<form role="form">
			<div class="form-group">
				<label>ID</label> <input class="form-control" placeholder="Requered">
			</div>
			<div class="form-group">
				<label>Password</label>
				<p>비밀번호 변경</p>
			</div>

			<div class="form-group">
				<label>Email</label> <input type=email class="form-control"
					placeholder="Requered">
			</div>



			<div class="form-group">
				<label>Gender</label>
				<div class="checkbox">
					<label> <input type="checkbox" value="">Female
					</label>
				</div>
				<div class="checkbox">
					<label> <input type="checkbox" value="">Male
					</label>
				</div>
			</div>
			<div class="form-group">
				<label>Gender</label> <input type="date" class="form-control"
					value="">
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