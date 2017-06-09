<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<link href="${ctx}/resources/plugins/morris/morris-0.4.3.min.css"
	rel="stylesheet" />


</head>
<body>
	<!--  wrapper -->
	<div id="wrapper">
		<%@ include file="../header.jspf"%>
		<%@ include file="../include/sellerLeft.jspf"%>
		<!--  page-wrapper -->
		<div id="page-wrapper">
			<div class="row">
				<!-- Page Header -->
               		 <%@ include file="../include/sellerProfile.jspf" %>
				<!--End Page Header -->

				<div class="col-lg-12">
					<div class="panel panel-default panel-body">
						<h1 class="page-header" style="margin-top:20px;">Survey Statics</h1>
                          
                          	<div class="col-lg-8">
                          		<div class="panel panel-success">
                          		
                          		<div class="panel-heading">
                          			설문 조사 통계
                          		</div>
                          		<div class="panel-body">
                          		 	<div class="table-responsive">
                          				<table class="table table-hover table-striped">
                          					<thead>
                          						<tr>
                          						<th>#</th>
                          						<th>설문항목</th>
                          						<th>점수</th>
                          						</tr>
                          					</thead>
                          					<tbody>
			                          			<c:choose>
			                          				<c:when test="${fn:length(avgItemList) == 0 }">
			                          					<tr><td colspan="3">등록된 설문조사가 없습니다. </td>
			                          				</c:when>
			                          				<c:otherwise>
					                                	<c:forEach var="item" items="${avgItemList }" varStatus="sts">
					                                  	 	<tr>
					                                  	 		<td>${sts.count }</td>
					                                       		<td><a href="${ctx }/itemStat.do?itemId=${item.itemId }&foodtruckId=${truck.foodtruckId}">${item.surveyId }</a> </td>
					                                        	<td>
																<span class="starRating" style="text-align:left;"><span style="width: ${item.score*20 }%">${item.score }점</span></span>
					                                        	</td>
					                                  	 	</tr>
					                                 	</c:forEach> 
			                          				</c:otherwise>
			                          			</c:choose>
                          					</tbody>
                          				</table>
                          			</div>  
                        			</div>
                          		</div>
                          	</div>
                          	<div class="col-lg-4">
                          	<div class=" panel panel-info">
                          		<div class="panel-heading">
                          			건의 사항 
                          		</div>
                          		<div class="panel-body">
                          			<ol>
	                          			<c:if test="${fn:length(avgItemList) == 0 }">
    	                      				<li>등록된 설문조사가 없습니다. </li>
    	                      			</c:if>
										<c:forEach var="comment" items="${commentList }">
											<li>${comment.suggestion }</li>
										</c:forEach>                          				
                          			</ol>
                          		</div>
                          	</div>
                          </div>
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
    <script src="${ctx }/resources/scripts/seller-profile.js"></script>
	<script>
	$(document).ready(function() {
		var state = '${truck.state}';
		stateCheck(state);
		$('#side-survey').attr('class', 'selected');

	});

	</script>
</body>

</html>