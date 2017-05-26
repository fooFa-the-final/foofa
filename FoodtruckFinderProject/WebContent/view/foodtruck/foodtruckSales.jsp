<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Bootsrtap Free Admin Template - SIMINTA | Admin Dashboad
	Template</title>
<!-- Core CSS - Include with every page -->
<link href="../../resources/plugins/bootstrap/bootstrap.css"
	rel="stylesheet" />
<link href="../../resources/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<link href="../../resources/plugins/pace/pace-theme-big-counter.css"
	rel="stylesheet" />
<link href="../../resources/css/style.css" rel="stylesheet" />
<link href="../../resources/css/main-style.css" rel="stylesheet" />

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

<link rel='stylesheet' href='../../resources/css/Nwagon.css'
	type='text/css'>
<script src='../../resources/scripts/Nwagon.js'></script>

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
						<li class="selected"><a href="#">Truck Info</a></li>
						<li><a href="#">트럭정보 수정</a></li>
					</ul> <!-- second-level-items --></li>
				<li><a href="#"><i class="fa fa-flask fa-fw"></i>광고요청</a></li>
				<li><a href="#"><i class="fa fa-table fa-fw"></i>매출통계</a></li>
				<li><a href="#"><i class="fa fa-edit fa-fw"></i>설문통계</a></li>
			</ul>
			<!-- end side-menu -->
		</div>
		<!-- end sidebar-collapse --> </nav>
		<!-- end navbar side -->
		<div id="page-wrapper"><!--매출페이지 시작  -->
			<div class="row">
				<h2>Line Chart with guide line</h2>
				<div id="chart71"></div>
				<p style='font-size: 12px; padding: 0 0 40px 40px'>** Mouse over
					the chart area in order to move the guide line</p>
				<script>
					var options = {
						'legend' : {
							names : [ '1', '2', '3', '4', '5', '6', '7', '8',
									'9', '10', '11', '12' ]
						},
						'dataset' : {
							title : 'Playing time per day',
							values : [ [ 56, 20 ], [ 58, 49 ], [ 60, 50 ],
									[ 58, 60 ], [ 85, 76 ], [ 86, 83 ],
									[ 82, 73 ], [ 77, 66 ], [ 87, 66 ],
									[ 49, 56 ], [ 58, 76 ], [ 85, 76 ] ],
							colorset : [ '#0072b2', '#cc79a7' ],
							fields : [ 'Company A', 'Company B' ]
						},
						'chartDiv' : 'chart71',
						'chartType' : 'line',
						'leftOffsetValue' : 40,
						'bottomOffsetValue' : 60,
						'chartSize' : {
							width : 700,
							height : 300
						},
						'minValue' : 0,
						'maxValue' : 100,
						'increment' : 20,
						'isGuideLineNeeded' : false
					//default set to false
					};

					Nwagon.chart(options);
				</script>
			</div>
		</div>





























		<!-- Core Scripts - Include with every page -->
		<script src="../../resources/plugins/jquery-1.10.2.js"></script>
		<script src="../../resources/plugins/bootstrap/bootstrap.min.js"></script>
		<script src="../../resources/plugins/metisMenu/jquery.metisMenu.js"></script>
		<script src="../../resources/plugins/pace/pace.js"></script>
		<script src="../../resources/scripts/siminta.js"></script>
	</div>
</body>
</html>