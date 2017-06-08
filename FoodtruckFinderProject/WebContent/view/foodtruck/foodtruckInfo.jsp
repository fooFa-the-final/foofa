<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<style>
input.cmn-toggle-round-flat + label {
  padding: 2px;
  width: 120px;
  height: 60px;
  background-color: #dddddd;
  border-radius: 60px;
  transition: background 0.4s;
}
input.cmn-toggle-round-flat + label:before,
input.cmn-toggle-round-flat + label:after {
  display: block;
  position: absolute;
  content: "";
}
input.cmn-toggle-round-flat + label:before {
  top: 2px;
  left: 2px;
  bottom: 2px;
  right: 2px;
  background-color: #fff;
  border-radius: 60px;
  transition: background 0.4s;
}
input.cmn-toggle-round-flat + label:after {
  top: 4px;
  left: 4px;
  bottom: 4px;
  width: 52px;
  background-color: #dddddd;
  border-radius: 52px;
  transition: margin 0.4s, background 0.4s;
}
input.cmn-toggle-round-flat:checked + label {
  background-color: #8ce196;
}
input.cmn-toggle-round-flat:checked + label:after {
  margin-left: 60px;
  background-color: #8ce196;
}
</style>

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
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=noUvsaR702FX6WH5un5h&submodules=geocoder"></script>
	 <script src="${ctx }/resources/plugins/jquery-1.10.2.js"></script>
	<script src="http://malsup.github.com/jquery.form.js"></script> 
	
	
</head>

<body>
    <!--  wrapper -->
    
    <div id="wrapper">

		<%@ include file="../header.jspf"%>
        <%@ include file="../include/sellerLeft.jspf"%>
     
        <!--  page-wrapper -->
        <div id="page-wrapper">
            <div class="row">
                <!-- Page Header -->
                <div class="col-md-12" style="background-color:white; height:300px;">
                    <div class="col-md-8">
                    	<form id="fileForm" method="post" enctype="multipart/form-data">
                            <a class="navbar-brand" href="#" style="margin-top:10px;" >
                                <img name="image" id="image" src="${ctx }/resources/img/food/${truck.foodtruckImg }" style="height:250px; width:250px" onClick="document.all.file.click();"/>
                            	<input type="file" name="file" id="file" style="display: none;" onchange="fileinfo(this)" />
                            </a>
                        </form>    
                            <div class="user-info" style="margin-top:30px;">
                                <font size="6">${truck.foodtruckName }</font><br><br>
                                <h5>${truck.category1 }</h5>
                                <h5>${truck.spot }</h5>
                                <h5>${truck.favoriteCount }Followers</h5>
                                <h5>${truck.reviewCount }Reviews</h5>
                            </div>
                    </div>
                    <div class="col-md-3" style="float:right; margin-right:30px; margin-top:30px; height:300px; position:relative;">
                        <a href="${ctx }/seller/modify.do"><button type="button" class="btn btn-default">판매자 정보 수정</button></a>
                        <a href="${ctx }/seller/checkPw.do"><button type="button" class="btn btn-default">판매자 탈퇴</button></a>
                   		<div class="col-md-3" style="position:absolute; bottom:100px; margin-left:10px" align="right">
		                    <input type="button" id="openstateBtn" name="openstateBtn" class="btn btn-outline btn-default" onClick="stateBtn(this)" style="width:200px; height:70px" value="OPEN NOW">        
		                	<input type="hidden" id="openstate" name="openstate" value="${truck.state}">
                		</div>
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
                   <div class="col-md-4" id = "map" style="background-color: white; height:350px">
                       
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
   
    <script src="${ctx }/resources/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="${ctx }/resources/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${ctx }/resources/plugins/pace/pace.js"></script>
    <script src="${ctx }/resources/scripts/siminta.js"></script>
	<script>
		$(document).ready(function() {
			$('#side-info').attr('class', 'selected');
			naver.maps.Service.geocode({
	 			address: "${truck.location}"
	 		}, function(status, response){
	 			if (status === naver.maps.Service.Status.ERROR) {
	 				position = new naver.maps.LatLng(37.4795169, 126.8824995);
		            return alert('없는 주소입니다. 기본 좌표를 찍어주겠습니다.');
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
	 		});
			
			var state = '${truck.state}';
			if(state=="true"){
				$("#openstateBtn").removeClass("btn btn-outline btn-default").addClass("btn btn-success");
				$("#openstateBtn").val("OPEN NOW");
			}
			if(state=="false"){
				$("#openstateBtn").removeClass("btn btn-success").addClass("btn btn-outline btn-default");
				$("#openstateBtn").val("CLOSED");
			}
		});
		
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
		
		

var stateBtn = function(obj){
	var openState = $("#openstate").val();
	
	if($(obj).hasClass("btn btn-outline btn-default")){
		$(obj).removeClass("btn btn-outline btn-default").addClass("btn btn-success");
		$("#openstate").val("true");
		$("#openstateBtn").val("OPEN NOW");
	} else {
		$(obj).removeClass("btn btn-success").addClass("btn btn-outline btn-default");
		$("#openstate").val("false");
		$("#openstateBtn").val("CLOSED");
	}
	$.ajax({
		 url: '${ctx }/foodtruck/modifyState.do',
	     data: {operation_state: openState},
	     type: 'get',
	     success: function(result){
	         alert("영업상태가 변경되었습니다.");
	         
	     },
	     error: function(){
	     	alert("영업상태 변경을 실패하였습니다. 다시 시도해주세요.");
	     }
	});
}
	</script>

</body>

</html>