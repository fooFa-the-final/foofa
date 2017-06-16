<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<c:set value="${pageContext.request.contextPath}" var="ctx" />
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>뉴스피드</title>
    <!-- Core CSS - Include with every page -->
    <link href="${ctx}/resources/plugins/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="${ctx}/resources/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="${ctx}/resources/plugins/pace/pace-theme-big-counter.css" rel="stylesheet" />
    <link href="${ctx}/resources/css/style.css" rel="stylesheet" />
    <link href="${ctx}/resources/css/main-style.css" rel="stylesheet" />
<script>
	var recReview = function(reviewId){
		if('${loginUserId}' == '') {
			location.href='${ctx}/login.do';
		} else {
		
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
	  
</script>
</head>

<body>
    <!--  wrapper -->
    
    <div id="wrapper">
		<%@ include file="../include/header.jspf"%>
        <%@ include file="../include/memberLeft.jspf"%>
        
        <!--  page-wrapper -->
        <div id="page-wrapper">
                <div class="row" >

                <!-- Page Header -->
 					<%@ include file="../include/memberProfile.jspf" %>
                <!--End Page Header -->
                
               		<div class="col-lg-12">
                		<div class="panel panel-default">
                			<div class="panel-heading">
                				Follower Newspeed
                			</div>
                			<div class=" panel-body panel-default">
						<c:set scope="page" var="lsize" value="${fn:length(list) /3 }"/>
						<c:choose>
							<c:when test="${fn:length(list) == 0 }">
									<div class="panel panel-primary text-left">
										등록된 팔로우들의 리뷰가 없습니다.
									</div>							
							</c:when>
							<c:otherwise>
								<c:forEach var="review" varStatus="reviewNo" items="${list }">
										<c:if test="${reviewNo.count == 1 }">
										<div class="col-lg-4"  style=" z-index: 1;position: relative;">
										</c:if>
											<div class="panel panel-default" id="${reviewNo.count }">
												<div class="panel-heading" style="height:80px;">
													<img class="somenail" src="${ctx }/resources/upload/${review.writer.profileImg }"/>
													<div style="float:left; width:180px; margin-left:10px; overflow:hidden;">
														<ul class="list-unstyled">
															<li><h4><a href="${ctx }/review/list/member.do?memberId=${review.writer.memberId }">${review.writer.memberId }</a></h4></li>
															<li> <span class="sub-li-follow"><i class="fa fa-thumbs-up"></i> <span  id="rec${review.reviewId }" >${review.recommand }</span> </span>
																 <span class="sub-li-favorite"><i class="fa fa-twitter"></i>${review.writer.followCount } </span>
																 <span class="sub-li-edit"><i class="fa fa-edit"></i>${review.writer.reviewCount } </span>
															</li>
														</ul>
													</div>	
												<div class="drop-down-btn-check info drop-down-btn"> 
													<i class="fa fa-check"></i>
															<div class="dis-none drop-down-list">
						                       					<button id="recommandBtn_${review.reviewId }" type="button" class="btn btn-success btn-circle btn-lg" style="margin:5px;" onclick="recReview('${review.reviewId}');">
																	<i class="fa fa-thumbs-up"></i></button>&nbsp;추천하기
						                       					<button id="repportBtn_${review.reviewId }" type="button" class="btn btn-warning btn-circle btn-lg" style="margin:5px;" data-toggle="modal" data-target="#myModal${review.reviewId }">
																	<i class="fa fa-warning"></i></button>&nbsp;신고하기
																<c:if test="${loginUserId == member.memberId }">
																	<button id="repportBtn_${review.reviewId }" type="button" class="btn btn-default btn-circle btn-lg" style="margin:5px;" onclick="unfollow('${review.writer.memberId}')">
																		<i class="fa fa-twitter"></i></button>&nbsp;언팔로우
																</c:if>
																
															</div>	
												</div>

												</div>
												<div class="panel-body" style="min-height:150px;">
													<h5><a href="${ctx }/review/list/truck.do?foodtruckId=${review.foodtruck.foodtruckId }">${review.foodtruck.foodtruckName }</a>&nbsp;&nbsp;<span class="starRating" style="text-align:left;"> <span style="width: ${review.score *20}%">${review.score }점</span></span></h5>
													 ${review.writeDate}
													<hr>
													<c:if test="${review.mainImage.filename != 'noimagefound.jpg'}">
													<div class="reviewMainImg" style="width:100%; padding-bottom:10px; border-bottom:1px solid #eee; margin-bottom:10px;">
														<img id="${review.reviewId}" src="${ctx }/resources/img/reviewImg/${review.mainImage.filename }" style="width: 88%; height:160px; margin:0px; float:left;"/>
														<div class="somenail-list" style="width:2%;float:left;">
															<c:forEach var="image" varStatus="imageNo" items="${review.images }">
																<img src="${ctx }/resources/img/reviewImg/${image.filename}" onclick="previewImage(this.src, '${review.reviewId}');"/>
															</c:forEach>
														</div>
													</div>	
													</c:if>

													<p>
												${review.contents }
												</p>
												</div>		
											</div>
											<c:if test="${(lsize < reviewNo.count && reviewNo.count <= lsize+1)  || (lsize*2-1 <= reviewNo.count && reviewNo.count  < lsize*2)}">
											</div>
											<div class="col-lg-4" id="next${reviewNo.count }">
											</c:if>
								</c:forEach>		
								</div>				
								<button type="button" class="btn btn-info btn-lg btn-block" onclick="location.href='${ctx}/follow/list.do'">내 팔로우들 뉴스피드 보러가기</button>
							</c:otherwise>
						</c:choose>
						</div>
					</div>
				</div>
            </div>
        </div>
        <!-- end page-wrapper -->
        
    </div>
    <!-- end wrapper -->

    <!-- Core Scripts - Include with every page -->
    <script src="${ctx}/resources/plugins/jquery-1.10.2.js"></script>
    <script src="${ctx}/resources/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="${ctx}/resources/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${ctx}/resources/plugins/pace/pace.js"></script>
    <script src="${ctx}/resources/scripts/siminta.js"></script>

	<!-- Page-Level Plugin Scripts-->
    <script src="${ctx}/resources/scripts/default.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="http://malsup.github.com/jquery.form.js"></script> 
    <script>
    $(document).ready(function () {
		$('#side-news').attr('class', 'selected');
		if ('${loginUserId}' !=''){
			followExist('${member.memberId}');
		}
    });
    
	var unfollow = function(toId) {
		var btn = $("#delete");
		$.ajax({
			type : 'GET',
			url : "${ctx }/follow/remove.do",
			data : {
				toId : toId
			},
			success : function(data) {
				window.location.reload();
				
			}
		});
	};
    </script>

</body>
</html>