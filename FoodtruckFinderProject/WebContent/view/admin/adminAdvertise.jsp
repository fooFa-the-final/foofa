<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<c:set value="${pageContext.request.contextPath}" var="ctx" />
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FOODTRUCK FINDER</title>
<!-- Core CSS - Include with every page -->
<link href="${ctx }/resources/plugins/bootstrap/bootstrap.css"
	rel="stylesheet" />
<link href="${ctx}/resources/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<link href="${ctx}/resources/plugins/pace/pace-theme-big-counter.css"
	rel="stylesheet" />
<link href="${ctx}/resources/css/style.css" rel="stylesheet" />
<link href="${ctx}/resources/css/main-style.css" rel="stylesheet" />

<!-- Page-Level CSS -->
<link
	href="${ctx}/resources/plugins/dataTables/dataTables.bootstrap.css"
	rel="stylesheet" />
</head>

<script>
	function remove() {
		var f = document.formName;
		f.action = "${ctx }/advertise/remove.do";
		f.submit();
	}
	function okay() {
		var f = document.formName;
		f.action = "${ctx }/advertise/approve.do";
		f.submit();
	}
</script>
<body>
	<!--  wrapper -->
	<div id="wrapper">

		<%@ include file="../header.jspf"%>
		<%@ include file="../left/adminLeft.jspf"%>
		
		<!--  page-wrapper -->
		<div id="page-wrapper">

			<div class="row">
				<!-- Page Header -->
				<div class="col-lg-12">
					<h1 class="page-header">광고 관리</h1>
				</div>
				<!--End Page Header -->
			</div>

			<!-- 미승인 
             -->

			<div class="row">
				<div class="col-lg-12">
					<!--Basic Tabs   -->
					<div class="panel panel-default">
						<div class="panel-body">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#approved" data-toggle="tab">승인</a>
								</li>
								<li><a href="#unapproved" data-toggle="tab">미승인</a></li>
							</ul>

							<div class="tab-content">
								<div class="tab-pane fade in active" id="approved">
									<h4>승인된 광고 목록</h4>
									<div class="panel-body">
										<div class="table-responsive">
											<table
												class="table table-striped table-bordered table-hover align-middle"
												id="dataTables-example">
												<thead>
													<tr>
														<th>Status</th>
														<th>Name</th>
														<th>Start-Date</th>
														<th>End-Date</th>
														<th>Days</th>
													</tr>
												</thead>
									
													<tbody>
													<c:forEach var="advertise" items="${advertise}"
													varStatus="sts">
														<tr class="odd gradeX">
															<td>${sts.count}</td>
															<td>${advertise.sellerId}</td>
															<td>${advertise.startdate}</td>
															<td>${advertise.endofdate}</td>
															<td>${advertise.period}</td>
														</tr>
												</c:forEach>

													</tbody>

											</table>
										</div>
										<!--End Advanced Tables -->
									</div>
								</div>
								<div class="tab-pane fade" id="unapproved">
									<h4>미승인된 광고 목록</h4>
									<Form method="post" name="formName">
										<input type="hidden" name="approve" value=1>
										<div class="panel-body">
											<div class="table-responsive">
												<table
													class="table table-striped table-bordered table-hover"
													id="dataTables-example">
													<thead>
														<tr>
															<th>Status</th>
															<th>Name</th>
															<th>Start-Date</th>
															<th>End-Date</th>
															<th>Days</th>
															<th>Select</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="advertise1" items="${advertise1}"
															varStatus="sts">
															<tr class="odd gradeX">
																<td>${sts.count}</td>
																<td>${advertise1.sellerId}</td>
																<td>${advertise1.startdate}</td>
																<td>${advertise1.endofdate}</td>
																<td>${advertise1.period}</td>
																<td><input type="checkbox" name="advId"
																	value="${advertise1.advId}"></td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
											<!--End Advanced Tables -->
										</div>
										<div style="text-align: right">
											<button type="button" value="approve" class="btn btn-success"
												onclick="okay();">Approve</button>
											<button type="button" value="pass" class="btn btn-success"
												onclick="remove();">Pass</button>
										</div>
									</Form>
								</div>
							</div>
						</div>
					</div>
					<!--End Basic Tabs   -->
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
	<script src="${ctx}/resources/plugins/dataTables/jquery.dataTables.js"></script>
	<script
		src="${ctx}/resources/plugins/dataTables/dataTables.bootstrap.js"></script>
	<script>
		$(document).ready(function() {
			$('#dataTables-example').dataTable();
			$('#side-advertise').attr('class', 'selected');
		});
	</script>

</body>

</html>