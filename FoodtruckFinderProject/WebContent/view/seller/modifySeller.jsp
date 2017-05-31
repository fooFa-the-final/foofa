<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<c:set value="${pageContext.request.contextPath}" var="ctx" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>판매자 수정</title>
<!-- Core CSS - Include with every page -->
<link href="${ctx}/resources/plugins/bootstrap/bootstrap.css"
	rel="stylesheet" />
<link href="${ctx}/resources/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<link href="${ctx}/resources/plugins/pace/pace-theme-big-counter.css"
	rel="stylesheet" />
<link href="${ctx}/resources/css/style.css" rel="stylesheet" />
<link href="${ctx}/resources/css/main-style.css" rel="stylesheet" />
</head>
<body>

	<header>
		<%@ include file="../header.jspf"%>
	</header>
	<div class="col-lg-6">
		<h2>Modify your Info</h2>
		<form role="form" action="${ctx }/seller/modify.do" method="post">
			<div class="form-group">
				<label>ID</label> <b class="form-control">${seller.sellerId }</b>
			</div>
			<div class="form-group">
				<label>비밀번호 변경</label> <input class="form-control" id="password" name="password"
				type="password"	placeholder="비밀번호를 입력해 주세요"> 
				<br> 
				<input
					class="form-control" id="password1" placeholder="변경하실 비밀번호를 입력해주세요">

				<br> 
				<input type="password" class="form-control" id="password" placeholder="변경하실 비밀번호를 입력해주세요"> 
					<br>
			</div>

			<div class="form-group">
				<label>Business Registration Number</label> <input type="number" name="certification"
				id="certification"	class="form-control" placeholder="${seller.certification }">
			</div>

			<div class="form-group">
				<label>Phone</label> <input id="phone" name="phone" type="number" name="phone"
		id="phone"	class="form-control" placeholder="${seller.phone }">
			</div>

			<button type="submit" class="btn btn-primary">Modify</button>
		</form>
	</div>
	<!-- Core Scripts - Include with every page -->
	<script src="${ctx}/resources/plugins/jquery-1.10.2.js"></script>
	<script src="${ctx}/resources/plugins/bootstrap/bootstrap.min.js"></script>
	<script src="${ctx}/resources/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="${ctx}/resources/plugins/pace/pace.js"></script>
	<script src="${ctx}/resources/scripts/siminta.js"></script>

</body>
</html>