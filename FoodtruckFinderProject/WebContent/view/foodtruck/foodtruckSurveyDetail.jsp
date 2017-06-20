<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Core CSS - Include with every page -->
<link href="${ctx }/resources/plugins/bootstrap/bootstrap.css" rel="stylesheet" />
<link href="${ctx }/resources/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href="${ctx }/resources/plugins/pace/pace-theme-big-counter.css" rel="stylesheet" />
<link href="${ctx }/resources/css/style.css" rel="stylesheet" />
<link href="${ctx }/resources/css/main-style.css" rel="stylesheet" />
<link rel='stylesheet' href='${ctx }/resources/css/Nwagon.css'type='text/css'>
<!-- Page-Level CSS -->

	<!-- Core Scripts - Include with every page -->
	<script src="${ctx }/resources/plugins/jquery-1.10.2.js"></script>
	<script src="${ctx }/resources/plugins/bootstrap/bootstrap.min.js"></script>
	<script src="${ctx }/resources/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="${ctx }/resources/plugins/pace/pace.js"></script>
	<script src="${ctx }/resources/scripts/siminta.js"></script>
	
	<!-- Page-Level Plugin Scripts-->
	<script>
	$(document).ready(function() {
		var state = '${truck.state}';
		stateCheck(state);
		$('#side-survey').attr('class', 'selected');

	});

	</script>	
	<script src='${ctx }/resources/scripts/Nwagon.js'></script>
    <script src="${ctx }/resources/scripts/seller-profile.js"></script>


</head>
<body>
	<!--  wrapper -->
	<div id="wrapper">
		<%@ include file="../include/header.jspf"%>
		<%@ include file="../include/sellerLeft.jspf"%>
		<!--  page-wrapper -->
		<div id="page-wrapper">
			<div class="row">
				<%@ include file="../include/sellerProfile.jspf"%>
				<div class="col-md-12" style="margin-bottom: 50px">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">Survey 통계</h4>
						</div>
						<div class="panel-body">
							<!-- 남성 start -->
							<div class="col-lg-6">
								<!-- pie chart-->
								<div class="panel panel-default">
									<div class="panel-heading">Male</div>
									<div class="panel-body">
										<div class="panel-body">
											<div class="flot-chart">
												<div id="chart1" ></div>
												<script>
													var options = {
														'dataset' : {
															title : '남성 만족도 조사',
															values : [ ${maList[4].ages }, ${maList[3].ages }, ${maList[2].ages }, ${maList[1].ages }, ${maList[0].ages } ],
															colorset : [ '#56b4e9', '#e69f00', '#cc79a7', '#009e73', '#0072b2' ],
															fields : [ '매우 만족', '만족', '보통', '불만', '매우 불만' ]
														},
														'donut_width' : 100,
														'core_circle_radius' : 0,
														'chartDiv' : 'chart1',
														'chartType' : 'pie',
														'chartSize' : { width : 500, height : 300 }
													};

													Nwagon.chart(options);
												</script>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!--end pie chart-->
							<!-- 남성 end -->
							<!-- 여성 start -->
							<div class="col-lg-6">
								<!-- pie chart-->
								<div class="panel panel-default">
									<div class="panel-heading">Female</div>
									<div class="panel-body">
										<div class="flot-chart">
											<div id="chart"></div>
											<script>
												var options = {
													'dataset' : {
														title : 'Web accessibility status',
														values : [ ${feList[4].ages}, ${feList[3].ages}, ${feList[2].ages }, ${feList[1].ages }, ${feList[0].ages } ],
														colorset : [ '#56b4e9', '#e69f00', '#cc79a7', '#009e73', '#0072b2' ],
														fields : [ '매우 만족', '만족', '보통', '불만', '매우 불만' ]
													},
													'donut_width' : 100,
													'core_circle_radius' : 0,
													'chartDiv' : 'chart',
													'chartType' : 'pie',
													'chartSize' : { width : 500, height : 300 }
												};

												Nwagon.chart(options);
											</script>
										</div>
									</div>
								</div>
								<!--end pie chart-->
							</div>
							<!-- 여성 end -->
							<!-- 연령별 start -->
							<div class="col-lg-12">
								<!--Basic Tabs   -->
								<div class="panel panel-default">
									<div class="panel-heading">나이대별</div>
									<div class="panel-body">
										<ul class="nav nav-tabs">
											<li class="active"><a href="#chart2" data-toggle="tab">10대</a></li>
											<li><a href="#chart3" data-toggle="tab">20대</a></li>
											<li><a href="#chart4" data-toggle="tab">30대</a></li>
											<li><a href="#chart5" data-toggle="tab">40대</a></li>
											<li><a href="#chart6" data-toggle="tab">50대이상</a></li>
										</ul>
										<div class="tab-content">
											<div class="tab-pane fade in active" id="chart2">
												<!-- pie chart-->
												<script>
														var options = {
															'dataset' : {
																title : 'Web accessibility status',
																values : [ ${list10[4].count },  ${list10[3].count},  ${list10[2].count},
																	 ${list10[1].count},  ${list10[0].count} ],
																		colorset : [ '#56b4e9', '#e69f00', '#cc79a7', '#009e73', '#0072b2' ],
																		fields : [ '매우 만족', '만족', '보통', '불만', '매우 불만' ]
																	},
																	'donut_width' : 100,
																	'core_circle_radius' : 0,
																	'chartDiv' : 'chart2',
																	'chartType' : 'pie',
																	'chartSize' : { width : 500, height : 300 }
																};

																Nwagon.chart(options);
													</script>
												<!--end pie chart-->
											</div>
											<div class="tab-pane fade" id="chart3">
												<!-- pie chart-->
												<script>
														var options = {
															'dataset' : {
																title : 'Web accessibility status',
																values : [ ${list20[4].count },  ${list20[3].count},  ${list20[2].count},
																	 ${list20[1].count},  ${list20[0].count} ],
																		colorset : [ '#56b4e9', '#e69f00', '#cc79a7', '#009e73', '#0072b2' ],
																		fields : [ '매우 만족', '만족', '보통', '불만', '매우 불만' ]
																	},
																	'donut_width' : 100,
																	'core_circle_radius' : 0,
																	'chartDiv' : 'chart3',
																	'chartType' : 'pie',
																	'chartSize' : { width : 500, height : 300 }
																};

																Nwagon.chart(options);
													</script>
												<!--end pie chart-->
											</div>
											<div class="tab-pane fade" id="chart4">
												<!-- pie chart-->
												<script>
														var options = {
															'dataset' : {
																title : 'Web accessibility status',
																values :  [ ${list30[4].count },  ${list30[3].count},  ${list30[2].count},
																	 ${list30[1].count},  ${list30[0].count} ],
																		colorset : [ '#56b4e9', '#e69f00', '#cc79a7', '#009e73', '#0072b2' ],
																		fields : [ '매우 만족', '만족', '보통', '불만', '매우 불만' ]
																	},
																	'donut_width' : 100,
																	'core_circle_radius' : 0,
																	'chartDiv' : 'chart4',
																	'chartType' : 'pie',
																	'chartSize' : { width : 500, height : 300 }
																};

																Nwagon.chart(options);
													</script>
												<!--end pie chart-->
											</div>
											<div class="tab-pane fade" id="chart5">
												<!-- pie chart-->
												<script>
														var options = {
															'dataset' : {
																title : 'Web accessibility status',
																values :  [ ${list40[4].count },  ${list40[3].count},  ${list40[2].count},
																	 ${list40[1].count},  ${list40[0].count} ],
																		colorset : [ '#56b4e9', '#e69f00', '#cc79a7', '#009e73', '#0072b2' ],
																		fields : [ '매우 만족', '만족', '보통', '불만', '매우 불만' ]
																	},
																	'donut_width' : 100,
																	'core_circle_radius' : 0,
																	'chartDiv' : 'chart5',
																	'chartType' : 'pie',
																	'chartSize' : { width : 500, height : 300 }
																};

																Nwagon.chart(options);
													</script>
												<!--end pie chart-->
											</div>
											<div class="tab-pane fade" id="chart6">
												<!-- pie chart-->
												<script>
														var options = {
															'dataset' : {
																title : 'Web accessibility status',
																values : [ ${list50[4].count },  ${list50[3].count},  ${list50[2].count},
																	 ${list50[1].count},  ${list50[0].count} ],
																		colorset : [ '#56b4e9', '#e69f00', '#cc79a7', '#009e73', '#0072b2' ],
																		fields : [ '매우 만족', '만족', '보통', '불만', '매우 불만' ]
																	},
																	'donut_width' : 100,
																	'core_circle_radius' : 0,
																	'chartDiv' : 'chart6',
																	'chartType' : 'pie',
																	'chartSize' : { width : 500, height : 300 }
																};

																Nwagon.chart(options);
													</script>
												<!--end pie chart-->
											</div>
										</div>
									</div>
								</div>
								<!--End Basic Tabs   -->
							</div>
							<!-- 연령 end -->
						</div>



						</div>
					</div>
				</div>

			</div>
		<!-- end page-wrapper -->
	</div>
	<!-- end wrapper -->

</body>

</html>