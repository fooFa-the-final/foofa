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
<link href="${ctx}/resources/plugins/bootstrap/bootstrap.css"
	rel="stylesheet" />
<link href="${ctx}/resources/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<link href="${ctx}/resources/plugins/pace/pace-theme-big-counter.css"
	rel="stylesheet" />
<link href="${ctx}/resources/css/style.css" rel="stylesheet" />
<link href="${ctx}/resources/css/main-style.css" rel="stylesheet" />
<script src="${ctx}/resources/plugins/jquery-1.10.2.js"></script>
<!-- Page-Level CSS -->
<link href="${ctx}/resources/plugins/dataTables/dataTables.bootstrap.css"
	rel="stylesheet" />

</head>

<body>
	<!--  wrapper -->
       <div id="wrapper">
		<%@ include file="../header.jspf"%>
		<%@ include file="../left/memberLeft.jspf"%>

        <!-- end navbar side -->
        <!--  page-wrapper -->
        <div id="page-wrapper">
            <div class="row">
                <!-- Page Header -->
                <div class="col-lg-12" style="height:300px">
                    <span>
                            <a class="navbar-brand" href="#" style="margin-top:10px; margin-left:20px">
                                <img src="${ctx}/resources/img/waikiki.jpg" style="height:250px; width:250px"/>
                            </a>
                            <div class="user-info">
                                <h2>${member.memberId}</h2><br>
                                <h5>${member.email }</h5>
                                <h5>팔로워수&nbsp; ${member.followCount }</h5>
                                <h5>리뷰작성&nbsp;&nbsp;${member.reviewCount }</h5>
                            </div>
                    </span>
                    <c:if test="${loginUser != null  && loginUser != member.memberId}">
                    <span style="float:right; margin-right:50px; margin-top: 30px">
                        <button id="followBtn" type="button" class="btn btn-default btn-circle btn-lg" onclick="follow('${ member.memberId}');"><i class="fa fa-heart"></i></</button>
                    </span>     
                    </c:if>   
                </div>
                <!--End Page Header -->
                <div class="col-lg-12" style="background-color:white;padding:30px">
                	<h3>Favorite</font></h3>
                		<c:forEach items="${list }" var="review">
                		<div class="col-lg-10" style="margin-top:30px" id="rev${review.reviewId }">
                			<div class="col-lg-11" style="display:inline-block">
                				<div class="col-lg-9">
                					<h4><a href="${ctx }/review/list/truck.do?foodtruckId=${review.foodtruck.foodtruckId }">${review.foodtruck.foodtruckName }</a></h4>
                					<h4>${review.foodtruck.category1 }</h4>
                				</div>
                				<div class="col-lg-3">
	                			<c:set value="${review.writer.memberId }" var="writerId"/>
	                			<c:if test="${nowId eq writerId}">
	                				<span style="float:right"><a href = "${ctx }/review/modify.do?reviewId=${review.reviewId}" class="btn btn-default">modify</a><input type="button" class="btn btn-default" value="delete" onClick="revDel('${review.reviewId}')"></span>
	                			</c:if><br>
	                			</div>
                			</div>
                			<div class="col-lg-12" style="display:inline-block">
                				<div class="col-lg-4">
                					<img src="${ctx}/resources/img/food01.jpg" alt="" style="width:320px;height:300px"/>
                				</div>
                				<div class="col-lg-4">
                					<img src="${ctx}/resources/img/food02.jpg" alt="" style="width:320px;height:300px"/>
                				</div>
                			</div>
                			<div class="col-lg-11" style="display:inline-block;margin-top:30px">
                			<font size="4">
                				<div class="col-lg-10">
                					<i class="fa fa-thumbs-up" ></i> : ${review.recommand }
                				</div>
                				<div class="col-lg-2">
                					${review.writeDate }
                				</div>
                			</font>
                			</div>
                			
                		</div>
                		</c:forEach>
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

	<!--  Page Script  -->	
	<script>
    $(document).ready(function () {
		$('#side-review').attr('class', 'selected');
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
	
	var follow = function(memberId){
 		var btn = $("#followBtn");
 		var classN = btn.attr('class');
 		var url ="";
 		
 		if(classN == "btn btn-default btn-circle btn-lg"){
 			url = "${ctx}/follow/create.do";
 			classN = "btn btn-danger btn-circle btn-lg";
 		} else {
 			url = "${ctx}/follow/remove.do";
 			classN = "btn btn-default btn-circle btn-lg";
 		}
 		
 		$.ajax({
 			type:'GET',
 			url : url,
 			data:{
 				toId : memberId
 			},
 			success : function(data){
 				if (data) {
 					btn.attr("class", classN);
				} 
 			}
 		});
 	};
</script>

	
</body>

</html>
