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
    <link rel="stylesheet" type="text/css" href="${ctx }/resources/css/jquery.timepicker.css"/>
</head>
<style>
label {
width: 160px;margin-right: 20px;}
textarea.form-control {
}
</style>
    <!-- Core Scripts - Include with every page -->
    <script src="${ctx }/resources/plugins/jquery-1.10.2.js"></script>
    <script src="${ctx }/resources/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="${ctx }/resources/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${ctx }/resources/plugins/pace/pace.js"></script>
    <script src="${ctx }/resources/scripts/siminta.js"></script>
    
    <script src="${ctx }/resources/plugins/timepicker/jquery.timepicker.js"></script>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=noUvsaR702FX6WH5un5h&submodules=geocoder"></script>
	<script src="http://malsup.github.com/jquery.form.js"></script> 
	
    <script>
        $(document).ready(function(){
			$('#side-modify').attr('class', 'selected');
        	
            $('#startTime').timepicker();
            $('#endTime').timepicker();
            var position = new naver.maps.LatLng(37.4795169, 126.8824995);
            var map = new naver.maps.Map('map', {
			    center: position,
			    map : map
            });
        });
    		var infowindow;
            
    		function searchCoordinateToAddress(latlng) {
       		 var tm128 = naver.maps.TransCoord.fromLatLngToTM128(latlng);
       		 naver.maps.Service.reverseGeocode({
            location: tm128,
            coordType: naver.maps.Service.CoordType.TM128
        	}, function(status, response) {
            if (status === naver.maps.Service.Status.ERROR) {
                return alert('Something Wrong!');
            }
            var items = response.result.items,
            address = items[0].address;
            $("#loc1").val(address);
            console.log(address);
            
        	});
    	}
            naver.maps.Service.geocode({
     			address: "${truck.location}"
     		}, function(status, response){
     			if (status === naver.maps.Service.Status.ERROR) {
     				position = new naver.maps.LatLng(37.4795169, 126.8824995);
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
     			naver.maps.Event.addListener(map, 'click', function(e){
                	marker.setPosition(e.coord);
                	searchCoordinateToAddress(e.coord);
                });
     		});
            function modify_menu_click(menuId, menuName, price, menuState) {
            	
                 $("#inputMenuName").val(menuName);
                 $("#inputMenuPrice").val(price);
                 $("#inputMenuId").val(menuId);
                 if(menuState == true){
                     $("#inputMenuState").val("sale").prop("selected", true);
                 }else {
                     $("#inputMenuState").val("nosale").prop("selected", true);
                 }
                 $("#submitBtn").attr("class","fa fa-save");
             }
             
             function fileinfo(input){
     	      	if (input.files && input.files[0]) {
     	            var reader = new FileReader();
     	            reader.onload = function (e) {
     	                    $("#image").attr("src", e.target.result);
     	                }
     	            reader.readAsDataURL(input.files[0]);
                 }
     	      	$("#fileForm").ajaxForm({
     	      		url:"${ctx}/foodtruck/modifyPicture.do",
     	      		enctype: "multipart/form-data",
     	      		success: function(result){
     	      			alert("사진이 등록되었습니다.");
     	      		},
     	      		error: function(){
     	      			alert("등록에 실패하였습니다. 다시 시도해주세요.")
     	      		}
     	      	});
     	      	$("#fileForm").submit();
     		}
        
        var c = 0;
        var registMenu = function(){
        	var comHtml = "";
        	var count = c++;
        	comHtml += '<tr class="odd gradeX">';
        	comHtml += '<td align="left"><input type="text" id="menuName'+(count)+'" name="menuName" value="'+$("#inputMenuName").val()+'" style="border:0px; background-color:transparent" readonly></td>';
        	comHtml += '<td align="left"><input type="text" id="menuPrice'+(count)+'" name="menuPrice" value="'+$("#inputMenuPrice").val()+'" style="border:0px; background-color:transparent" readonly></td>';
        	comHtml += '<td ><input type="text" id="menuState'+(count)+'" name="menuState" value="'+ $("#inputMenuState").val() +'" style="border:0px; background-color:transparent" readonly></td>';
        	comHtml += '<td>';
        	comHtml += '<button type="button" class="btn btn-default btn-circle" onClick="modifyMenu(this)"><i class="fa fa-pencil"></i></button>';
            comHtml += '<button type="button" class="btn btn-danger btn-circle" onClick="removeMenu(this)"><i class="fa fa-times"></i></button>';
            comHtml += '</td>';
            comHtml += '</tr>';
        	$('#menus tr:last').before(comHtml);
        	
        	$('#menus tr:last').find("input[id^=inputMenuName]").val("").end();
        	$('#menus tr:last').find("input[id^=inputMenuPrice]").val("").end();
        	$('#menus tr:last').find("select[id^=inputMenuState]").val("판매중").end();
        }

        var removeMenu = function(obj){
        	var menuId = $(obj).parent().find("input[name^=menuId]").val();
        	var foodtruckId = $("#foodtruckId").val();
        	var removeThis = $(obj).parent().parent();
            removeThis.remove();
            $.ajax({
            	url: "${ctx}/foodtruck/removeMenu.do",
            	data: {menuId:menuId, foodtruckId:foodtruckId},
            	type: "get",
            	success: function(result){
            		alert("삭제되었습니다.");
            	},
            	error: function(rexult){
            		alert("실패했습니다. 다시 시도하세요.");
            	} 
            });
        }
    </script>
<body>
    <!--  wrapper -->
    <div id="wrapper">
		<%@ include file="../include/header.jspf"%>
		<%@ include file="../include/sellerLeft.jspf"%>

        <!--  page-wrapper -->
        <div id="page-wrapper">
            <form action="${ctx }/foodtruck/modify.do" method="post" class="form-inline">
            <input type="hidden" id="foodtruckId" name="foodtruckId" value="${truck.foodtruckId }">
            <div class="row">
                <!-- Page Header -->
                
                <div class="col-md-12" style="margin-top:20px;" >
                	<div class="panel panel-danger">
                		<div class="panel-body" style="height:300px">
	                    	<div class="col-md-4">
	                           <form id="fileForm" method="post" enctype="multipart/form-data">
		                            <a href="#" >
		                                <img name="image" id="image" src="${ctx }/resources/img/food/${truck.foodtruckImg }" alt="사진을 변경하려면 클릭하세요." style="border-radius:15px; height:250px; width:250px" onClick="document.all.file.click();"/>
		                            	<input type="file" name="file" id="file" style="display: none;" onchange="fileinfo(this)" />
		                            </a>
		                        </form> 
	                        </div>
	                        <div class="col-md-8" style="margin-top:30px;">
	                            <h1 style="margin:0; "><label>푸드트럭 이름</label><input class="form-control" type="text" name="foodtruckName" value="${truck.foodtruckName }" style="width:45%"></h1><br>
	                              <h5><label>카테고리</label>
	                              	<input class="form-control" type="text" name="category1" value="${truck.category1 }" style="width:15%">
	                               	<input class="form-control" type="text" name="category2" value="${truck.category2 }" style="width:15%">
	                               	<input class="form-control" type="text" name="category3" value="${truck.category3 }" style="width:15%">
	                           	  </h5>
	                              <h5><label>현재 위치</label><input class="form-control" type="text" name="location" id = "loc1" value="${truck.location }" style="width:45%"></h5>
	                        </div>
                		</div>
                	</div>
                </div>
                <!--End Page Header -->
                
                <div class="col-md-12" style=" margin-bottom:50px; padding:0px;">
                   <div class="col-md-8">
                   
                   <!--Truck Location Section-->
                      <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">Truck Location</h4>
                        </div>
                        <div class="panel-body">
                           <textarea class="form-control" name="spot" rows="3"  style="border:0px; width:100%;">${truck.spot }</textarea>
                        </div>
                      </div>
                  <!--End of Truck Location-->
                  
                  <!--Notice Section-->
                      <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">Notice</h4>
                        </div>
                        <div class="panel-body">
                            <textarea class="form-control" name="notice" rows="3" style="border:0px; width:100%;">${truck.notice }</textarea>
                        </div>
                      </div>
                  <!--End of Notice-->
                  
                  <!--Truck Hour Section-->
                     <div class="panel panel-default">
                       <div class="panel-heading">
                           <h4 class="panel-title">Truck Hour</h4>
                       </div>
                       <div class="panel-body">
                            <input id="startTime" name="startTime" type="text" class="time ui-timepicker-input" autocomplete="off" size="8" value="${startTime }"> 부터 
                            <input id="endTime" name="endTime" type="text" class="time ui-timepicker-input" autocomplete="off" size="8" value="${endTime }"> 까지
                       </div>
                     </div>
                  <!--End of Foodtruck Hour-->
                                                
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                             <h4 class="panel-title">Menu</h4> 
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
                                    <tbody >
                                    	<c:forEach items="${truck.menus }" var="menu">
                                        <tr id="${menu.menuId }+_tr" class="odd gradeX">
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
                                                <button type="button" class="btn btn-default btn-circle" id="menu1mod" onclick="modify_menu_click('${menu.menuId }', '${menu.menuName }', '${menu.price }', '${menu.menuState }');">
                                                    <i class="fa fa-pencil"></i>
                                                </button>
                                                <button type="button" class="btn btn-danger btn-circle" onClick="removeMenu(this)"><i class="fa fa-times"></i></button>
                                            </td>
                                        </tr>
                                        </c:forEach>
                                         <tr class="odd gradeX">
                                            <td align="left"><input type="text" placeholder="메뉴 명" id="inputMenuName"><input type="hidden" id="inputMenuId"></td>
                                            <td align="left"><input type="text" placeholder="메뉴 가격" id="inputMenuPrice"></td>
                                            <td>
                                                <select id="inputMenuState">
                                                    <option name="sale" value="sale">판매중</option>
                                                    <option name="nosale" value="nosale">매진</option>
                                                </select>
                                            </td>
                                            <td align="center">
                                                <buttontype="button" class="btn btn-primary btn-circle" onclick="registMenu()"><i id="submitBtn" class="fa fa-plus"></i></button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            
                    </div>
                    <!--End Advanced Tables -->
                </div>
                 
             </div>
          	 <div class="col-md-4">
          	 	<div class="panel panel-default">
          	 		<div class="panel-heading"><h4 class="panel-title">Map</h4></div>
          	 		<div class="panel-body" style="background-color: white; height:350px" id="map">
          	 		</div>
          	 	</div>
          	 	<div class="panel panel-default">
          	 		<div class="panel-heading"><h4 class="panel-title">More Info</h4></div>
 					<div class="panel-body">
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

</body>

</html>