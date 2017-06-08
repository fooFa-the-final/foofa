<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Core CSS - Include with every page -->
<link href="${ctx }/resources/plugins/bootstrap/bootstrap.css"
	rel="stylesheet" />
<link href="${ctx }/resources/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<link href="${ctx }/resources/plugins/pace/pace-theme-big-counter.css"
	rel="stylesheet" />
<link href="${ctx }/resources/css/style.css" rel="stylesheet" />
<link href="${ctx }/resources/css/main-style.css" rel="stylesheet" />
<!-- Page-Level CSS -->
<link href="${ctx }/resources/plugins/morris/morris-0.4.3.min.css"
	rel="stylesheet" />
<link rel='stylesheet' href='${ctx }/resources/css/Nwagon.css'
	type='text/css'>
<script src='${ctx }/resources/scripts/Nwagon.js'></script>


</head>
<body>
	<!--  wrapper -->

	<div id="wrapper">
		<%@ include file="../header.jspf"%>

		<%@ include file="../include/sellerLeft.jspf"%>
		<!-- end sidebar-collapse -->
		</nav>
		<!-- end navbar side -->
		<!--  page-wrapper -->
		<div id="page-wrapper" style="margin-top: 80px">
			<div class="row">
				<!-- Page Header -->
				<div class="col-md-12"
					style="background-color: white; height: 300px">
					<span> <a class="navbar-brand" href="#"
						style="margin-top: 10px;"> <img
							src="../../resources/img/waikiki.jpg"
							style="height: 250px; width: 250px" />
					</a>
						<div class="user-info">
							<h1>WAIKIKI JEJU</h1>
							<br>
							<h5>양식</h5>
							<h5>제주시</h5>
							<h5>144Followers</h5>
							<h5>255Reviews</h5>
						</div>
					</span> <span style="float: right; margin-right: 30px; margin-top: 30px">
						<a href="#"><button type="button" class="btn btn-default">판매자
								정보 수정</button></a> <a href="#"><button type="button"
								class="btn btn-default">판매자 탈퇴</button></a>
					</span>
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
											<div id="chart"></div>
											<script>
												var options = {
													'dataset' : {
														title : 'Web accessibility status',
														values : [ ${feList[4].ages }, ${feList[3].ages }, ${feList[2].ages },
															${feList[1].ages }, ${feList[0].ages } ],
														colorset : [ '#56b4e9',
																'#e69f00',
																'#cc79a7',
																'#009e73',
																'#0072b2' ],
														fields : [ '5', '4',
																'3', '2', '1' ]
													},
													'donut_width' : 100,
													'core_circle_radius' : 0,
													'chartDiv' : 'chart',
													'chartType' : 'pie',
													'chartSize' : {
														width : 600,
														height : 300
													}
												};

												Nwagon.chart(options);
											</script>
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
											<div class="panel-body">
												<div class="flot-chart">
													<div id="chart1" />
													<script>
														var options = {
															'dataset' : {
																title : 'Web accessibility status',
																values : [ ${maList[4].ages }, ${maList[3].ages }, ${maList[2].ages },
																	${maList[1].ages }, ${maList[0].ages } ],
																colorset : [
																		'#56b4e9',
																		'#e69f00',
																		'#cc79a7',
																		'#009e73',
																		'#0072b2' ],
																fields : [ '5',
																		'4',
																		'3',
																		'2',
																		'1' ]
															},
															'donut_width' : 100,
															'core_circle_radius' : 0,
															'chartDiv' : 'chart1',
															'chartType' : 'pie',
															'chartSize' : {
																width : 600,
																height : 300
															}
														};

														Nwagon.chart(options);
													</script>
												</div>
											</div>
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
													<div class="panel-body">
														<div class="flot-chart">
															<div id="chart10" />
															<script>
																var options = {
																	'dataset' : {
																		title : 'Web accessibility status',
																		values : [
																				18,
																				12,
																				3,
																				10,
																				7 ],
																		colorset : [
																				'#56b4e9',
																				'#e69f00',
																				'#cc79a7',
																				'#009e73',
																				'#0072b2' ],
																		fields : [
																				'A',
																				'B',
																				'C',
																				'D',
																				'E' ]
																	},
																	'donut_width' : 100,
																	'core_circle_radius' : 0,
																	'chartDiv' : 'chart10',
																	'chartType' : 'pie',
																	'chartSize' : {
																		width : 600,
																		height : 300
																	}
																};

																Nwagon
																		.chart(options);
															</script>
														</div>
													</div>
												</div>
												<!--end pie chart-->
											</div>
											<div class="tab-pane fade" id="20-pills">
												<!-- pie chart-->
												<div class="flot-chart">
													<div class="flot-chart-content" id="flot-pie-chart-20">
														<div class="panel-heading">Female</div>
														<div class="panel-body">
															<div class="flot-chart">
																<div id="chart20" />
																<script>
																	var options = {
																		'dataset' : {
																			title : 'Web accessibility status',
																			values : [
																					8,
																					29,
																					31,
																					10,
																					7 ],
																			colorset : [
																					'#56b4e9',
																					'#e69f00',
																					'#cc79a7',
																					'#009e73',
																					'#0072b2' ],
																			fields : [
																					'A',
																					'B',
																					'C',
																					'D',
																					'E' ]
																		},
																		'donut_width' : 100,
																		'core_circle_radius' : 0,
																		'chartDiv' : 'chart20',
																		'chartType' : 'pie',
																		'chartSize' : {
																			width : 600,
																			height : 300
																		}
																	};

																	Nwagon
																			.chart(options);
																</script>
															</div>
														</div>
													</div>
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
	<script src="${ctx }/resources/plugins/jquery-1.10.2.js"></script>
	<script src="${ctx }/resources/plugins/bootstrap/bootstrap.min.js"></script>
	<script src="${ctx }/resources/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="${ctx }/resources/plugins/pace/pace.js"></script>
	<script src="${ctx }/resources/scripts/siminta.js"></script>
	<!-- Page-Level Plugin Scripts-->
	<script src="${ctx }/resources/plugins/flot/jquery.flot.js"></script>
	<script src="${ctx }/resources/plugins/flot/jquery.flot.tooltip.min.js"></script>
	<script src="${ctx }/resources/flot/jquery.flot.resize.js"></script>
	<script src="${ctx }/resources/flot/jquery.flot.pie.js"></script>
	<script src="${ctx }/resources/scripts/flot-demo.js"></script>
</body>

</html>