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
		<%@ include file="../left/sellerLeft.jspf"%>
		<!--  page-wrapper -->
		<div id="page-wrapper">
			<div class="row">
				<!-- Page Header -->
				<div class="col-lg-12" style="margin-top: 20px;">
					<div class="panel panel-default panel-body">
                    	<span>
                        	<img src="${ctx }/resources/img/waikiki.jpg" style="height:250px; width:250px; margin:5px;"/>
                            	<div class="user-info">
                                	<h1>${truck.foodtruckName }</h1><br>
                                	<h5>${truck.category1 }</h5>
                                	<h5>${truck.spot }</h5>
                                	<h5><span id="followCount"></span>이 이푸드트럭을 단골로 등록했습니다.</h5>
                                	<h5>${fn:length(reviewList)} Reviews</h5>
                            	</div>
                    		</span>
                    	<span style="float:right; margin-right:50px; margin-top: 30px">
                        <button id="favoriteBtn" type="button" class="btn btn-default btn-circle btn-lg" onclick="favorite('${truck.foodtruckId }');"><i class="fa fa-heart"></i></button>
                        <a href="#"><button type="button" class="btn btn-danger">리뷰 작성</button></a>
                    </span>        
               		 </div>
				</div>
				<!--End Page Header -->

				<div class="col-md-12" style="margin-bottom: 50px">
					<div class="col-lg-8">
						<h1>Survey Detail</h1>
					</div>
					<div class="col-md-8">
						<div class="col-lg-12">
							<h2>Food</h2>
							<h4>Food항목에관한 통계입니다.</h4>
						</div>
					</div>

					<div class="col-lg-12">
						<div class="col-lg-12">
							<div class="col-lg-6">
								<!-- pie chart-->
								<div class="panel panel-default">
									<div class="panel-heading">Female</div>
									<div class="panel-body">
										<div class="flot-chart">
											<div class="flot-chart-content" id="flot-pie-chart-F"></div>
										</div>
									</div>
								</div>
								<!--end pie chart-->
							</div>
							<div class="col-lg-6">
								<!-- pie chart-->
								<div class="panel panel-default">
									<div class="panel-heading">Male</div>
									<div class="panel-body">
										<div class="flot-chart">
											<div class="flot-chart-content" id="flot-pie-chart-M"></div>
										</div>
									</div>
								</div>
								<!--end pie chart-->
							</div>
						</div>
						<div class="col-lg-12">
							<div class="col-lg-12">
								<!--Pill Tabs   -->
								<div class="panel panel-default">
									<div class="panel-heading">Pill Tabs</div>
									<div class="panel-body">
										<ul class="nav nav-pills">
											<li class="active"><a href="#10-pills" data-toggle="tab">10대</a>
											</li>
											<li><a href="#20-pills" data-toggle="tab">20대</a></li>
											<li><a href="#30-pills" data-toggle="tab">30대</a></li>
											<li><a href="#40-pills" data-toggle="tab">40대</a></li>
											<li><a href="#50-pills" data-toggle="tab">50대 이상</a></li>
										</ul>

										<div class="tab-content">
											<div class="tab-pane fade in active" id="10-pills">
												<!-- pie chart-->
												<div class="flot-chart">
													<div class="flot-chart-content" id="flot-pie-chart-10"></div>
												</div>
												<!--end pie chart-->
											</div>
											<div class="tab-pane fade" id="20-pills">
												<!-- pie chart-->
												<div class="flot-chart">
													<div class="flot-chart-content" id="flot-pie-chart-20"></div>
												</div>
												<!--end pie chart-->
											</div>
											<div class="tab-pane fade" id="30-pills">
												<!-- pie chart-->
												<div class="flot-chart">
													<div class="flot-chart-content" id="flot-pie-chart-30"></div>
												</div>
												<!--end pie chart-->
											</div>
											<div class="tab-pane fade" id="40-pills">
												<!-- pie chart-->
												<div class="flot-chart">
													<div class="flot-chart-content" id="flot-pie-chart-40"></div>
												</div>
												<!--end pie chart-->
											</div>
											<div class="tab-pane fade" id="50-pills">
												<!-- pie chart-->
												<div class="flot-chart">
													<div class="flot-chart-content" id="flot-pie-chart-50"></div>
												</div>
												<!--end pie chart-->
											</div>
										</div>
									</div>
								</div>
								<!--End Pill Tabs   -->
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