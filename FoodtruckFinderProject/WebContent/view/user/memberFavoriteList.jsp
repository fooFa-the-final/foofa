<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<c:set value="${pageContext.request.contextPath}" var="ctx" />
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Foodtruck Finder</title>
    <!-- Core CSS - Include with every page -->
    <link href="${ctx}/resources/plugins/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="${ctx}/resources/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="${ctx}/resources/plugins/pace/pace-theme-big-counter.css" rel="stylesheet" />
    <link href="${ctx}/resources/css/style.css" rel="stylesheet" />
    <link href="${ctx}/resources/css/main-style.css" rel="stylesheet" />

</head>

<body>
    <!--  wrapper -->
    
    <div id="wrapper">

		<%@ include file="../header.jspf"%>
        
        <!-- navbar side -->
        <nav class="navbar-default navbar-static-side" role="navigation" >
            <!-- sidebar-collapse -->
            <div class="sidebar-collapse">
                <!-- side-menu -->
                <ul class="nav" id="side-menu">
                    <li class="active">
                        <a href="#"><i class="fa fa-files-o fa-fw"></i>Truck Info<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li class="selected">
                                <a href="#">Truck Info</a>
                            </li>
                            <li>
                                <a href="#">트럭정보 수정</a>
                            </li>
                        </ul>
                        <!-- second-level-items -->
                    </li>
                     <li>
                        <a href="#"><i class="fa fa-flask fa-fw"></i>광고요청</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-table fa-fw"></i>매출통계</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-edit fa-fw"></i>설문통계</a>
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
                <div class="col-md-12" style="background-color:white;height:300px">
                    <span>
                            <a class="navbar-brand" href="#" style="margin-top:10px; margin-left:20px">
                                <img src="${ctx}/resources/img/waikiki.jpg" style="height:250px; width:250px"/>
                            </a>
                            <div class="user-info">
                                <h1>WAIKIKI JEJU</h1><br>
                                <h5>양식</h5>
                                <h5>제주시</h5>
                                <h5>144Followers</h5>
                                <h5>255Reviews</h5>
                            </div>
                    </span>
                    <span style="float:right; margin-right:50px; margin-top: 30px">
                        <a href="#"><button type="button" class="btn btn-default">판매자 정보 수정</button></a>
                        <a href="#"><button type="button" class="btn btn-default">판매자 탈퇴</button></a>
                    </span>        
                </div>
                <!--End Page Header -->
                <div class="col-md-12">
                	<h1>Favorite</h1>
                	<div class = "col-md-8" style="height:150px;margin-top:20px;margin-left:50px">
                		<div class="col-md-12">
                		<div style="height:100px;width:100px;float:left">
                			<img src="${ctx}/resources/img/smile.png" style="height:100%;width:100%">
                		</div>
               			<div style="height:100px;width:500px;float:left;margin-left:10px">
               				<span style="float:left"><font size="6px"><a href="#">Truck name1</a></font></span> <font size="5px">&nbsp;category</font>
               				<span style="float:right"><input type="button" value="단골 끊기" class = "btn btn-result"></span><br><br>
               				<font size="3px">단골 144명 225 reviews</font>
               			</div>
                		</div>
                	</div>
                	<div class = "col-md-8" style="height:150px;margin-top:20px;margin-left:50px">
                		<div class="col-md-12">
                		<div style="height:100px;width:100px;float:left">
                			<img src="${ctx}/resources/img/smile.png" style="height:100%;width:100%">
                		</div>
               			<div style="height:100px;width:500px;float:left;margin-left:10px">
               				<span style="float:left"><font size="6px"><a href="#">Truck name1</a></font></span> <font size="5px">&nbsp;category</font>
               				<span style="float:right"><input type="button" value="단골 끊기" class = "btn btn-result"></span><br><br>
               				<font size="3px">단골 144명 225 reviews</font>
               			</div>
                		</div>
                	</div>
                	<div class = "col-md-8" style="height:150px;margin-top:20px;margin-left:50px">
                		<div class="col-md-12">
                		<div style="height:100px;width:100px;float:left">
                			<img src="${ctx}/resources/img/smile.png" style="height:100%;width:100%">
                		</div>
               			<div style="height:100px;width:500px;float:left;margin-left:10px">
               				<span style="float:left"><font size="6px"><a href="#">Truck name1</a></font></span> <font size="5px">&nbsp;category</font>
               				<span style="float:right"><input type="button" value="단골 끊기" class = "btn btn-result"></span><br><br>
               				<font size="3px">단골 144명 225 reviews</font>
               			</div>
                		</div>
                	</div>
                	<div class = "col-md-8" style="height:150px;margin-top:20px;margin-left:50px">
                		<div class="col-md-12">
                		<div style="height:100px;width:100px;float:left">
                			<img src="${ctx}/resources/img/smile.png" style="height:100%;width:100%">
                		</div>
               			<div style="height:100px;width:500px;float:left;margin-left:10px">
               				<span style="float:left"><font size="6px"><a href="#">Truck name1</a></font></span> <font size="5px">&nbsp;category</font>
               				<span style="float:right"><input type="button" value="단골 끊기" class = "btn btn-result"></span><br><br>
               				<font size="3px">단골 144명 225 reviews</font>
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

</body>
</html>