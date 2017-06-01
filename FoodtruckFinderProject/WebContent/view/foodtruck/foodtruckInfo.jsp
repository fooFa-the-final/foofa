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
                                <a href="${ctx }/foodtruck/searchById.do">Truck Info</a>
                            </li>
                            <li>
                                <a href="${ctx }/foodtruck/modifyForm.do">트럭정보 수정</a>
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
                    <div class="col-md-8">
                            <a class="navbar-brand" href="#" style="margin-top:10px;">
                                <img src="${ctx }/resources/img/${truck.foodtruckImg }" style="height:250px; width:250px"/>
                            </a>
                            <div class="user-info" style="margin-top:30px;">
                                <h1>${truck.foodtruckName }</h1><br>
                                <h5>${truck.category1 }</h5>
                                <h5>${truck.spot }</h5>
                                <h5>${truck.favoriteCount }Followers</h5>
                                <h5>Reviews</h5>
                            </div>
                    </div>
                    <div class="col-md-3" style="float:right; margin-right:30px; margin-top: 30px">
                        <a href="${ctx }/seller/modify.do"><button type="button" class="btn btn-default">판매자 정보 수정</button></a>
                        <a href="${ctx }/seller/checkPw.do"><button type="button" class="btn btn-default">판매자 탈퇴</button></a>
                    </div>        
                </div>
                <!--End Page Header -->
                
                <div class="col-md-12" style="margin-top:30px; margin-bottom:50px">
                   <div class="col-md-8">
                   
                   <!--Truck Location Section-->
                      <div class="col-lg-12">
                          <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4>Truck Location</h4>
                            </div>
                            <div class="panel-body">
                                <h5>${truck.location }</h5>
                            </div>
                          </div>
                      </div>
                  <!--End of Truck Location-->
                   
                   
                 <!--Notice Section-->
                      <div class="col-lg-12">
                          <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4>Notice</h4>
                            </div>
                            <div class="panel-body">
                                <h5>${truck.notice }</h5>
                            </div>
                          </div>
                      </div>
                  <!--End of Notice-->
                  
                  <!--Truck Hour Section-->
                      <div class="col-lg-12">
                          <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4>Truck Hour</h4>
                            </div>
                            <div class="panel-body">
                                <h5>${startTime } 부터    ${endTime } 까지 영업합니다.</h5>
                            </div>
                          </div>
                      </div>
                  <!--End of Foodtruck Hour-->
                  
                       <div class="col-lg-12">                       
                       
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                             <h4>Menu</h4> 
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th style="text-align:center"> Menu </th>
                                            <th style="text-align:center"> Price </th>
                                            <th style="text-align:center"> State </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach items="${truck.menus }" var="menu" varStatus="status">
                                        	<c:if test="${menu.menuState eq true }">
		                                        <tr class="odd gradeX">
		                                            <td style="text-align:center">${status.count }</td>
		                                            <td style="text-align:center">${menu.menuName }</td>
		                                            <td style="text-align:center">${menu.price }</td>
		                                           	<td style="text-align:center">판매중</td>
		                                        </tr>
                                        	</c:if>
                                        	<c:if test="${menu.menuState eq false }">
	                                        	<tr class="odd gradeX" >
		                                            <td style="text-align:center"><font color="gray">${status.count }</font></td>
		                                            <td style="text-align:center"><font color="lightgray">${menu.menuName }</font></td>
		                                            <td style="text-align:center"><font color="lightgray">${menu.price }</font></td>
		                                           	<td style="text-align:center"><font color="red">매진</font></td>
	                                       		</tr>
                                        	</c:if>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            
                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>
                 
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
                                       	<c:if test="${truck.card eq true}">
                                       		<td>YES</td>
                                       	</c:if>
										<c:if test="${truck.card eq false}">
											<td>NO</td>
										</c:if>                                       	
                                   </tr>
                                   <tr>
                                       <td>Alcohol</td>
                                       <c:if test="${truck.drinking eq true}">
                                       		<td>YES</td>
                                       	</c:if>
										<c:if test="${truck.drinking eq false}">
											<td>NO</td>
										</c:if>
                                   </tr>
                                   <tr>
                                       <td>Parking</td>
                                       <c:if test="${truck.parking eq true}">
                                       		<td>YES</td>
                                       	</c:if>
										<c:if test="${truck.parking eq false}">
											<td>NO</td>
										</c:if>
                                   </tr>
                                   <tr> 
                                       <td>Catering</td>
                                       <c:if test="${truck.catering eq true}">
                                       		<td>YES</td>
                                       	</c:if>
										<c:if test="${truck.catering eq false}">
											<td>NO</td>
										</c:if>
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