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
                                <h5>${truck.category1 }</h5>
                                <h5>${truck.spot }</h5>
                                <h5><span id="followCount">${truck.favoriteCount }</span>이 해당 푸드트럭을 단골로 등록했습니다.</h5>
                                <h5>${fn:length(reviewList)} Reviews</h5>
                            </div>
                    </span>
                    <span style="float:right; margin-right:50px; margin-top: 30px">
                        <button id="favoriteBtn" type="button" class="btn btn-default btn-circle btn-lg" onclick="favorite('${truck.foodtruckId }');"><i class="fa fa-heart"></i></button>
                        <a href="${ctx }/review/create.do?foodtruckId=${truck.foodtruckId}"><button type="button" class="btn btn-danger">리뷰 작성</button></a>
                    </span>        
                </div>
                <!--End Page Header -->
                <div class="col-md-10 col-md-offset-1" style="background-color:white">
                	<div class="col-md-12" style="background-color:black;height:2px;margin-top:10px">
                	</div>
                	<div class="col-md-12" style="margin-top:10px; margin-left:50px; display:inline-block">
	                	<div class="col-md-6">
		                	<form>
								 <fieldset class="truck-border">
								  <legend class="truck-border">Today</legend>
								  <font size = "3">
									  Today's Hour	&nbsp; ${startTime }부터 ${endTime }까지 영업합니다.<br>
									  Today's Location &nbsp; ${truck.spot }<br>
									  Today's Issue<br>&nbsp; ${truck.notice }
								  </font>
								 </fieldset>
							</form>
	                		<form>
								 <fieldset class="truck-border">
								  <legend class="truck-border">Menu</legend>
								  <font size = "3">
								  <c:forEach items="${truck.menus }" var="menu">
								  	<span style="float:left; width:360px">${menu.menuName } </span>
								  	<span style="width: auto; text-align:center;"> &#8361; ${menu.price }</span>
								  	<c:if test="${menu.menuState eq true }">
										<span style="float:right">판매중</span>
								  	</c:if>
								  	<c:if test="${menu.menuState eq false }">
								  		<span style="float:right"><font color="red">매진</font></span>
								  	</c:if>
								  	<br>
								  </c:forEach>
								 </font>
								 </fieldset>
							 <fieldset class="truck-border">
							  <legend class="truck-border">Today</legend>
							  <font size = "4">
								  Today's Hour: ${startTime } ~ ${endTime }<br>
								  Today's Location: ${truck.location }<br>
								  Today's Issue<br><br> ${truck.notice }
							  </font>
							 </fieldset>
							</form>
							
	                	</div>
	                	<div class="col-md-4 col-md-offset-1" style="border: 1px solid; height:400px; margin-top:15px;" id="map">
	                		
	                	</div>
                	</div>
                	<div class="col-md-12" style="margin-top:30px; margin-bottom:20px;display:inline-block">
                		<div class="col-md-7" style="margin-top:20px">
                		<font size="6">Reviews</font>
                		<span style="float:right"><a href="${ctx }/review/create.do?foodtruckId=${truck.foodtruckId}" class="btn btn-default">+ Add my review</a></span>
                		<c:forEach items="${reviewList }" var="Review">
	                		<div class = "col-md-offset-1 col-md-11" style="margin-top:50px">
		                		<span><font class="h3"><a href="${ctx }/review/list/member.do?memberId=${Review.writer.memberId}">${Review.writer.memberId}</a></font></span>
		                		<span style="float:right"><input type="button" value="follow" class="btn btn-result"> <input type="button" value="!" class="btn btn-result" data-toggle="modal" data-target="#myModal${Review.reviewId }"></span><br>
			                		<c:forEach items="${Review.images }" var = "image">
			                			<img src="${ctx }/resources/img/reviewImg/${image.filename}" width="150px" height="150px">
			                		</c:forEach><br><br>
		                		<font size="4px">
		                		<span>점수 : ${Review.score } <button style="border:0;background-color:white" onClick="recReview('${Review.reviewId}')"><i class="fa fa-thumbs-up" id="rec" ></i></button>: 
		                		<input type="text" id="rec${Review.reviewId}" value="${Review.recommand }" style="border: 0px;" size=1 readonly></span>
		                		<span style="float:right">${Review.writeDate }</span><br>
		                		${Review.contents }	
		                		</font>
		                		<!-- Modal -->
								  <div class="modal fade" id="myModal${Review.reviewId }" role="dialog">
								    <div class="modal-dialog">
								    
								      <!-- Modal content-->
								      <div class="modal-content">
								        <div class="modal-header">
								          <button type="button" class="close" data-dismiss="modal">&times;</button>
								          <h4 class="modal-title">신고창</h4>
								        </div>
								        
								        <div class="modal-body">
								           	<h4>리뷰 내용 : ${Review.contents }</h4>
								          <input type="radio" name = "reason${Review.reviewId }" value="욕설" onClick="untype()"> 욕설<br>
								          <input type="radio" name = "reason${Review.reviewId }" value="음란" onClick="untype()"> 음란<br>
								          <input type="radio" name = "reason${Review.reviewId }" value="광고" onClick="untype()"> 광고<br>
								          <input type="radio" name = "reason${Review.reviewId }" value="부적절한 리뷰" onClick="untype()"> 부적절한 리뷰<br>
								          <input type="radio" name = "reason${Review.reviewId }" value="direct" onClick="availableType()" > 직접 적겠습니다.<br>
								          <input type="text" class="form-control" placeholder="신고 사유를 적어주세요" id="reason${Review.reviewId}" readonly disabled name="reasonContents">
								        </div>
								        <div class="modal-footer">
								          <input type="button" class="btn btn-default" data-dismiss="modal" value="신고" onClick="report('${Review.reviewId}')">
								          <input type="button" class="btn btn-default" data-dismiss="modal" value="신고 취소">
								        </div>
								      </div>
								      
								    </div>
								  </div>
	                		</div>
                		</c:forEach>
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
    
    <!-- Page Scripts -->
    <script src="${ctx }/resources/plugins/jquery-1.10.2.js"></script>
    <script src="${ctx }/resources/scripts/profile.js"></script>
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
	 		favoriteCount("${truck.foodtruckId}");
	 		exist("${truck.foodtruckId}");
	 		
 	 		
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
		 		
	 		}
	 		)   
	 	});
	 	var recReview = function(reviewId){
	 		
	 		$.ajax({
	 			type:'get',
	 			url : "${ctx }/review/recommand.do",
	 			data:{
	 				reviewId : reviewId
	 			},
	 			success : function(data){
	 				var revId = "#rec" + reviewId;
 					var recCount = eval($(revId).val());
 					$(revId).val("");
	 				if ($.trim(data) == 'true') {
	 					$(revId).val(recCount+1);
						alert("리뷰를 추천하셨습니다.");
					} else if ($.trim(data) == 'false') {
	 					$(revId).val(recCount-1);
						alert("리뷰를 추천 해제 하셨습니다.")
					}
	 			}
	 		});
	 	}
	 	
	 	var report = function(reviewId){
	 		var reaId = "#reason" + reviewId;
	 		var name = "reason" + reviewId
	 		var st = $(":input:radio[name='"+ name + "']:checked").val();
	 		$.ajax({
	 			type:'POST',
	 			url : "${ctx}/review/report/create.do",
	 			data:{
	 				reviewId : reviewId, reason : st
	 			},
	 			success : function(data){
	 				if ($.trim(data) == 'true') {
						alert("신고 등록이 완료되었습니다.");
					} else if ($.trim(data) == 'false') {
						alert("이미 신고된 리뷰입니다.");
					}
	 			}
	 		});
	 	}
	 	
	 	var untype = function(){
	 		 $("input[name=reasonContents]").attr("readonly",true).attr("disabled", true);
	 		 //$("input[name=reasonContents]").attr("disabled",true);
	 	}
	 	
	 	var availableType = function(){
	 		 $("input[name=reasonContents]").attr("readonly",false).attr("disabled", false);
	 		 //$("input[name=reasonContents]").attr("disabled",true);
	 	}

	 </script>
</body>
</html>
