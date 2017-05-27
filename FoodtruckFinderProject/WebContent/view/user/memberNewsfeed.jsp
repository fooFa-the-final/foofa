<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<c:set value="${pageContext.request.contextPath}" var="ctx" />
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bootsrtap Free Admin Template - SIMINTA | Admin Dashboad Template</title>
    <!-- Core CSS - Include with every page -->
    <link href="../../resources/plugins/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="../../resources/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="../../resources/plugins/pace/pace-theme-big-counter.css" rel="stylesheet" />
    <link href="../../resources/css/style.css" rel="stylesheet" />
    <link href="../../resources/css/main-style.css" rel="stylesheet" />

</head>

<body>
    <!--  wrapper -->
    
    <div id="wrapper">
        <!-- navbar top -->
        <%@ include file="../header.jspf"%>
        <!-- end navbar top -->
        
        
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
                <div class="row" style="height:300px; background-color:#FFFFFF; position:absolute; width:83.5%">
                    <span>
                            <a class="navbar-brand" href="#" style="margin-top:10px; margin-left:20px">
                                <img src="../../resources/img/waikiki.jpg" style="height:250px; width:250px"/>
                            </a>
                            <div class="user-info" >
                                <h1><a style="color:black">트와이스님의 프로필 페이지</a></h1><br>
                                <h5>twicejjang@chogo</h5>
                                <h5>144Followers</h5>
                                <h5>255Reviews</h5>
                            </div>  
                    </span>
                <span style="float:right; margin-right:50px; margin-down: 30px;  margin-top: 70px;">
                    <div class="button">    
                    <a href="#"><button type="button" class="btn btn-default">회원 탈퇴</button></a>
                        <br>
                        <br><br><br><br><br><br>
                        
                        <a href="#"><button type="button" class="btn btn-default">Make Follow</button></a>
                    </div>
                        </span>    
    
                </div>

                            </div>
                <!--End Page Header -->
                <div class="col-md-12">
                	<h1 style="font-size:30px">My Followers Review</h1>
                	<c:forEach items="${list }" var="Review">
                		<div class = "col-md-offset-1 col-md-8" style="height:500px;margin-top:50px">
                		<span><font class="h3"><a href="#">${Review.foodtruck.foodtruckName }</a></font></span>
                		<span style="float:right"><input type="button" value="follow" class="btn btn-result"> <input type="button" value="!" class="btn btn-result"></span><br>
                		<img src="../../resources/img/smile.png" width="300px" height="300px"><br><br>
                		<font size="4px">
                		<span>점수 : ${Review.score } 따봉: 155</span>
                		<span style="float:right">${Review.writeDate }</span><br>
                		${Review.contents }	
                		</font>
                		</div>
                	</c:forEach>
                </div>
            </div>
        </div>
        <!-- end page-wrapper -->
        
    </div>
    <!-- end wrapper -->

    <!-- Core Scripts - Include with every page -->
    <script src="../../resources/plugins/jquery-1.10.2.js"></script>
    <script src="../../resources/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="../../resources/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="../../resources/plugins/pace/pace.js"></script>
    <script src="../../resources/scripts/siminta.js"></script>

</body>
</html>