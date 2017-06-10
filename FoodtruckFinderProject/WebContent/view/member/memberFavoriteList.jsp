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
				<div class="col-lg-8">
	                <div class="panel panel-default">
                        <div class="panel-heading">
                			<h4 class="panel-title">Favorite List</h4>
                        </div>
                        <div class="panel-body">
							<c:forEach var="truck" items="${trucks}" varStatus="sts">
								<div id="${truck.foodtruckId }" >
									<ul class="list-inline" style="width:100%; padding:0px 0px 15px; border-bottom:1px solid #eee;">
										<li><img src="${ctx }/resources/img/truck/${truck.foodtruckImg }" style="height: 100px; width: 100px" /></li>
										<li style="width:50%;"><a href="${ctx }/review/list/truck.do?foodtruckId=${truck.foodtruckId }"><b style="font-size:1.2em;">${truck.foodtruckName }</b></a><br><br>
											<i class="fa fa-heart"> &nbsp;</i>단골 : &nbsp; ${truck.favoriteCount } &nbsp; <i class="fa fa-pencil"> &nbsp;</i>리뷰 : &nbsp;${truck.reviewCount  }
										</li>
										<li><button id="delete" type="button" class="btn btn-info btn-outline" onclick="location.href='${ctx}/favorite/list.do?memberId=${follow.memberId }'">위치 보기</button></li>
										<c:if test="${loginUserId eq member.memberId }">
										<li><button id="delete" type="button" class="btn btn-danger btn-outline" onclick="unfavorite('${truck.foodtruckId }');">단골해제</button></li>
										</c:if>
									</ul>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="col-lg-4" id="map" style="height:300px;">
	                <div class="panel panel-default">
				        <div class="panel-heading">
	               			<h4 class="panel-title">Location</h4>
	                    </div>
	                    <div class="panel-body"  style="height:300px;">
	                    	<h1>map!!!</h1>
	                    </div>
	                </div>
				</div>
			</div>
			<!-- end page-wrapper -->
		</div>
		<!-- end wrapper -->
	</div>
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
