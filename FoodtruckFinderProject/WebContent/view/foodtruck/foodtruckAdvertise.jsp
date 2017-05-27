<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<c:set value="${pageContext.request.contextPath}" var="ctx" />
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>foodtruckAdvertise</title>
    <!-- Core CSS - Include with every page -->
    <link href="${ctx}/resources/plugins/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="${ctx}/resources/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="${ctx}/resources/plugins/pace/pace-theme-big-counter.css" rel="stylesheet" />
  	<link href="${ctx}/resources/css/style.css" rel="stylesheet" />
    <link href="${ctx}/resources/css/main-style.css" rel="stylesheet" />

    <!-- Page-Level CSS -->
    <link href="${ctx}/resources/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet" />

</head>

<body>
    <!--  wrapper -->
    <div id="wrapper">
		
		<%@ include file="../header.jspf"%>

        <!-- navbar side -->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <!-- sidebar-collapse -->
            <div class="sidebar-collapse">
                <!-- side-menu -->
                <ul class="nav" id="side-menu">
                    <li>
                        <a href="${ctx }/#"><i class="fa fa-files-o fa-fw"></i>Truck Info</a>
                    </li>
                     <li>
                        <a href="${ctx }/#"><i class="fa fa-bar-chart-o fa-fw"></i>매출 통계</a>
                    </li>
                    <li >
                        <a href="${ctx }/#"><i class="fa fa-dashboard fa-fw"></i>설문 통계</a>
                    </li>
                    <li >
                        <a href="${ctx }/#"><i class="fa fa-wrench fa-fw"></i>정보 수정</a>
                    </li>
                    <li class="selected" >
                        <a href="${ctx }/#"><i class="fa fa-edit fa-fw"></i>광고 요청</a>
                    </li>
                </ul>
                <!-- end side-menu -->
            </div>
            <!-- end sidebar-collapse -->
        </nav>
        <!-- end navbar side -->
        <!--  page-wrapper -->
        <div id="page-wrapper">

            <div class="row">
                <!-- Page Header -->
                <div class="col-lg-12">
                    <h1 class="page-header">광고 요청</h1>
                </div>
                <!--End Page Header -->
            </div>
			<div class="row">
                <div class="col-lg-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
				                             광고는 요청된 기간동안 메인페이지와 검색결과 상단에 무작위로 노출됩니다.
                        </div>
                        <div class="panel-body">
                           	<div class="form-group">
                            <h4>- 광고 시작일</h4>
                            	<p>광고 시작일을 선택해주세요. </p>
                            	<input id="startdate" type="date" data-date-inline-picker="true" />
                            </div>
                            <h4>- 광고 기간</h4>
                            	<p></p>
                           	<div class="form-group">
                           		<p>광고 기간을 선택해주세요. </p>
                           		<label class="radio-inline">
                           			<input type="radio" name="period" id="period3" value="7">3 일
                           		</label>
                           		<label class="radio-inline">
                           			<input type="radio" name="period" id="period7" value="7">7 일
                           		</label>
                           		<label class="radio-inline">
                           			<input type="radio" name="period" id="period14" value="7">14 일
                           		</label>
                           		<label class="radio-inline">
                           			<input type="radio" name="period" id="period30" value="7">30 일
                           		</label>
                           	</div>
                            
                        </div>
                    </div>
                    <!--End Advanced Tables -->
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
    <script src="${ctx}/resources/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="${ctx}/resources/plugins/dataTables/dataTables.bootstrap.js"></script>
    <script>
        $(document).ready(function () {
            $('#dataTables-example').dataTable();
        });
    </script>

</body>
</html>