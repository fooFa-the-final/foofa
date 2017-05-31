<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Foodtruck Finder</title>
    <!-- Core CSS - Include with every page -->
    <link href="${ctx }/resources/plugins/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="${ctx }/resources/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="${ctx }/resources/plugins/pace/pace-theme-big-counter.css" rel="stylesheet" />
    <link href="${ctx }/resources/css/style.css" rel="stylesheet" />
      <link href="${ctx }/resources/css/main-style.css" rel="stylesheet" />

</head>

<body>
    <!--  wrapper -->
    
    <div id="wrapper">
        <!-- navbar top -->
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation" id="navbar">
            <!-- navbar-header -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">
                    <img src="../../resources/img/logo.png" alt="" />
                </a>
            </div>
            <!-- end navbar-header -->
            <!-- navbar-top-links -->
            <ul class="nav navbar-top-links navbar-right">
               
               <li class="row">
                    <!-- search section-->
                    <div class="input-group custom-search-form" style="width:800px; margin-right:200px">
                        <input type="text" class="form-control" placeholder="Search" style="width: 45%">
                        <input type="text" class="form-control" placeholder="Location" style="width: 45%">
                            <button class="btn btn-default" type="button">
                                <i class="fa fa-search"></i>
                            </button>
                    </div>
                    <!--end search section-->
                </li>
               
                <!-- main dropdown -->
                    <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-3x"></i>
                    </a>
                    <!-- dropdown user-->
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i>User Profile</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i>Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i>Logout</a>
                        </li>
                    </ul>
                    <!-- end dropdown-user -->
                </li>
                <!-- end main dropdown -->
            </ul>
            <!-- end navbar-top-links -->

        </nav>
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
        <div id="page-wrapper" style="margin-top:80px">
            <div class="row">
                <!-- Page Header -->
                <div class="col-md-12" style="background-color:white; height:300px">
                    <span>
                            <a class="navbar-brand" href="#" style="margin-top:10px;">
                                <img src="${ctx }/resources/img/${truck.foodtruckImg }" style="height:250px; width:250px"/>
                            </a>
                            <div class="user-info">
                                <h1>${truck.foodtruckName }</h1><br>
                                <h5>${truck.category1 }</h5>
                                <h5>${truck.spot }</h5>
                                <h5>${truck.favoriteCount }Followers</h5>
                                <h5>Reviews</h5>
                            </div>
                    </span>
                    <span style="float:right; margin-right:30px; margin-top: 30px">
                        <a href="#"><button type="button" class="btn btn-default">판매자 정보 수정</button></a>
                        <a href="#"><button type="button" class="btn btn-default">판매자 탈퇴</button></a>
                    </span>        
                </div>
                <!--End Page Header -->
                
                <div class="col-md-12">
                      <div class="col-lg-8">
                            <h1>Foodtruck Info</h1>
                          </div>                    
                   <div class="col-md-8">
                                                
                       <div class="col-lg-12">                       
                       
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                             <h3>Menu</h3> 
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th> Menu </th>
                                            <th> Price </th>
                                            <th> State </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach items="${truck.menus }" var="menus" varStatus="status">
                                        <tr class="odd gradeX">
                                            <td>${status.count }</td>
                                            <td>${menu.menuName }</td>
                                            <td>${menu.price }</td>
                                            <td class="center">${menu.menuState }</td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            
                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>
                 
                 <!--Notice Section-->
                      <div class="col-lg-12">
                          <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3>Notice</h3>
                            </div>
                            <div class="panel-body">
                                <h4>${truck.notice }</h4>
                            </div>
                          </div>
                      </div>
                  <!--End of Notice-->
                  
                  <!--Truck Hour Section-->
                      <div class="col-lg-12">
                          <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3>Truck Hour</h3>
                            </div>
                            <div class="panel-body">
                                <h4>${startTime } 부터  ${endTime } 까지 영업합니다.</h4>
                            </div>
                          </div>
                      </div>
                  <!--End of Foodtruck Hour-->
                  
                  <!--Truck Location Section-->
                      <div class="col-lg-12">
                          <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3>Truck Location</h3>
                            </div>
                            <div class="panel-body">
                                <h4>${truck.location }</h4>
                            </div>
                          </div>
                      </div>
                  <!--End of Truck Location-->
                   
                   
                   </div>
                   <div class="col-md-4" style="background-color: white; height:350px">
                       <h2>Map</h2>
                       
                   </div>
                   
                   <div class="col-md-4" style="margin-top: 20px">
                       <h4><ins>More Info</ins></h4>
                           <table>
                              <thead>
                                  <tr>
                                      <th width="150px"></th>
                                      <th></th>
                                  </tr>
                              </thead>
                               <tbody>
                                   <tr>
                                       <td>Accept Card</td>
<%--                                        <c:choose> --%>
<%--                                        	<c:if test="${truck.card }"> --%>
                                       		<td>YES</td>
<%--                                        	</c:if> --%>
<%--                                        </c:choose> --%>
                                   </tr>
                                   <tr>
                                       <td>Alcohol</td>
                                       <td>YES</td>
                                   </tr>
                                   <tr>
                                       <td>Parking</td>
                                       <td>YES</td>
                                   </tr>
                                   <tr> 
                                       <td>Catering</td>
                                       <td>YES</td>
                                   </tr>
                               </tbody>
                           </table>
                       
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

</body>

</html>