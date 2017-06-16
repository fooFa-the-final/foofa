
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>매출통계페이지</title>
<!-- Core Scripts - Include with every page -->
<script src="${ctx }/resources/plugins/jquery-1.10.2.js"></script>
<script src="${ctx }/resources/plugins/bootstrap/bootstrap.min.js"></script>
<script src="${ctx }/resources/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${ctx }/resources/plugins/pace/pace.js"></script>
<script src="${ctx }/resources/scripts/siminta.js"></script>

<!-- Core CSS - Include with every page -->
<link href="${ctx }/resources/plugins/bootstrap/bootstrap.css"
	rel="stylesheet" />
<link href="${ctx }/resources/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<link href="${ctx }/resources/plugins/pace/pace-theme-big-counter.css"
	rel="stylesheet" />
<link href="${ctx }/resources/css/style.css" rel="stylesheet" />
<link href="${ctx }/resources/css/main-style.css" rel="stylesheet" />

<style>/*Graph  */
* {
	margin: 0;
	padding: 0;
}

div {
	padding: 0px;
	overflow: hidden;
	height: auto;
}

.hgroup {
	padding: 20px;
	background-color: #e9e9e9;
}

.hgroup h1 {
	font-family: Tahoma;
}

.hgroup p {
	margin: 10px 0;
	font-size: 10px
}

h2 {
	margin: 0;
	padding: 20px;
	border: 1px solid #000;
	background-color: #f9f9f9;
	border-width: 1px 0;
	font-family: Tahoma;
}
</style>

<link rel='stylesheet' href='${ctx }/resources/css/Nwagon.css'
	type='text/css'>
<script src='${ctx }/resources/scripts/Nwagon.js'></script>
<!--------------------------------------------------------------------------  -->
<link href='${ctx }/resources/css/fullcalendar.min.css' rel='stylesheet' />
<link href='${ctx }/resources/css/fullcalendar.print.min.css'
	rel='stylesheet' media='print' />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src='${ctx }/resources/scripts/moment.min.js'></script>
<%-- <script src='${ctx }/resources/scripts/jquery.min.js'></script> --%>
<script src='${ctx }/resources/scripts/fullcalendar.min.js'></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=noUvsaR702FX6WH5un5h&submodules=geocoder"></script>
    <script src="${ctx }/resources/scripts/seller-profile.js"></script>


<script>
	$(document).ready(
			function() {
				stateCheck('${truck.state}');
				$('#side-sales').attr('class', 'selected');
				$('#calendar').fullCalendar({

					dayClick : function(date, jsEvent, view) {

						convertDate(date.format());

					},
					events : function(start, end, timezone, callback) {
						$.ajax({
							url : '${ctx}/sales/month.do',
							dataType : 'json',
							success : function(data) {
								var events = [];
								$.each(data, function(i, item) {
									events.push({
										title : item.re,
										start : item.da
									});
								});
								callback(events);
							}
						});
					}
				});
				function convertDate(date) {
					var date = new Date(date);
					date = date.yyyymmdd();
					alert(date);
					$
							.ajax({
								url : '${ctx}/sales/date.do',
								type : "post",
								data : {
									date : date
								},
								dataType : 'json',
								success : function(data) {
									document.getElementById("revenue").value = data.re;
									document
											.getElementById("location1").value = data.lo;
									document.getElementById("date").value = data.da;
									document.getElementById("date2").value = data.da;

									jQuery('#showModal').modal();
									modify(data.lo);
								},
								error : function() {
									document.getElementById("date1").value = date;
									jQuery('#inputModal').modal();

								}
							});

				}
				Date.prototype.yyyymmdd = function() {
					var yyyy = this.getFullYear().toString();
					var mm = (this.getMonth() + 1).toString();
					var dd = this.getDate().toString();
					return yyyy + (mm[1] ? mm : "0" + mm[0])
							+ (dd[1] ? dd : "0" + dd[0]);
				}
			});
</script>
<style>
#calendar {
	max-width: 500px;
	margin-left: 0px;
}
</style>

</head>
<body>
	<div id="wrapper">
		<!-- navbar top -->
		<%@ include file="../include/header.jspf"%>
		<%@ include file="../include/sellerLeft.jspf"%>
		<div id="page-wrapper">
			<div class="row">
				<!-- Page Header -->
               		 <%@ include file="../include/sellerProfile.jspf" %>
				<!--End Page Header -->

			<!--매출페이지 시작  -->
			<div class="col-lg-12" style="padding:0px;">
				<div class="col-md-7">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">매출 그래프</h4>
					</div>
					<div class="panel-body">
						<!-- 매출 그래프 시작 -->
						<p style="text-align:right;">
						<input type="button"  class="btn btn-info btn-outline" value="연간 매출" onclick="year()"> 
						<input type="button"class="btn btn-success btn-outline"  value="10일간 매출" onclick="days()">
						</p>
						<div id="chart71"></div>
						<script>
							function year() {
								$(".accessibility").remove();
								$(".Nwagon_line").remove();
								$
										.ajax({
											url : "${pageContext.request.contextPath}/sales/year.do",
											type : 'GET',
											dataType : 'json',
											success : function(data) {
												var options = {
													'legend' : {
														names : [ '1', '2', '3', '4',
																'5', '6', '7', '8',
																'9', '10', '11', '12' ]
													},
													'dataset' : {
														title : 'Playing time per day',
														values : [ [ data[0].re ],
																[ data[1].re ],
																[ data[2].re ],
																[ data[3].re ],
																[ data[4].re ],
																[ data[5].re ],
																[ data[6].re ],
																[ data[7].re ],
																[ data[8].re ],
																[ data[9].re ],
																[ data[10].re ],
																[ data[11].re ] ],
														colorset : [ '#0072b2' ],
														fields : [ '매출' ]
													},
													'chartDiv' : 'chart71',
													'chartType' : 'line',
													'leftOffsetValue' : 90,
													'bottomOffsetValue' : 70,
													'chartSize' : {
														width : 750,
														height : 400
													},
													'minValue' : 0,
													'maxValue' : data[0].max,
													'increment' : data[0].inc,
													'isGuideLineNeeded' : false
												//default set to false
												};
		
												Nwagon.chart(options);
											}
										});
							}
						</script>
						<script>
							function days() {
								$(".accessibility").remove();
								$(".Nwagon_line").remove();
								$
										.ajax({
											url : "${pageContext.request.contextPath}/sales/10days.do",
											type : 'GET',
											dataType : 'json',
											success : function(data) {
												var options = {
													'legend' : {
														names : [ [ data[0].da ],
																[ data[1].da ],
																[ data[2].da ],
																[ data[3].da ],
																[ data[4].da ],
																[ data[5].da ],
																[ data[6].da ],
																[ data[7].da ],
																[ data[8].da ],
																[ data[9].da ] ]
													},
													'dataset' : {
														title : 'Playing time per day',
														values : [ [ data[0].re ],
																[ data[1].re ],
																[ data[2].re ],
																[ data[3].re ],
																[ data[4].re ],
																[ data[5].re ],
																[ data[6].re ],
																[ data[7].re ],
																[ data[8].re ],
																[ data[9].re ] ],
														colorset : [ '#0072b2' ],
														fields : [ '매출' ]
													},
													'chartDiv' : 'chart71',
													'chartType' : 'line',
													'leftOffsetValue' : 90,
													'bottomOffsetValue' : 70,
													'chartSize' : {
														width : 750,
														height : 400
													},
													'minValue' : 0,
													'maxValue' : data[0].max,
													'increment' : data[0].inc,
													'isGuideLineNeeded' : false
												//default set to false
												};
		
												Nwagon.chart(options);
											}
										});
							}
						</script>
						<script>
						var change = function(e, id){
							var tm128 = naver.maps.TransCoord.fromLatLngToTM128(e.coord);
							naver.maps.Service.reverseGeocode({
						        location: tm128,
						        coordType: naver.maps.Service.CoordType.TM128
						    }, function(status, response) {
						        if (status === naver.maps.Service.Status.ERROR) {
						            return alert('잘못 입력했습니다.');
						        }
						        var item = response.result.items[0],
				 				point = new naver.maps.Point(item.point.x, item.point.y);
						        $(id).val(item.address);
							});
						};
						
						var marker;
						var map;
						$(document).ready(function() {
							year();
							var position = new naver.maps.LatLng(37.4795169, 126.8824995);
							map = new naver.maps.Map('map', {
								center: position,
								zoom: 9
							});
							marker = new naver.maps.Marker({
								position: position,
								map: map
							});
							
							var map2 = new naver.maps.Map('map2', {
								center: position,
								zoom: 10
							});
							
							var marker2 = new naver.maps.Marker({
								position: position,
								map: map2
							});
							
							naver.maps.Event.addListener(map2, 'click', function(e) {
				 			   marker2.setPosition(e.coord);
				 			   change(e, "#locat");
				 			});
						});
						
						var modify = function(address){
							naver.maps.Service.geocode({
					 			address: address
					 		}, function(status, response){
					 			if (status === naver.maps.Service.Status.ERROR) {
					 				position = new naver.maps.LatLng(37.4795169, 126.8824995);
						            return alert('없는 주소입니다. 기본 좌표를 찍어주겠습니다.');
						        }
					 			
					 			var item = response.result.items[0],
					 				point = new naver.maps.Point(item.point.x, item.point.y);
					 		
					 			var map = new naver.maps.Map('map', {
								    center: point,
								    zoom: 9
								});
					 			
					 			var marker = new naver.maps.Marker({
									position: point,
									map: map
								});
					 			
					 			naver.maps.Event.addListener(map, 'click', function(e) {
						 			   marker.setPosition(e.coord);
						 			   change(e, "#location1");
						 		});
					 		});
						}
						</script>
						<!-- 매출 그래프 종료 -->
					</div>
				</div>
			</div>

			<div class="col-md-5" >
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">매출 달력</h4>
					</div>
					<div class="panel-body" id="calendar">
					</div>
					<div class="panel-footer">
						매출을 확인하거나 수정하려면 원하는 날짜를 선택하세요. 
					</div>
				</div>
			</div>
		</div>
	</div>
			
	</div>
	<!-- end pagewrapper -->
</div>
	<div class="modal fade" id="showModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">매출 조회</h4>
				</div>
	
				<div class="modal-body" id="modalCons">
					<form action="${ctx }/sales/modify.do" method="POST" style="display:inline;">
					<div style="display:inline">
						<div class="col-lg-6">
							날짜 : <input type="text" name="date" id="date" value="" disabled  class="form-control" style="display:inline-block; width:40%; background-color:#eee; margin-right:10px;">
							매출 : <input type="number" name="revenue" id="revenue" value="" class="form-control" style="display:inline-block; width:40%;"><br>
							위치 : <input type="text" name="location" id="location1" value="" class="form-control" style="display:inline-block; width:90%;margin-top:5px;">
						</div>
						<div id='map' style="width: 550px; height: 300px;  margin-top: 20px"></div>
					</div>	
						<hr style="border-color: #eee">
						<input type="submit" value="수정" class="btn btn-primary" style="margin-left:65%;margin-right:10px;">
					</form>
					<form action="${ctx }/sales/remove.do" method="GET" style="display:inline;">
						<input type="hidden" name="date" id="date2" value="">
						<input type="submit" value="삭제" class="btn btn-danger" style="margin-right:10px;">
					</form>
					<input type="button" class="btn btn-default" data-dismiss="modal"
						value="닫기">
				</div>
			</div>
	
		</div>
	</div>
	<div class="modal fade" id="inputModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">매출 등록</h4>
				</div>
				<form action="${ctx }/sales/create.do" method="POST">

				<div class="modal-body" id="modalCons">
					<input type="hidden" name="date" id="date1" value=""> 
					매출 : <input type="number" name="revenue"> 
					위치 : <input type="text" name="location" id="locat"> 
					<div id="map2" style="width: 550px; height: 300px; margin-top: 20px"></div>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal" value="닫기">
					<input type="submit" class="btn btn-success" value="등록" >
				</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
