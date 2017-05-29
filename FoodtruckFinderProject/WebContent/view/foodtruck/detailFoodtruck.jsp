<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<c:set value="${pageContext.request.contextPath}" var="ctx" />
<c:set value="${truck.operationTime }" var="time"/>
<c:set value="${fn:substring(time, 0, 2)}" var="startHour"/>
<c:set value="${fn:substring(time, 2, 4)}" var="startMin"/>
<c:set value="${fn:substring(time, 4, 6)}" var="endHour"/>
<c:set value="${fn:substring(time, 6, 8)}" var="endMin"/>

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
    <script src="../../resources/plugins/jquery-1.10.2.js"></script>
	 <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=noUvsaR702FX6WH5un5h&submodules=geocoder"></script>
	 <script>
	 	var newMarker = function(position){
			var marker = new naver.maps.Marker({
				position: position,
				map: map
			});
			
			markers.push(marker);
		    console.log(position + "length : " +markers.length);
		}
	 	$(document).ready(function(){
	 		
	 		naver.maps.Service.geocode({
	 			address: "${truck.location}"
	 		}, function(status, response){
	 			if (status === naver.maps.Service.Status.ERROR) {
		            return alert('잘못 입력 되어있는 주소입니다. 기본 좌표를 찍어주겠습니다.');
		        }
	 			
	 			var item = response.result.items[0],
	 				point = new naver.maps.Point(item.point.x, item.point.y);
	 		
	 			var map = new naver.maps.Map('map', {
				    center: point,
				    zoom: 10
				});
	 			
	 			var marker = new naver.maps.Marker({
					position: point,
					map: map
				});
		 		
	 		}
	 		)
	 		
	 		
	 	});
	 </script>
</head>

<body>
    <!--  wrapper -->
    
    <div id="wrapper">
        <!-- navbar top -->
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation" id="navbar">
            <!-- navbar-header -->
            <div class="navbar-header">
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
        
        <!--  page-wrapper -->
            <div class="row">
                <!-- Page Header -->
                <div class="col-md-10 col-md-offset-1" style="height:300px; background-color:#FFFFFF">
                    <span>
                            <a class="navbar-brand" href="#" style="margin-top:10px; margin-left:20px">
                                <img src="../../resources/img/waikiki.jpg" style="height:250px; width:250px"/>
                            </a>
                            <div class="user-info">
                                <h1>${truck.foodtruckName }</h1><br>
                                <h5>${truck.category1 }양식</h5>
                                <h5>${truck.spot }</h5>
                                <h5>144 Followers</h5>
                                <h5>${fn:length(reviewList)} Reviews</h5>
                            </div>
                    </span>
                    <span style="float:right; margin-right:50px; margin-top: 30px">
                        <a href="#"><button type="button" class="btn btn-default">판매자 정보 수정</button></a>
                        <a href="#"><button type="button" class="btn btn-default">판매자 탈퇴</button></a>
                    </span>        
                </div>
                <!--End Page Header -->
                <div class="col-md-10 col-md-offset-1" style="background-color:white">
                	<div class="col-md-12" style="background-color:black;height:2px;margin-top:10px">
                	</div>
                	<div class="col-md-12" style="margin-top:10px; display:inline-block">
	                	<div class="col-md-3">
	                		<form>
							 <fieldset class="truck-border">
							  <legend class="truck-border">Menu</legend>
							  <font size = "4">
							  <c:forEach items="${truck.menus }" var="menu">
							  	${menu.menuName } <span style="float:right">${menu.price }원</span><br>
							  </c:forEach>
							 </font>
							 </fieldset>
							</form>
	                	</div>
	                	<div class="col-md-4">
	                		<form>
							 <fieldset class="truck-border">
							  <legend class="truck-border">Today</legend>
							  <font size = "4">
								  Today's Hour: ${startHour }:${startMin }~${endHour }:${endMin }<br>
								  Today's Location: ${truck.spot }<br>
								  Today's Issue<br><br> ${truck.notice }
							  </font>
							 </fieldset>
							</form>
	                	</div>
	                	<div class="col-md-4 col-md-offset-1" style="border: 1px solid;height:400px;margin-top:15px" id="map">
	                		
	                	</div>
                	</div>
                	<div class="col-md-12" style="margin-top:30px; margin-bottom:20px;display:inline-block">
                		<div class="col-md-7" style="margin-top:20px">
                		<font size="6">Reviews</font>
                		<span style="float:right"><input type="button" value="+ Add my review" class="btn btn-default"></span>
                		<c:forEach items="${reviewList }" var="Review">
	                		<div class = "col-md-offset-1 col-md-11" style="margin-top:50px">
		                		<span><font class="h3"><a href="#">${Review.foodtruck.foodtruckName }</a></font></span>
		                		<span style="float:right"><input type="button" value="follow" class="btn btn-result"> <input type="button" value="!" class="btn btn-result"></span><br>
		                		<img src="../../resources/img/smile.png" width="300px" height="300px"><br><br>
		                		<font size="4px">
		                		<span>점수 : ${Review.score } 따봉: ${Review.recommand }</span>
		                		<span style="float:right">${Review.writeDate }</span><br>
		                		${Review.contents }	
		                		</font>
	                		</div>
                		</c:forEach>
                	</div>
                </div>
            </div>
			
        </div>
        <!-- end page-wrapper -->
        
    <!-- end wrapper -->

    <!-- Core Scripts - Include with every page -->
    
    <script src="../../resources/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="../../resources/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="../../resources/plugins/pace/pace.js"></script>
    <script src="../../resources/scripts/siminta.js"></script>

</body>
</html>