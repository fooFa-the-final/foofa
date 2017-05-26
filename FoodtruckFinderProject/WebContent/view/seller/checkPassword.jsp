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
<link href="../../resources/plugins/bootstrap/bootstrap.css"
	rel="stylesheet" />
<link href="../../resources/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<link href="../../resources/plugins/pace/pace-theme-big-counter.css"
	rel="stylesheet" />
<link href="../../resources/css/style.css" rel="stylesheet" />
<link href="../../resources/css/main-style.css" rel="stylesheet" />

<style type="text/css">
.col-lg-6 {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 300px;
	height: 200px;
	overflow: hidden;
	margin-top: -150px;
	margin-left: -100px;
}
</style>

</head>
<body>
	<header>
		<%@ include file="view/user/header.jspf"%>
	</header>
	<div class="col-lg-6">
		<form role="form">
			<div class="form-group">
				<label>Password</label> <input class="form-control"
					placeholder="Requered">

				<button type="submit" class="btn btn-primary">submit</button>
			</div>
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