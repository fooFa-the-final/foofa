<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<c:set value="${pageContext.request.contextPath}" var="ctx" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>팔로우리스트</title>
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
<body>
   <div id="wrapper">

		<%@ include file="../include/header.jspf"%>
		<%@ include file="../include/memberLeft.jspf"%>
		<!--  page-wrapper -->
		<div id="page-wrapper">
				<div class="row">
              		<!-- Page Header -->
 					<%@ include file="../include/memberProfile.jspf" %>
            	    <!--End Page Header -->
				</div>

			<div class="row">
					<div class="col-lg-12">
					<h1>Favorite List</h1>
					<c:forEach var="truck" items="${trucks}" varStatus="sts">
						<div id="${truck.foodtruckId }" style="margin-bottom: 50px">
							<a class="navbar-brand" href="#"
								style="margin-top: 10px; margin-left: 20px"> <img
								src="${ctx }/resources/img/truck/${truck.foodtruckImg }"
								style="height: 70px; width: 70px" />
							</a>
							<div class="user-info">
								<p>
									<a href="${ctx }/review/list/truck.do?foodtruckId=${truck.foodtruckId }">${truck.foodtruckName }</a>
								</p>
								<br>
								<h5>${truck.favoriteCount } Favorite</h5>
								<h5>${truck.reviewCount } Reviews</h5>
								<br>
							</div>
							<c:if test="${loginUserId eq member.memberId }">
							<div style="float: right; vertical-align: middle;">
								
								<button type="button" class="btn btn-default"
									onclick="unfavorite('${truck.foodtruckId }');">Unfavorite</button>
							</div></c:if>
							</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<!-- end page-wrapper -->

	</div>
	<!-- end wrapper -->

	<!-- Core Scripts - Include with every page -->
	<script src="${ctx}/resources/plugins/jquery-1.10.2.js"></script>
	<script src="${ctx}/resources/plugins/bootstrap/bootstrap.min.js"></script>
	<script src="${ctx}/resources/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="${ctx}/resources/plugins/pace/pace.js"></script>
	<script src="${ctx}/resources/scripts/siminta.js"></script>

	<!-- Page-Level Plugin Scripts-->
    <script src="${ctx}/resources/scripts/profile.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="http://malsup.github.com/jquery.form.js"></script> 
	<script>

			var unfavorite = function(foodtruckId) {
					
					$.ajax({
						type : 'GET',
						url : "${ctx }/favorite/remove.do",
						data : {
							foodtruckId : foodtruckId
						},
						success : function(data) {
							$("#"+foodtruckId).remove();
						}
					});
			}
			
	        $(document).ready(function () {
				$('#side-favorite').attr('class', 'selected');
				if ('${loginUserId}' !=''){
					followExist('${member.memberId}');
				}
	        });
	</script>

</body>

</html>
