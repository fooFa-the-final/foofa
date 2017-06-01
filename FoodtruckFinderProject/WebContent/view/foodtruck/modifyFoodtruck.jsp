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
    <script src="${ctx }/resources/plugins/jquery-1.10.2.js"></script>
    <link href="${ctx }/resources/plugins/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="${ctx }/resources/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="${ctx }/resources/plugins/pace/pace-theme-big-counter.css" rel="stylesheet" />
    <link href="${ctx }/resources/css/style.css" rel="stylesheet" />
    <link href="${ctx }/resources/css/main-style.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="${ctx }/resources/css/jquery.timepicker.css"/>
    <script src="${ctx }/resources/plugins/timepicker/jquery.timepicker.js"></script>
     <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=noUvsaR702FX6WH5un5h&submodules=geocoder"></script>
    <script>
        $(document).ready(function(){
            $('#startTime').timepicker();
            $('#endTime').timepicker();
            var position = new naver.maps.LatLng(37.4795169, 126.8824995);
            var map = new naver.maps.Map('map', {
			    center: position,
			    zoom: 10
			});
            var marker = new naver.maps.Marker({
				position: position,
				map: map
			});
            var infoWindow = new naver.maps.InfoWindow({
                anchorSkew: true
            });
            
            var address = "";
            function searchCoordinateToAddress(latlng) {
                var tm128 = naver.maps.TransCoord.fromLatLngToTM128(latlng);
                infoWindow.close();

                naver.maps.Service.reverseGeocode({
                    location: tm128,
                    coordType: naver.maps.Service.CoordType.TM128
                }, function(status, response) {
                    if (status === naver.maps.Service.Status.ERROR) {
                        return alert('Something Wrong!');
                    }

                    var items = response.result.items,
                    address = items[0].address;
                    
                    console.log(address);

                    infoWindow.setContent([
                            '<div style="padding:10px;min-width:200px;line-height:150%;">',
                            '<h4 style="margin-top:5px;">검색 좌표 : '+ address +'</h4></div>'
                        ].join('\n'));

                    infoWindow.open(map, latlng);
                });
            }
            naver.maps.Event.addListener(map, 'click', function(e){
            	marker.setPosition(e.coord);
            	searchCoordinateToAddress(e.coord);
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
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">
                    <img src="${ctx }/resources/img/logo.png" alt="" />
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
                            <li>
                                <a href="${ctx }/foodtruck/searchById.do?foodtruckId=${truck.foodtruckId }">Truck Info</a>
                            </li>
                            <li class="selected">
                                <a href="${ctx }/foodtruck/modifyForm.do?foodtruckId=${truck.foodtruckId }">트럭정보 수정</a>
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
            <form action="${ctx }/foodtruck/modify.do" method="post" class="form-inline">
            <input type="hidden" name="foodtruckId" value="${truck.foodtruckId }">
            <div class="row">
                <!-- Page Header -->
                
                <div class="col-md-12" style="background-color:white; height:300px">
                    	<div class="col-md-3">
                            <a class="navbar-brand" href="#" style="margin-top:10px;">
                                <img src="${ctx }/resources/img/${truck.foodtruckImg }" style="height:250px; width:250px"/>
                                <input type="hidden" name="foodtruckImg" value="${truck.foodtruckImg }">
                            </a>
                        </div>
                        <div class="col-md-6" style="margin-top:30px;">
                            <h1><input class="form-control" type="text" name="foodtruckName" value="${truck.foodtruckName }" style="width:61.5%"></h1><br>
                              <h5>
                              	<input class="form-control" type="text" name="category1" value="${truck.category1 }" style="width:20%">
                               	<input class="form-control" type="text" name="category2" value="${truck.category2 }" style="width:20%">
                               	<input class="form-control" type="text" name="category3" value="${truck.category3 }" style="width:20%">
                           	  </h5>
                              <h5><input class="form-control" type="text" name="location" value="${truck.location }" style="width:61.5%"></h5>
                        </div>
<!--                     <div class="col-md-3" style="float:right; margin-right:30px; margin-top: 30px"> -->
<!--                         <a href="#"><button type="button" class="btn btn-default">판매자 정보 수정</button></a> -->
<!--                         <a href="#"><button type="button" class="btn btn-default">판매자 탈퇴</button></a> -->
<!--                     </div>         -->
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
                               <textarea class="form-control" name="spot" rows="3" cols="94" style="border:0px">${truck.spot }</textarea>
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
                                <textarea class="form-control" name="notice" rows="3" cols="94" style="border:0px">${truck.notice }</textarea>
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
                                 <input id="startTime" name="startTime" type="text" class="time ui-timepicker-input" autocomplete="off" size="8" value="${startTime }"> 부터 
                                 <input id="endTime" name="endTime" type="text" class="time ui-timepicker-input" autocomplete="off" size="8" value="${endTime }"> 까지
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
                                <table class="table table-striped table-bordered table-hover" id="menus" name="menus">
                                	<colgroup>
										<col width="*" />
										<col width="100" />
										<col width="60" />
										<col width="100" />
									</colgroup>
                                    <thead>
                                        <tr>
                                            <th style="text-align:center"> Menu </th>
                                            <th style="text-align:center"> Price </th>
                                            <th style="text-align:center"> State </th>
                                            <th colspan="1"></th>
                                        </tr>
                                    </thead>
                                    <tbody align="center">
                                    	<c:forEach items="${truck.menus }" var="menu">
                                        <tr class="odd gradeX">
                                            <td><input type="text" name="menuName" value="${menu.menuName }" style="border:0px; background-color:transparent" readonly></td>
                                            <td><input type="text" name="menuPrice" value="${menu.price }" style="border:0px; background-color:transparent" readonly></td>
                                            <c:if test="${menu.menuState eq true }">
                                            	<td>판매중</td>
                                            </c:if>
                                            <c:if test="${menu.menuState eq false }">
                                            	<td>매진</td>
                                            </c:if>
                                            <td>
                                            	<input type="hidden" name="menuId" value="${menu.menuId }">
                                            	 <input type="hidden" name="menuState" value="${menu.menuState }"> 
                                                <button type="button" class="btn btn-default btn-circle" id="menu1mod" onclick="modify_menu_click();">
                                                    <i class="fa fa-pencil"></i>
                                                </button>
                                                <button type="button" class="btn btn-danger btn-circle"><i class="fa fa-times"></i></button>
                                            </td>
                                        </tr>
                                        </c:forEach>
                                         <tr class="odd gradeX">
                                            <td align="left"><input type="text" placeholder="메뉴 명"></td>
                                            <td align="left"><input type="text" placeholder="메뉴 가격"></td>
                                            <td>
                                                <select>
                                                    <option>판매중</option>
                                                    <option>매진</option>
                                                </select>
                                            </td>
                                            <td align="center">
                                                <button type="button" class="btn btn-primary btn-circle"><i class="fa fa-plus"></i></button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            
                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>
                 
                   </div>
                   <div class="col-md-4" style="background-color: white; height:350px" id="map">
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
                                       <c:if test="${truck.card eq true }">
	                                       <td>
	                                            <input type="radio" name="card" id="optionsRadiosInline1" value="true" checked>YES
	                                            <input type="radio" name="card" id="optionsRadiosInline2" value="false">NO
	                                        </td>
                                        </c:if>
                                        <c:if test="${truck.card eq false }">
	                                       <td>
	                                            <input type="radio" name="card" id="optionsRadiosInline1" value="true">YES
	                                            <input type="radio" name="card" id="optionsRadiosInline2" value="false" checked>NO
	                                        </td>
                                        </c:if>
                                   </tr>
                                   <tr>
                                       <td>Alcohol</td>
                                       <c:if test="${truck.drinking eq true }">
	                                       <td>
	                                            <input type="radio" name="drinking" id="optionsRadiosInline1" value="true" checked>YES
	                                            <input type="radio" name="drinking" id="optionsRadiosInline2" value="false">NO
	                                        </td>
                                        </c:if>
                                        <c:if test="${truck.drinking eq false }">
	                                       <td>
	                                            <input type="radio" name="drinking" id="optionsRadiosInline1" value="true">YES
	                                            <input type="radio" name="drinking" id="optionsRadiosInline2" value="false" checked>NO
	                                        </td>
                                        </c:if>
                                   </tr>
                                   <tr>
                                       <td>Parking</td>
                                       <c:if test="${truck.parking eq true }">
	                                       <td>
	                                            <input type="radio" name="parking" id="optionsRadiosInline1" value="true" checked>YES
	                                            <input type="radio" name="parking" id="optionsRadiosInline2" value="false">NO
	                                        </td>
                                        </c:if>
                                        <c:if test="${truck.parking eq false }">
	                                       <td>
	                                            <input type="radio" name="parking" id="optionsRadiosInline1" value="true">YES
	                                            <input type="radio" name="parking" id="optionsRadiosInline2" value="false" checked>NO
	                                        </td>
                                        </c:if>
                                   </tr>
                                   <tr>
                                       <td>Catering</td>
                                       <c:if test="${truck.catering eq true }">
	                                       <td>
	                                            <input type="radio" name="catering" id="optionsRadiosInline1" value="true" checked>YES
	                                            <input type="radio" name="catering" id="optionsRadiosInline2" value="false">NO
	                                        </td>
                                        </c:if>
                                        <c:if test="${truck.catering eq false }">
	                                       <td>
	                                            <input type="radio" name="catering" id="optionsRadiosInline1" value="true">YES
	                                            <input type="radio" name="catering" id="optionsRadiosInline2" value="false" checked>NO
	                                        </td>
                                        </c:if>
                                   </tr>
                               </tbody>
                           </table>
                       
                   </div>                   
                </div>
                 <div class="col-md-1" style="margin-left:550px; margin-bottom: 100px">
                        <button type="submit" class="btn btn-success btn-default btn-lg">SUBMIT</button>
                   </div>
                
            </div>
            </form>
        </div>
        <!-- end page-wrapper -->
    </div>
    <!-- end wrapper -->

    <!-- Core Scripts - Include with every page -->
    
    <script src="../resources/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="../resources/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="../resources/plugins/pace/pace.js"></script>
    <script src="../resources/scripts/siminta.js"></script>
    <script>
        function modify_menu_click() {
	       alert("수정버튼을 누르셨습니다.");
            /*수정버튼 클릭이벤트: 데이터 받아와서 inputText로 변환해주고 버튼 submit버튼으로 변경해주는 자바스크립트 적용할 것*/
        }
    </script>

</body>

</html>