<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<script src='${ctx }/resources/scripts/moment.min.js'></script>
<script src='${ctx }/resources/scripts/jquery.min.js'></script>
<script src='${ctx }/resources/scripts/fullcalendar.min.js'></script>
<script>
	$(document).ready(function() {

		$('#calendar').fullCalendar({
			defaultDate : '2017-05-12',
			editable : true,
			eventLimit : true, // allow "more" link when too many events
			events : [ {
				title : 'All Day Event',
				start : '2017-05-01'
			}, {
				title : 'Long Event',
				start : '2017-05-07',
				end : '2017-05-10'
			}, {
				id : 999,
				title : 'Repeating Event',
				start : '2017-05-09T16:00:00'
			}, {
				id : 999,
				title : 'Repeating Event',
				start : '2017-05-16T16:00:00'
			}, {
				title : 'Conference',
				start : '2017-05-11',
				end : '2017-05-13'
			}, {
				title : 'Meeting',
				start : '2017-05-12T10:30:00',
				end : '2017-05-12T12:30:00'
			}, {
				title : 'Lunch',
				start : '2017-05-12T12:00:00'
			}, {
				title : 'Meeting',
				start : '2017-05-12T14:30:00'
			}, {
				title : 'Happy Hour',
				start : '2017-05-12T17:30:00'
			}, {
				title : 'Dinner',
				start : '2017-05-12T20:00:00'
			}, {
				title : 'Birthday Party',
				start : '2017-05-13T07:00:00'
			}, {
				title : 'Click for Google',
				url : 'http://google.com/',
				start : '2017-05-28'
			} ]
		});

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
		<%@ include file="../header.jspf"%>
		<!-- end navbar top -->


		<!-- navbar side -->
		<nav class="navbar-default navbar-static-side" role="navigation">
		<!-- sidebar-collapse -->
		<div class="sidebar-collapse">
			<!-- side-menu -->
			<ul class="nav" id="side-menu">
				<li class="active"><a href="#"><i
						class="fa fa-files-o fa-fw"></i>Truck Info<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="#">Truck Info</a></li>
						<li><a href="#">트럭정보 수정</a></li>
					</ul> <!-- second-level-items --></li>
				<li><a href="#"><i class="fa fa-flask fa-fw"></i>광고요청</a></li>
				<li class="selected"><a href="#"><i
						class="fa fa-table fa-fw"></i>매출통계</a></li>
				<li><a href="#"><i class="fa fa-edit fa-fw"></i>설문통계</a></li>
			</ul>
			<!-- end side-menu -->
		</div>
		<!-- end sidebar-collapse --> </nav>
		<!-- end navbar side -->
		<div id="page-wrapper">
			<!--매출페이지 시작  -->
			<div>
				<h2>매출 그래프</h2>
				<input type="button" value="연간 매출" onclick="year()"> <input
					type="button" value="10일간 매출" onclick="days()">
				<div id="chart71"></div>
				<p style='font-size: 12px; padding: 0 0 40px 40px'>** Mouse over
					the chart area in order to move the guide line</p>
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
											'leftOffsetValue' : 50,
											'bottomOffsetValue' : 70,
											'chartSize' : {
												width : 700,
												height : 300
											},
											'minValue' : 0,
											'maxValue' : 10000,
											'increment' : 1000,
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
											'leftOffsetValue' : 50,
											'bottomOffsetValue' : 70,
											'chartSize' : {
												width : 700,
												height : 300
											},
											'minValue' : 0,
											'maxValue' : 10000,
											'increment' : 1000,
											'isGuideLineNeeded' : false
										//default set to false
										};

										Nwagon.chart(options);
									}
								});
					}
				</script>
				<script>
					$(document).ready(function() {
						year();
					})
				</script>
			</div>
			<div id='calendar' />
			<div id='map' />
		</div>


	</div>
</body>
</html>