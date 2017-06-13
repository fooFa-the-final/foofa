<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                <div class="col-md-10">
                	<h1>My Followers Review</h1>
                	<c:forEach items="${list }" var="Review">
                		<%-- <div class = "col-md-offset-1 col-md-6" style="margin-top:50px">
                		<span><font class="h3"><a href="${ctx }/review/list/truck.do?foodtruckId=${Review.foodtruck.foodtruckId }">${Review.writer.memberId }</a></font></span>
                		<span style="float:right"><input type="button" value="follow" class="btn btn-result"> <input type="button" value="!" class="btn btn-result" data-toggle="modal" data-target="#myModal${Review.reviewId }"></span><br>
                		<c:forEach items="${Review.images }" var = "image">
			                			<img src="${ctx }/resources/img/reviewImg/${image.filename}" width="150px" height="150px">
                		</c:forEach>
			                		<br><br>
                		<font size="4px">
                		<span>점수 : ${Review.score } <button style="border:0;background-color:transparent" onClick="recReview('${Review.reviewId}')"><i class="fa fa-thumbs-up" id="rec" ></i></button>: 
		                		<input type="text" id="rec${Review.reviewId}" value="${Review.recommand }" style="border: 0px;" size=1 readonly></span>
		                		<span style="float:right">${Review.writeDate }</span><br>
		                		${Review.contents }	
                		</font> --%>
                		<div class="panel panel-primary text-left">
									<div class="review-heading padding-10">
										<img class="somenail" src="${ctx }/resources/upload/${Review.writer.profileImg }"/>
										<div style="float:left; width:40%;">
											<ul>
												<li><a href="${ctx }/review/list/member.do?memberId=${Review.writer.memberId }">${Review.writer.memberId }</a></li>
												<li> <span class="sub-li-follow"><button style="border:0;background-color:transparent" onClick="recReview('${Review.reviewId}')"><i class="fa fa-thumbs-up" id="rec" ></i></button> <input type="text" id="rec${Review.reviewId}" value="${Review.recommand }" style="border: 0px;background-color:transparent" size=1 readonly> </span>
													 <span class="sub-li-favorite">71 </span>
												</li>
												<li> <a href="${ctx }/review/list/truck.do?foodtruckId=${Review.foodtruck.foodtruckId }">${Review.foodtruck.foodtruckName }</a> 에 대한 리뷰 </li>
											</ul>
										</div>
										<div style="float:right">
											<span style="float:right"><input type="button" value="follow" class="btn btn-default"> <input type="button" value="!" class="btn btn-default" data-toggle="modal" data-target="#myModal${Review.reviewId }"></span>
										</div>
									</div>
									<div class="panel-body ">
										<div style="display:block;width:500px; float:right;">
											<span class="starRating" style="text-align:left;"><span style="width: ${Review.score *20}%">${Review.score }점</span></span> ${Review.writeDate}
											<p class="reviewContent">${Review.contents }
											</p>
										</div>
										<div style="float:left; width:180px">
											<img id="${Review.reviewId}" src="${ctx }/resources/img/reviewImg/${Review.mainImage.filename }" style="width: 160px; height:160px; margin:10px"/>
											<div class="somenail-list">
												<c:forEach var="image" varStatus="imageNo" items="${Review.images }">
													<img src="${ctx }/resources/img/reviewImg/${image.filename}" onclick="previewImage(this.src, '${Review.reviewId}');"/>
												</c:forEach>
											</div>
										</div>							
									</div>
								</div>					
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
                		
                	</c:forEach>
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
    <script src="${ctx}/resources/scripts/profile.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="http://malsup.github.com/jquery.form.js"></script> 
    <script>
    $(document).ready(function () {
		$('#side-news').attr('class', 'selected');
		if ('${loginUserId}' !=''){
			followExist('${member.memberId}');
		}
    });
    </script>

</body>
</html>