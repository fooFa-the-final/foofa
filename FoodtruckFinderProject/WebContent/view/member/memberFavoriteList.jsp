<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<c:set value="${pageContext.request.contextPath}" var="ctx" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>팔로우리스트</title>
<!-- Core CSS - Include with every page -->
<link href="${ctx}/resources/plugins/bootstrap/bootstrap.css"
	rel="stylesheet" />
<link href="${ctx}/resources/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<link href="${ctx}/resources/plugins/pace/pace-theme-big-counter.css"
	rel="stylesheet" />
<link href="${ctx}/resources/css/style.css" rel="stylesheet" />
<link href="${ctx}/resources/css/main-style.css" rel="stylesheet" />
 <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=noUvsaR702FX6WH5un5h&submodules=geocoder"></script>
<!-- Page-Level CSS -->
<link href="resources/plugins/dataTables/dataTables.bootstrap.css"
	rel="stylesheet" />
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">

<c:set var="ctx">${pageContext.request.contextPath }</c:set>
</head>
<body>
   <div id="wrapper">
		<%@ include file="../include/header.jspf"%>
		<%@ include file="../include/memberLeft.jspf"%>
		<!--  page-wrapper -->
		<div id="page-wrapper">
			<div class="row">
             		<!-- Page Header -->
					<%@ include file="../include/memberProfile.jspf" %>
           	    <!--End Page Header -->
			</div>
			<div class="row">
				<div class="col-lg-8">
	                <div class="panel panel-default">
                        <div class="panel-heading">
                			<h4 class="panel-title">Favorite List</h4>
                        </div>
                        <div class="panel-body">
							<c:forEach var="truck" items="${trucks}" varStatus="sts">
								
								<div id="panel${sts.index }"  >
									<ul class="list-inline" style="width:100%; padding:0; margin:0; ">
										<li><img src="${ctx }/resources/img/truck/${truck.foodtruckImg }" style="height: 100px; width: 100px" /></li>
										<li style="width:50%;"><a href="${ctx }/review/list/truck.do?foodtruckId=${truck.foodtruckId }"><b style="font-size:1.2em;">${truck.foodtruckName }</b></a><br><br>
											<i class="fa fa-heart"> &nbsp;</i>단골 : &nbsp; ${truck.favoriteCount } &nbsp; <i class="fa fa-pencil"> &nbsp;</i>리뷰 : &nbsp;${truck.reviewCount  }
										</li>
										<li><input type="button" class="btn btn-info btn-outline" onclick="change('${sts.index}')" value="위치 보기"></li>
										<c:if test="${loginUserId eq member.memberId }">
										<li><button id="delete" type="button" class="btn btn-danger btn-outline" onclick="unfavorite('${truck.foodtruckId }, panel${sts.index }');">단골해제</button></li>
										</c:if>
									</ul>
								</div>
								<c:if  test="${sts.count != fn:length(trucks) }"><hr></c:if>

							</c:forEach>
						</div>
					</div>
				</div>
				<div class="col-lg-4" style="height:300px;">
	                <div class="panel panel-default">
				        <div class="panel-heading">
	               			<h4 class="panel-title">Location</h4>
	                    </div>
	                    <div class="panel-body"  style="height:300px;" id = "map">
	                    </div>
	                </div>
				</div>
			</div>
			<!-- end page-wrapper -->
		</div>
		<!-- end wrapper -->
	</div>
	<!-- Core Scripts - Include with every page -->
	<script src="${ctx}/resources/plugins/jquery-1.10.2.js"></script>
	<script src="${ctx}/resources/plugins/bootstrap/bootstrap.min.js"></script>
	<script src="${ctx}/resources/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="${ctx}/resources/plugins/pace/pace.js"></script>
	<script src="${ctx}/resources/scripts/siminta.js"></script>  
	
	 
	<!-- Page-Level Plugin Scripts-->
    <script src="${ctx}/resources/scripts/profile.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="http://malsup.github.com/jquery.form.js"></script> 
	<script src="//code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>

			var unfavorite = function(foodtruckId, divId) {
					
					$.ajax({
						type : 'GET',
						url : "${ctx }/favorite/remove.do",
						data : {
							foodtruckId : foodtruckId
						},
						success : function(data) {
							$("#"+divId).remove();
						}
					});
			}
			
			
			
			var pos = [];
			
			var map;
			var markers = [];
	        $(document).ready(function () {
	        	var truckName = [];
	        	
				$('#side-favorite').attr('class', 'selected');
				if ('${loginUserId}' !=''){
					followExist('${member.memberId}');
				}
				
				<c:forEach var="truck" items="${trucks}">
					pos.push("${truck.location}");
					truckName.push("${truck.foodtruckName}");
				</c:forEach>
				var count = 0;
				for(var i=0;i<pos.length;i++){
					console.log(pos[i]);
					naver.maps.Service.geocode({
			 			address: pos[i]
			 		}, function(status, response){
			 			if (status === naver.maps.Service.Status.ERROR) {
			 				position = new naver.maps.LatLng(37.4795169, 126.8824995);
				            return console.log('없는 주소 : ' + pos[i]);
				        }
			 			
			 			var item = response.result.items[0],
			 				point = new naver.maps.Point(item.point.x, item.point.y);
				 		if(map == undefined){
				 			map = new naver.maps.Map('map', {
							    center: point,
							    zoom: 9
							});
				 		}
			 			var marker = new naver.maps.Marker({
							position: point,
							map: map
						});
			 			marker.setZIndex(count);
			 			var contentString = [
			 				'<div style="padding:10px;font-size:11px;">',
			 					'<h4>'+ truckName[count] +'</h4>',
			 					'<p>' + pos[count] + '</p>',
			 				'</div>'
			 			].join('');
			 			
			 			var infowindow = new naver.maps.InfoWindow({
			 				content: contentString
			 			});
			 			
			 			naver.maps.Event.addListener(marker, 'click', function(e) {
			 			    if (infowindow.getMap()) {
			 			        infowindow.close();
			 			    } else {
			 			        infowindow.open(map, marker);
			 			    }
			 			    
			 			    // panelId가 저 div 아이디고 누나가 고칠거는 밑에 fadetoggle부분만 고치시면 되거든요.
			 			    var panelId = "#panel" + marker.getZIndex()
			 			    console.log(panelId);
			 		/* 	   $(panelId).fadeToggle(2000).fadeToggle(2000); */
			 			   $(panelId).effect( "bounce", "slow" );
			 			});
			 			count++;
			 			markers.push(marker);
			 		});
				}
	        });

	        var change = function(index){
				 map.setCenter(markers[index].getPosition());
			}
	        
	        
	</script>

</body>

</html>
