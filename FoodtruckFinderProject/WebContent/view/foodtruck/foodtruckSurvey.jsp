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
				<div class="col-lg-12" style="margin-top: 20px;">
					<div class="panel panel-default panel-body">
                        	<div class="col-lg-4" style=""><img src="${ctx }/resources/img/waikiki.jpg" style="height:250px; width:250px;"/></div>
                            	<div class="col-lg-8 user-info">
                            		<div style="width:100%">
                                		<span><b>${truck.foodtruckName }</b></span>
                                		<span style="float:right;">
                        			   <button id="favoriteBtn" type="button" class="btn btn-default btn-circle btn-lg" onclick="favorite('${truck.foodtruckId }');"><i class="fa fa-heart"></i></button>
                       						 <a href="#"><button type="button" class="btn btn-danger">리뷰 작성</button></a>    </span>                     		
                            		</div>
                                	<h5>${truck.category1 }</h5>
                                	<h5>${truck.spot }</h5>
                                	<h5><span id="followCount"></span>이 이푸드트럭을 단골로 등록했습니다.</h5>
                                	<h5>${fn:length(reviewList)} Reviews</h5>
                            	</div>
                    	<span style="float:right; margin-right:50px; margin-top: 30px">

                    </span>        
               		 </div>
				</div>
				<!--End Page Header -->

				<div class="col-lg-12">
					<div class="panel panel-default panel-body">
						<h1 class="page-header" style="margin-top:20px;">Survey Statics</h1>
						<div class="col-lg-10">
                          <h2>Score</h2>
                          <div class="col-lg-8" style="float: left">
                              <table>
                              <thead>
                                  <tr>
                                      <th width="150px"></th>
                                      <th></th>
                                  </tr>
                              </thead>
                               <tbody>
                               	<c:forEach var="item" items="${avgItemList }">
                                   <tr>
                                       <td><a href="${ctx }/itemStat.do?itemId=${item.itemId }&foodtruckId=${truck.foodtruckId}">${item.surveyId }</a> </td>
                                        <td>
											<span class="starRating" style="text-align:left;"><span style="width: ${item.score*20 }%">${item.score }점</span></span>
                                        </td>
                                   </tr>
                                 </c:forEach>
                               </tbody>
                           </table>
                          </div>
                      </div>
						<div class="col-lg-10">
                          <h2>Comments</h2>
                          <div class="col-lg-8" style="float: left">
                              <table>
                              <thead>
                                  <tr>
                                      <th width="150px"></th>
                                      <th></th>
                                  </tr>
                              </thead>
                               <tbody>
                               	<c:forEach var="comment" items="${commentList }">
                                   <tr>
                                       <td>${comment.suggestion }</td>
                                   </tr>
                                 </c:forEach>
                               </tbody>
                           </table>
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
	<script src="${ctx}/resources/plugins/flot/jquery.flot.js"></script>
	<script src="${ctx}/resources/plugins/flot/jquery.flot.tooltip.min.js"></script>
	<script src="${ctx}/resources/flot/jquery.flot.resize.js"></script>
	<script src="${ctx}/resources/flot/jquery.flot.pie.js"></script>
	<script src="${ctx}/resources/scripts/flot-demo.js"></script>
</body>

</html>