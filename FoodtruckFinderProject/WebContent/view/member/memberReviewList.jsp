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
                <div class="col-lg-12">
	                <div class="panel panel-default">
                        <div class="panel-heading">
                			<h4 class="panel-title">My Reviews</h4>
                        </div>
                        <div class="panel-body">
                            <div class="panel-group" id="accordion">
		                		<c:forEach items="${list }" var="review" varStatus="sts">
		                			<c:choose>
			                			<c:when test="${sts.count ==1 }">
			                                <div class="panel panel-success"  id="rev${review.reviewId }">
			                                    <div class="panel-heading">
			                                        <h4 class="panel-title" style="display:inline-block;">
			                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">${review.foodtruck.foodtruckName }</a>
			                                        </h4>
			                                        <span style="float:right;margin-top:5px; font-size:1em; color:black;">${review.writeDate}</span>
			                                    </div>
			                                    <div id="collapseOne" class="panel-collapse collapse in">
			                                        <div class="panel-body">
														<div style="float:left; width:180px">
															<img id="${review.reviewId}" src="${ctx }/resources/img/reviewImg/${review.mainImage.filename }" style="width: 160px; height:160px; margin:10px"/>
															<div class="somenail-list">
																<c:forEach var="image" varStatus="imageNo" items="${review.images }">
																	<img src="${ctx }/resources/img/reviewImg/${image.filename}" onclick="previewImage(this.src, '${review.reviewId}');"/>
																</c:forEach>
															</div>
														</div>
														<div style="display:block;width:70%; float:left;">
															<span class="starRating" style="text-align:left; margin-bottom:10px;"><span style="width: ${review.score *20}%">${review.score }점</span></span> 
															<p class="reviewContent">${review.contents }
															</p>
														</div>
			                                        	<c:if test="${loginUserId == member.memberId }">
															<span style="float:right; width:12%; text-align:right;">
			                                        		<button type="button" class="btn btn-circle btn-primary  btn-lg" style="margin-right:5px;" onclick="location.href='${ctx }/review/modify.do?reviewId=${review.reviewId}'"><i class="fa fa-edit"></i></button><button type="button" class="btn btn-circle btn-danger  btn-lg"><i class="fa fa-times"  onclick="revDel('${review.reviewId}');"></i></button></span>
			                                        	</c:if>
			                                        </div>
			                                       	 
			                                    </div>
			                                </div>
			                			</c:when>
			                			<c:otherwise>
			                                <div class="panel panel-success" id="rev${review.reviewId }">
			                                    <div class="panel-heading">
			                                        <h4 class="panel-title" style="display:inline-block;">
			                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse${sts.count }">${review.foodtruck.foodtruckName }</a>
			                                        </h4>
			                                        <span style="float:right;margin-top:5px; font-size:1em; color:black;">${review.writeDate}</span>
			                                    </div>
			                                    <div id="collapse${sts.count }" class="panel-collapse collapse">
			                                        <div class="panel-body">
														<div style="float:left; width:180px">
															<img id="${review.reviewId}" src="${ctx }/resources/img/reviewImg/${review.mainImage.filename }" style="width: 160px; height:160px; margin:10px"/>
															<div class="somenail-list">
																<c:forEach var="image" varStatus="imageNo" items="${review.images }">
																	<img src="${ctx }/resources/img/reviewImg/${image.filename}" onclick="previewImage(this.src, '${review.reviewId}');"/>
																</c:forEach>
															</div>
														</div>
														<div style="display:block;width:70%; float:left;">
															<span class="starRating" style="text-align:left;margin-bottom:10px;"><span style="width: ${review.score *20}%">${review.score }점</span></span> 
															<p class="reviewContent">${review.contents }
															</p>
														</div>
			                                        	<c:if test="${loginUserId == member.memberId }">
															<span style="float:right; width:12%; text-align:right;">
			                                        		<button type="button" class="btn btn-circle btn-primary btn-lg" style="margin-right:5px;" onclick="location.href='${ctx }/review/modify.do?reviewId=${review.reviewId}'"><i class="fa fa-edit"></i></button><button type="button" class="btn btn-circle btn-danger  btn-lg"><i class="fa fa-times"  onclick="revDel('${review.reviewId}');"></i></button></span>
			                                        	</c:if>
			                                        </div>
			                                    </div>
			                                </div>
			                			</c:otherwise>	
			                		</c:choose>
		                		</c:forEach>
                            </div>
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

</script>

	
</body>

</html>
