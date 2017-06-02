<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Foodtruck Finder</title>
    <!-- Core CSS - Include with every page -->
    <link href="${ctx }/resources/plugins/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="${ctx }/resources/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="${ctx }/resources/plugins/pace/pace-theme-big-counter.css" rel="stylesheet" />
    <link href="${ctx }/resources/css/style.css" rel="stylesheet" />
      <link href="${ctx }/resources/css/main-style.css" rel="stylesheet" />

</head>

<body>
    <!--  wrapper -->
    
	<div id="wrapper">
		<header>
			<%@ include file="../header.jspf"%>
		</header>

		<%@ include file="../left/sellerLeft.jspf"%>
        <!--  page-wrapper -->
        <div id="page-wrapper" style="margin-top:80px">
           	<div class="col-lg-6">
		<h2>Modify your Info</h2>
		<form role="form" action="${ctx }/seller/modify.do" method="post">
			<div class="form-group">
				<label>ID</label> <b class="form-control"><input type="hidden" class="form-control" name="sellerId" value="${seller.sellerId }">${seller.sellerId }</b>
			</div>
			<div class="form-group">
				<label>비밀번호 변경</label> 
				<input class="form-control" id="password" name="password" type="password" value="${seller.password }" placeholder="비밀번호를 입력해 주세요"> 
				<br> 
			</div>
<br>
			<div class="form-group">
				<label>Business Registration Number</label> <input type="number" name="certification" class="form-control"
				id="certification"	value="${seller.certification }" placeholder="${seller.certification }">
			</div>

			<div class="form-group">
				<label>Phone</label><br>
				 <input id="phone" name="phone" type="number" name="phone" class="form-control"
		id="phone"	value="${seller.phone }" placeholder="${seller.phone }">
			</div>

			<button type="submit" class="btn btn-primary">Modify</button>
		</form>
	</div>
        </div>
        <!-- end page-wrapper -->
        
    </div>
    <!-- end wrapper -->

    <!-- Core Scripts - Include with every page -->
    <script src="${ctx }/resources/plugins/jquery-1.10.2.js"></script>
    <script src="${ctx }/resources/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="${ctx }/resources/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${ctx }/resources/plugins/pace/pace.js"></script>
    <script src="${ctx }/resources/scripts/siminta.js"></script>
	<script>
		$(document).ready(function() {
			$('#side-modify-seller').attr('class', 'selected');
		})
	</script>
</body>

</html>