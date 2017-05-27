<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
	 	$(document).ready(function(){
	 		var position = new naver.maps.LatLng(37.4813516, 126.8748611);
	 		var map = new naver.maps.Map('map', {
			    center: position,
			    zoom: 10
			});
	 		
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
                <div class="col-md-10 col-md-offset-1" style="background-color:white">
                	<div class="col-md-12" style="background-color:black;height:2px;margin-top:10px">
                	</div>
                	<div class="col-md-12" style="margin-top:10px; display:inline-block">
	                	<div class="col-md-3">
	                		<form>
							 <fieldset class="truck-border">
							  <legend class="truck-border">Menu</legend>
							  <font size = "4">
							    메뉴1 <span style="float:right">7000원</span><br>
							    메뉴2 <span style="float:right">7000원</span><br>
							    메뉴3 <span style="float:right">7000원</span><br>
							    메뉴4 <span style="float:right">7000원</span><br>
							    메뉴5 <span style="float:right">7000원</span><br>
							 </font>
							 </fieldset>
							</form>
	                	</div>
	                	<div class="col-md-4">
	                		<form>
							 <fieldset class="truck-border">
							  <legend class="truck-border">Today</legend>
							  <font size = "4">
								  Today's Hour: 17:30~22:00<br>
								  Today's Location: 서울시 용산구<br>
								  Today's Issue<br><br> 날씨가 추우니 몸 따뜻하게 하고 오세요.
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
	                		<div class = "col-md-offset-1 col-md-11" style="margin-top:50px">
		                		<span><font class="h3"><a href="#">이승건1</a></font></span>
		                		<span style="float:right"><input type="button" value="follow" class="btn btn-default"> <input type="button" value="!" class="btn btn-default"></span><br>
		                		<img src="../../resources/img/smile.png" width="200px" height="200px"><br><br>
		                		<font size="3px">
		                		<span>★★★★★ 따봉: 155</span>
		                		<span style="float:right">2017-05-21 11:44PM</span><br>
		                		햄버거가 너무 맛있어요.	
		                		</font>
	                		</div>
	                		<div class = "col-md-offset-1 col-md-11" style="margin-top:50px">
		                		<span><font class="h3"><a href="#">이승건2</a></font></span>
		                		<span style="float:right"><input type="button" value="follow" class="btn btn-default"> <input type="button" value="!" class="btn btn-default"></span><br>
		                		<img src="../../resources/img/smile.png" width="200px" height="200px"><br><br>
		                		<font size="3px">
		                		<span>★★★★★ 따봉: 155</span>
		                		<span style="float:right">2017-05-21 11:44PM</span><br>
		                		햄버거가 너무 맛있어요.	
		                		</font>
	                		</div>
                		</div>
                		<div class="col-md-2 col-md-offset-1">
                			<form>
							  <legend style="font-size:30px">More Info</legend>
							  <font size = "4">
	                        	Accept Card <span style="float:right">Yes</span><br>
	                        	Alchol <span style="float:right">Yes</span><br>
	                        	Parking <span style="float:right">Yes</span><br>
	                        	Catering <span style="float:right">Yes</span><br>
                        	  </font>
							</form>
                		</div>
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