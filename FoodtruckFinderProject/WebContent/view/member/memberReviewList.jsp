<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<c:set value="${pageContext.request.contextPath}" var="ctx" />
<c:set value="${nowId }" var="nowId"/>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>리뷰 목록</title>
<!-- Core CSS - Include with every page -->
<link href="${ctx}/resources/plugins/bootstrap/bootstrap.css" rel="stylesheet" />
<link href="${ctx}/resources/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href="${ctx}/resources/plugins/pace/pace-theme-big-counter.css" rel="stylesheet" />
<link href="${ctx}/resources/css/style.css" rel="stylesheet" />
<link href="${ctx}/resources/css/main-style.css" rel="stylesheet" />
<!-- Page-Level CSS -->
<link href="${ctx}/resources/plugins/dataTables/dataTables.bootstrap.css"
	rel="stylesheet" />

</head>
<style>
label {
width:55px;}
</style>
<body>
<!--  wrapper -->
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
                			<h4 class="panel-title">My Reviews</h4>
                        </div>
                        <div class="panel-body">
                            <div class="panel-group" id="accordion">
		                		<c:forEach items="${list }" var="review" varStatus="sts">
	                                <div class="panel panel-info"  id="rev${review.reviewId }" onmouseover="setTruckDiv('${review.foodtruck.foodtruckName}', '${review.foodtruck.foodtruckImg}', '${review.foodtruck.operationTime}', '${review.foodtruck.location}', '${review.foodtruck.category1}', '${review.foodtruck.category2}', '${review.foodtruck.category3}', '${review.foodtruck.state}', '${review.foodtruck.favoriteCount}', '${review.foodtruck.foodtruckId}', '${review.foodtruck.score }');">
	                                    <div class="panel-heading">	
	                                        <h4 class="panel-title" style="display:inline-block; margin-right:20px;" >
	                                            <a href="${ctx }/review/list/truck.do?foodtruckId=${review.foodtruck.foodtruckId }">${review.foodtruck.foodtruckName }</a>
	                                        </h4>
	                                        <span style="float:right;font-size:1em; color:black;">${review.writeDate}</span>
	                                    </div>
                                        <div class="panel-body">
											<div class="reviewMainImg">
												<img id="${review.reviewId}" src="${ctx }/resources/img/reviewImg/${review.mainImage.filename }" />
												<div class="somenail-list">
													<c:forEach var="image" varStatus="imageNo" items="${review.images }">
														<img src="${ctx }/resources/img/reviewImg/${image.filename}" onclick="previewImage(this.src, '${review.reviewId}');"/>
													</c:forEach>
												</div>
											</div>
											<div style="display:block;width:70%; float:left;">
												<span class="starRating" style="text-align:left;"><span style="width: ${review.score *20}%">${review.score }점</span></span> 
											
												<p class="reviewContent">${review.contents }
												</p>
											</div>
                                        	<c:if test="${loginUserId == member.memberId }">
												<span style="float:right; width:22%; text-align:right;">
                                        			<button type="button" class="btn btn-circle btn-primary  btn-lg" style="margin-right:5px;" onclick="location.href='${ctx }/review/modify.do?reviewId=${review.reviewId}'"><i class="fa fa-edit"></i></button>
                                        			<button type="button" class="btn btn-circle btn-danger  btn-lg"><i class="fa fa-trash-o"  onclick="revDel('${review.reviewId}');"></i></button>
                                        		</span>
                                        	</c:if>
                                        </div>
	                                     <c:if test="${sts.count ==1 }">
	                                    <c:set scope="page" var="truck" value="${review.foodtruck }"/></c:if>
	                                </div>
		                		</c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="truckDiv" class="col-lg-4" style="height:500px">
	                <div class="panel panel-default">
                        <div class="panel-heading">
                			<h4 class="panel-title">Foodtruck</h4>
                        </div>
                        <div class="panel-body" id="truckBody">
                        	
                		</div>
                	</div>
                </div>
            </div>

      </div>
        <!-- end page-wrapper -->
</div>
	    <!-- Core Scripts - Include with every page -->
    <script src="${ctx}/resources/plugins/jquery-1.10.2.js"></script>
    <script src="${ctx}/resources/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="${ctx}/resources/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${ctx}/resources/plugins/pace/pace.js"></script>
    <script src="${ctx}/resources/scripts/siminta.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<!-- Page-Level Plugin Scripts-->
    <script src="${ctx}/resources/scripts/profile.js"></script>
	<script src="http://malsup.github.com/jquery.form.js"></script> 
	<script>
	
	
    $(document).ready(function () {
		$('#side-review').attr('class', 'selected');
		if ('${loginUserId}' !=''){
			followExist('${member.memberId}');
		}
		setTruckDiv('<c:out value="${truck.foodtruckName}"/>', '<c:out value="${truck.foodtruckImg}"/>', '<c:out value="${truck.operationTime}"/>', '<c:out value="${truck.location}"/>', '<c:out value="${truck.category1}"/>', '<c:out value="${truck.category2}"/>', '<c:out value="${truck.category3}"/>', '<c:out value="${truck.state}"/>', '<c:out value="${truck.favoriteCount}"/>', '<c:out value="${truck.foodtruckId}"/>', '<c:out value="${truck.score}"/>');
    });

	var revDel = function(reviewId){
		$.ajax({
			type:'get',
			url : "${ctx}/review/remove.do",
			data:{
				reviewId : reviewId
			},
			success : function(data){
				var divId = "#rev"+reviewId;
				console.log(divId)
				$(divId).remove();
				alert("리뷰가 삭제되었습니다.");
			}
		});
	}
	var floatPosition = parseInt($("#truckDiv").css('top'));
	$(window).scroll(function() {
		// 현재 스크롤 위치를 가져온다.
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition + "px";

		/* 애니메이션 없이 바로 따라감
		 $("#floatMenu").css('top', newPosition);
		 */

		$("#truckDiv").stop().animate({
			"top" : newPosition
		}, 500);

	}).scroll();
	
	var setTruckDiv = function(name, img, time, loc, c1, c2, c3, state, favorite, id, score){
		favoriteExist2(id);
		
		var html = '<h4 style="text-align:center;">'+name+'</h4>';
		html += '<div class="col-lg-5"><img src="${ctx}/resources/img/food/'+img+'" style="width:125px; height:125px; border-radius:20px;"></div>';
		html += '<div class="col-lg-7"><label>운영시간</label>'+time+'<br><label>위치</label>'+loc+'<br><label>카테고리</label>'+c1+'&nbsp;'+c2+'&nbsp;'+c3+'<br><label>평점</label><span class="starRating" style="text-align:left;"><span style="width: '+score*20+'%">'+score*20+'점</span></span><br>';
		if("${loginUserId == member.memberId}"){
			html += '<button id="favoriteBtn" type="button" class="btn btn-outline btn-success" style="margin: 10px 0 0 70px" onclick="favorite2(\''+id+'\')"><i class="fa fa-star"></i>&nbsp;<span id="favoriteCount">'+favorite+'</span></button></div>';
		}else {
			html += '<button id="favoriteBtn" type="button" class="btn btn-outline btn-success" style="margin: 10px 0 0 70px" onclick="location.href=\'${ctx}login.do\'"><i class="fa fa-star"></i>&nbsp;<span id="favoriteCount">'+favorite+'<span></button></div>';
		}
		
		$("#truckBody").html(html);
		
	};
	 
	var favoriteExist2 = function(truckId) {
		$.ajax({
			type : 'get',
			url : "/FoodtruckFinderProject/favorite/exist.do",
			data : {
				foodtruckId : truckId
			},
			success : function(data) {
				if (data) {
					$("#favoriteBtn").attr('class',
							'btn btn-success');
				} else {
					$("#favoriteBtn").attr('class',
							'btn btn-outline btn-success');
				}
			}
		});
	};
	// favorite : unfavorite
	var favorite2 = function(truckId) {
		
		var btn = $("#favoriteBtn");
		var classN = btn.attr('class');
		var count =$("#favoriteCount").text();
		var url = "";

		if (classN == "btn btn-outline btn-success") {
			url = "/FoodtruckFinderProject/favorite/create.do";
			classN = "btn btn-success";
		} else {
			url = "/FoodtruckFinderProject/favorite/remove.do";
			classN = "btn btn-outline btn-success";
		}

		$.ajax({
			type : 'GET',
			url : url,
			data : {
				foodtruckId : truckId
			},
			success : function(data) {
				if (data) {
					btn.attr("class", classN);
					if (classN == "btn btn-outline btn-success") {
						$("#favoriteCount").text(eval(count)-1);
					} else {
						$("#favoriteCount").text(eval(count)+1);
					}
				}
			}
		});
		favoriteCount(truckId);
	};
</script>

	
</body>

</html>
