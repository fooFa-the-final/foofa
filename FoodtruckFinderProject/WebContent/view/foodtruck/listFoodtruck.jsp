<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
    <style>
     table.alignCenter {
        margin-left: auto;
        margin-right: auto;
        
        }
        table.border {
            
        }
        tr.border_bottom td {
		  border-bottom:1pt solid #eee;
		}
		 .tr_ad td{
		  border-bottom:1pt solid #ebc074;
		  padding: 8px 0;
		 }
		 .map h3 {
		 padding: 5px;
		 font-size: 14px;}
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
	<script src="${ctx }/resources/plugins/jquery-1.10.2.js"></script>
    <!-- Page-Level CSS -->
    <link href="${ctx }/resources/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=noUvsaR702FX6WH5un5h&submodules=geocoder"></script>

</head>

<body>
    <!--  wrapper -->
    <div id="wrapper">
		<%@ include file="../include/header.jspf"%>
        <!--  page-wrapper -->
    </div>
    <div class="main-container" style="padding:0;">
		<form id="search-with-filter" action="${ctx }/foodtruck/searchByFilter.do" method="post">
            <div class="row"  style="background-color:#eee;">
				<div class="sub-container" style="padding:20px 0;">
                <!-- Page Header -->
                		<h4 class="panel-title">상세 검색</h4>
	                    	<button type="button" id="openstateBtn" name="openstateBtn" class="btn btn-outline btn-default" onClick="stateBtn(this)">OPEN NOW</button>
	                    	<input type="hidden" id="openstate" name="openstate" value="">
		                    <label class="checkbox-inline" style=" margin-left:50px;">
		                   		<input type="checkbox" id="card" name="checkFilter">카드 결제
		                    </label>
				            <label class="checkbox-inline">
		                     	<input type="checkbox" id="drinking" name="checkFilter">알콜 판매
		                    </label>
		                    <label class="checkbox-inline">
		                    	 <input type="checkbox" id="parking" name="checkFilter">주차 가능
		                    </label>
		                    <label class="checkbox-inline">
		                    	 <input type="checkbox" id="catering" name="checkFilter">케이터링
		                    </label>
                     	 	<select id="stand" name="stand" class="form-control" style="width:120px; display:inline-block; margin-left:50px;" onChange="selectBtn()">
	                            <option value="reviewCount">리뷰많은 순</option>	
	                            <option value="favoriteCount">단골많은 순</option>
                            </select>
		                <input type="hidden" id="keyword" name="keyword" value="${keyword }">
						<input type="hidden" id="location" name="location" value="${location }">
						<input type="hidden" id="checking" name="checking" value="">
            	</div>
			</div>
		    <div class="row sub-container" style="text-align:left;">
		    	<div class="col-md-12">
	   				 <div class="col-md-8" id="searchList">
		          		<table style="width:100%" id="dataTables-example">
			            	<colgroup>
			            		<col width="20%"/>
			            		<col width="40%"/>
			            		<col width="40%"/>
			            	</colgroup>
			            	<thead>
			            		<tr></tr>
			            		<tr></tr>
			            	</thead>
			          		<tbody id="ajax-tbody-results">
			          		<c:forEach items="${adtruck }" var="truck" varStatus="sts">
			          			<tr onmouseover="setCenter('${truck.foodtruckId}')" class="tr_ad">
				          			<td rowspan="2" style="padding:10px;">
				          				<img width="130px" height="130px" src="${ctx }/resources/img/food/${truck.foodtruckImg }" style="margin-right:10px">
				          			</td>
				          			<td  colspan="2" style="height:60px">
				          				<a href="${ctx }/review/list/truck.do?foodtruckId=${truck.foodtruckId }"><font size="5px" color="firebrick"><b>${truck.foodtruckName }</b></font></a>&nbsp;
				          				 <button type="button" class="btn btn-outline btn-danger btn-xs">광고</button>
				          				 <c:choose>
				          				 	<c:when test="${truck.state == true }">
												<button type="button" class="btn btn-success btn-xs">Now Open</button>
				          				 	</c:when>
				          				 	<c:otherwise>
												<button type="button" class="btn btn-outline btn-success btn-xs">Closed</button>
				          				 	</c:otherwise>
				          				 </c:choose>
				          			</td>
			          			</tr>
			          			<tr onmouseover="setCenter('${truck.foodtruckId}')"  class="tr_ad">
			    			        <td valign="top">
			          					<span class="starRating" style="text-align:left;"><span id="mainTableScore" style="width: ${truck.score*20 }%">${truck.score }점</span></span><br>
			          					<i class="fa fa-comment fa-fw"></i> ${truck.reviewCount } Reviews &nbsp;
			          					<i class="fa fa-star"></i> ${truck.favoriteCount } Fans<br>
				          			
			          				</td>
			          				<td valign="top">
				          				<i class="fa fa-location-arrow"></i><font size="2px">&nbsp;${truck.spot }</font><Br>
				          				<i class="fa fa-map-marker"></i><font size="2px">&nbsp;${truck.location }</font>
			          					<br><i class="fa fa-bookmark"></i><font size="2px">&nbsp;${truck.category1 }&nbsp;${truck.category2 }&nbsp; ${truck.category3 }</font><br>
			          				</td>

			          			</tr>
			          		</c:forEach>
			          		<c:choose>
			          		<c:when test="${trucks eq null || empty trucks }">
			          			<tr>
			          				<td align="center">해당 검색 결과가 없습니다.</td>
			          			</tr>
			          		</c:when>
			          		<c:otherwise>
			          		<c:forEach items="${trucks }" var="truck" varStatus="sts">
			          			<tr onmouseover="setCenter('${truck.foodtruckId}')" class="border_bottom">
				          			<td rowspan="2" style="padding:10px;">
				          				<img width="130px" height="130px" src="${ctx }/resources/img/food/${truck.foodtruckImg }" style="margin-right:10px">
				          			</td>
				          			<td  colspan="2" style="height:60px">
				          				<a href="${ctx }/review/list/truck.do?foodtruckId=${truck.foodtruckId }"><b><font size="5px" color="black">${truck.foodtruckName }</font></b></a>
				          				 <c:choose>
				          				 	<c:when test="${truck.state == true }">
												<button type="button" class="btn btn-success btn-xs">Now Open</button>
				          				 	</c:when>
				          				 	<c:otherwise>
												<button type="button" class="btn btn-outline btn-success btn-xs">Closed</button>
				          				 	</c:otherwise>
				          				 </c:choose>
				          			</td>
			          			</tr>
			          			<tr onmouseover="setCenter('${truck.foodtruckId}')"  class="border_bottom">
			    			        <td valign="top">
			          					<span class="starRating" style="text-align:left;"><span id="mainTableScore" style="width: ${truck.score*20 }%">${truck.score }점</span></span><br>
			          					<i class="fa fa-comment fa-fw"></i> ${truck.reviewCount } Reviews &nbsp;
			          					<i class="fa fa-star"></i> ${truck.favoriteCount } Fans<br>
				          			
			          				</td>
			          				<td valign="top">
				          				<i class="fa fa-location-arrow"></i><font size="2px">&nbsp;${truck.spot }</font><Br>
				          				<i class="fa fa-map-marker"></i><font size="2px">&nbsp;${truck.location }</font>
			          					<br><i class="fa fa-bookmark"></i><font size="2px">&nbsp;${truck.category1 }&nbsp;${truck.category2 }&nbsp; ${truck.category3 }</font><br>
			          				</td>

			          			</tr>
			          		</c:forEach>
			          		</c:otherwise>
			          		</c:choose>	
			          		</tbody>
		         	 	</table>
	       			 </div>
	       			 <div class="col-md-4" id="scroll">
		       			 <div class="panel panel-danger">
		       			 	<div class="panel-heading">
		       			 		Map
		       			 	</div>
		       			 	<div class="panel-body" style="padding:0px;">
	       						<div id = "map" style="height:400px;"></div>
		       			 	</div>
		       			 </div>
	       			 </div>
				</div>
        
		<div class="col-lg-12" id="pagingArea" style="text-align:center; margin-bottom:100px; margin-top:50px">
			<input type="hidden" id="currentIndex" value="${currentIndex }">
			<input type="hidden" id="allCount" value="${allCount }">
		</div>
	</div>

	</form>
</div>
        <!-- end page-wrapper -->
    <!-- end wrapper -->

    <!-- Core Scripts - Include with every page -->
    <script src="${ctx }/resources/plugins/jquery-1.10.2.js"></script>
    <script src="${ctx }/resources/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="${ctx }/resources/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${ctx }/resources/plugins/pace/pace.js"></script>
    <script src="${ctx }/resources/scripts/siminta.js"></script>
    <!-- Page-Level Plugin Scripts-->
    <script>
    var pos = [];
    var ids = [];
    var markers = [];
	var position;
	var map;
	var floatPosition = parseInt($("#scroll").css('top'));
	$(window).scroll(function() {
		// 현재 스크롤 위치를 가져온다.
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition + "px";

		/* 애니메이션 없이 바로 따라감
		 $("#floatMenu").css('top', newPosition);
		 */

		$("#scroll").stop().animate({
			"top" : newPosition
		}, 500);

	}).scroll();
    $(document).ready(function() {
    	
    	var allCount = $("#allCount").val();
    	var rowCount = 10;
    	var totalIndex = Math.ceil(allCount/rowCount);
    	var firstIndex = "";
    	var lastIndex = "";
    	
    	var currentIndex = $("#currentIndex").val();
    	
    	if(currentIndex == "" || currentIndex == 1){
    		firstIndex = 1;
    		currentIndex = 1;
    	}
    	
    	if(totalIndex <= 10){
    		lastIndex = totalIndex;
    	} else if(firstIndex == 1 && totalIndex > 10){
    		lastIndex = 10;
    	} else {
    		lastIndex = Math.ceil(currentIndex/10)*10;
    		firstIndex = lastIndex - 9;
    		if(lastIndex > totalIndex){
    			lastIndex = totalIndex;
    		}
    	}
    	
    	var pagingHtml = "";
    	var prePagingHtml = "";
    	var postPagingHtml = "";
    	
    	for(var i = firstIndex; i <= lastIndex; i++){
    		if(i == currentIndex){
    			pagingHtml += "<span onclick='movePage(" + i + ")' style='cursor:pointer;'><b>" + "[" + i + "]" + "</b></span>"
    		} else {
    			pagingHtml += "<span onclick='movePage(" + i + ")' style='cursor:pointer;'>" + "[" + i + "]" + "</span>"
    		}
    	}

    	if(currentIndex != 1){
    		prePagingHtml += "<span onclick='movePage(1)' style='cursor:pointer;'>[<<]</span>";
    		var pageBefore = firstIndex - 1;
    		if(pageBefore < 1){
    			pageBefore = 1;
    		}
    		prePagingHtml +="<span onclick='movePage(" + pageBefore + ")' style='cursor:pointer;'>[<]</span>"
    	}
    	if(currentIndex != totalIndex){
    		var Pageafter = lastIndex + 1;
    		if(pageAfter > totalIndex){
    			pageAfter = totalIndex;
    		}
    	}
    	if(currentIndex != totalIndex){
    		var pageAfter = lastIndex + 1;
    		if(pageAfter > totalIndex){
    			pageAfter = totalIndex;
    		}
    		postPagingHtml += "<span onclick='movePage(" + pageAfter + ")' style='cursor:pointer;'>[>]</span>";
    		postPagingHtml += "<span onclick='movePage(" + totalIndex + ")' style='cursor:pointer;'>[>>]</span>"
    	}
    	
    	$("#pagingArea").empty();
    	$("#pagingArea").append(prePagingHtml + pagingHtml + postPagingHtml);
    	
    	var card = "${card}";
    	var drinking = "${drinking}";
    	var parking = "${parking}";
    	var catering = "${catering}";
    	var openstate = "${openState}";
    	var stand = "${stand}";
    	
    	if(card=="true"){
    		$("#card").prop('checked', true);
    	}
    	if(drinking=="true"){
    		$("#drinking").prop('checked', true);
    	}
    	if(parking=="true"){
    		$("#parking").prop('checked', true);
    	}
    	if(catering=="true"){
    		$("#catering").prop('checked', true);
    	}
    	if(openstate=="true"){
    		$("#openstateBtn").removeClass("btn btn-outline btn-default").addClass("btn btn-success");
    		$("#openstate").val("true");
    	}
    	if(stand=="reviewCount"){
    		$("#stand option[value='reviewCount']").attr('selected','selected');
    	} else if(stand=="favoriteCount"){
    		$("#stand option[value='favoriteCount']").attr('selected','selected');
    	}
    	
    	// 지도
    	
    	<c:forEach items="${trucks }" var="truck" varStatus="sts">
	    	naver.maps.Service.geocode({
	 			address: "${truck.location}"
	 		}, function(status, response){
	 			if (status === naver.maps.Service.Status.ERROR) {
		           return console.log('${truck.location} = 잘못찍힌주소');
		        }
	 			var item = response.result.items[0],
	 				point = new naver.maps.Point(item.point.x, item.point.y);
	 			
	 			pos.push(point);
	 			ids.push("${truck.foodtruckId}");
	 			console.log("${truck.foodtruckName}");
	 			if(position == undefined && point != undefined){
	 				position = point;
	 				map = new naver.maps.Map('map', {
		 	    		center: position,
		 	    	    zoom: 10
		 	    	});
	 			}
	 			
	 			var contentString = [
	 				'<div style="padding:10px;width:200px;font-size:14px;line-height:20px;">',
	 					'<h3>${truck.foodtruckName}</h3>',
	 					'<p>${truck.location}</p>',
	 				'</div>'
	 			].join('');
	 			
	 			var infowindow = new naver.maps.InfoWindow({
	 				content: contentString
	 			});
	 			var marker = new naver.maps.Marker({
					position: point,
					map: map
				});
	 			marker.setZIndex("${sts.index}");
	 			markers.push(marker);
	 			naver.maps.Event.addListener(marker, 'click', function(e) {
	 			    if (infowindow.getMap()) {
	 			        infowindow.close();
	 			    } else {
	 			        infowindow.open(map, marker);
	 			    }
	 			});
	 		});  
    	</c:forEach>
    	
	});
    
    var setCenter = function(id){
    	for(var i=0;i<ids.length;i++){
    		if(ids[i] == id){
    			map.setCenter(pos[i]);
    			break;
    		}
    	}
	}
    
    var movePage = function(pageNum) {
		$("#currentIndex").val(pageNum);
		window.location = '${ctx}/foodtruck/searchByKeyLoc.do?keyword=${keyword}&location=${location}&currentIndex=' + pageNum + '';
	}
    
	
	$(":checkbox").change(function() {
	    var notChecked = [], checked = [];
	    $(":checkbox").map(function() {
	        this.checked ? checked.push(this.id) : notChecked.push(this.id);
	    });
	    var checked2 = "";
	    for(var a=0; a<checked.length; a++){
	    	checked2 += checked[a] + "/";
	    }
// 	    alert(checked2);
	    $("#checking").val(checked2);
	    $("#search-with-filter").submit();
	});
	    
	
	var stateBtn = function(obj){
		var notChecked = [], checked = [];
	    $(":checkbox").map(function() {
	        this.checked ? checked.push(this.id) : notChecked.push(this.id);
	    });
	    var checked2 = "";
	    for(var a=0; a<checked.length; a++){
	    	checked2 += checked[a] + "/";
	    }
	    $("#checking").val(checked2);
		
		if($(obj).hasClass("btn btn-outline btn-default")){
			$(obj).removeClass("btn btn-outline btn-default").addClass("btn btn-success");
			$("#openstate").val("true");
			$("#search-with-filter").submit();
		} else {
			$(obj).removeClass("btn btn-success").addClass("btn btn-outline btn-default");
			$("#openstate").val("false");
			$("#search-with-filter").submit();
		}
	}
	
	var selectBtn = function(){
		var notChecked = [], checked = [];
	    $(":checkbox").map(function() {
	        this.checked ? checked.push(this.id) : notChecked.push(this.id);
	    });
	    var checked2 = "";
	    for(var a=0; a<checked.length; a++){
	    	checked2 += checked[a] + "/";
	    }
	    $("#checking").val(checked2);
	    $("#search-with-filter").submit();
	}
	
	
    </script>
    
</body>

</html>
