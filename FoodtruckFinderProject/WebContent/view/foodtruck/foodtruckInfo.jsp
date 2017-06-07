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
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=noUvsaR702FX6WH5un5h&submodules=geocoder"></script>
	
</head>

<body>
    <!--  wrapper -->
    
    <div id="wrapper">

		<%@ include file="../header.jspf"%>
        <%@ include file="../left/sellerLeft.jspf"%>
     
        <!--  page-wrapper -->
        <div id="page-wrapper">
            <div class="row">
                <!-- Page Header -->
                <div class="col-md-12" style="background-color:white; height:300px">
                    <div class="col-md-8">
                    	<form id="fileForm" method="post" enctype="multipart/form-data" action="">
                            <a class="navbar-brand" href="#" style="margin-top:10px;" >
                                <img name="image" id="image" src="${ctx }/resources/img/${truck.foodtruckImg }" style="height:250px; width:250px" onClick="document.all.file.click();"/>
                            	<input type="file" name="file" id="file" style="display: none;" onchange="fileinfo(this)" />
                            </a>
                        </form>    
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
    <script src="${ctx }/resources/plugins/jquery-1.10.2.js"></script>
    <script src="${ctx }/resources/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="${ctx }/resources/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${ctx }/resources/plugins/pace/pace.js"></script>
    <script src="${ctx }/resources/scripts/siminta.js"></script>
	<script>
		$(document).ready(function() {
			$('#side-info').attr('class', 'selected');
			var position = new naver.maps.LatLng(37.4795169, 126.8824995);
			var map = new naver.maps.Map('map', {
				center: position,
				zoom: 10
			});
		});
		
		function fileinfo(input){
	      	if (input.files && input.files[0]) {
	            var reader = new FileReader();
	            reader.onload = function (e) {
	                    $("#image").attr("src", e.target.result);
	                }
	            reader.readAsDataURL(input.files[0]);
            }
	      	
	      	function fileUpload() {
	      		$('#fileForm').ajaxForm({
	      		url: "${ctx}/foodtruck/modifyPicture.do",
	      		enctype: "multipart/form-data", // 여기에 url과 enctype은 꼭 지정해주어야 하는 부분이며 multipart로 지정해주지 않으면 controller로 파일을 보낼 수 없음
	      		success: function(result){
	      		alert(result);
	      		}
	      		});
	      		// 여기까지는 ajax와 같다. 하지만 아래의 submit명령을 추가하지 않으면 백날 실행해봤자 액션이 실행되지 않는다.
	      		$("#fileForm").submit();
	      		}
        }
		
// 		function uploadFile(){
//             var form = $('FILE_FORM')[0];
//             var formData = new FormData(form);
//             formData.append("fileObj", $("#file")[0].files[0]);

//             $.ajax({
//                 url: '${ctx }/foodtruck/modifyPicture.do',
//                 processData: false,
//                 contentType: false,
//                 data: formData,
//                 type: 'POST',
//                 enctype: 'multipart/form-data',
//                 success: function(result){
//                     alert("사진이 변경되었습니다.");
//                 }
//                 error: function(){
//                 	alert("사진 변경에 실패하였습니다.");
//                 }
//             });
//         }


	</script>

</body>

</html>