<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<c:set value="${pageContext.request.contextPath}" var="ctx" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FoodtruckMain</title>
<!-- Core CSS - Include with every page -->
<link href="${ctx}/resources/plugins/bootstrap/bootstrap.css"
	rel="stylesheet" />
<link href="${ctx}/resources/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<link href="${ctx}/resources/plugins/pace/pace-theme-big-counter.css"
	rel="stylesheet" />
<link href="${ctx}/resources/css/style.css" rel="stylesheet" />
<link href="${ctx}/resources/css/main-style.css" rel="stylesheet" />

<!-- Page CSS -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="${ctx}/resources/plugins/timeline/timeline.css" rel="stylesheet" />
<link href="${ctx}/resources/plugins/morris/morris-0.4.3.min.css" rel="stylesheet" />
    


<style>
.mySlides {display:none; width: 900px; margin: 0 auto;}
.w3-left, .w3-right, .w3-badge {cursor:pointer}
.w3-badge {height:13px;width:13px;padding:0}
</style>
</head>

<body class="main-body">
	<!-- navbar top -->

	<nav id="mainNav" class=" main-head-top effect" role="navigation" id="navbar" style=" background-color: rgba(0, 0, 0, .8);">
		<!-- navbar-header -->
		<br>
		<div class="col-lg-12 top-head-menu" style="">
		            <ul class="nav navbar-top-links navbar-right">
		            <li class="dropdown"  style="padding:0px;">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-2x"></i>
                    </a>
                    <!-- dropdown user-->
                    
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="${ctx }/review/list/member.do"><i class="fa fa-user fa-fw"></i>${loginUserId } Profile</a>
                        </li>
                        <li><a href="${ctx }/member/modify.do"><i class="fa fa-gear fa-fw"></i>Info Modify</a>
                        </li>
                        <li class="divider"></li>
                        <c:choose>
                        	<c:when test="${loginUserId ne null }">
                        		<li><a href="${ctx }/logout.do"><i class="fa fa-sign-out fa-fw"></i>Logout</a></li>
                        	</c:when>
                        	<c:otherwise>
                      		  	<li><a href="${ctx }/login.do"><i class="fa fa-sign-out fa-fw"></i>Login</a></li>
                        	</c:otherwise>
                        </c:choose>
                    </ul>
                    <!-- end dropdown-user -->
                </li>
		            </ul>
		</div>
		<ul class="nav navbar-top-links navbar-main-links navbar-center">
			<li class="row">
				<div class="col-lg-12">
					<a class="navbar-brand" style="align: center"
						href="${ctx }/index.do"> <img style="height:60px;" src="${ctx}/resources/img/mainLogo.png" alt="" />
					</a>
				</div>
			</li>
			<li class="row">
				<div class="col-lg-12">
					<!-- search section-->
					<div class="input-group custom-search-form">
						<input id="searchKey" type="text" class="form-control" placeholder="Search"
							style="width: 400px"> <input id="searchLoc" type="text"
							class="form-control" placeholder="Location" style="width: 400px">
						<button class="btn btn-danger searchBtn" type="button" onclick="searchTruck()">
							<i class="fa fa-search"></i>
						</button>
					</div>
					<!--end search section-->
				</div>
			</li>
			<li class="row" style="display: block; float: bottom">
				<div id="col-lg-12">
					<img id="mainMemberImg"  class="main_img_person" src="${ctx}/resources/img/user.jpg" />
				</div>
			</li>

		</ul>
		<!-- navbar-top-links -->
	</nav>
	<!-- end navbar top -->

	<!--  main-container -->
	<div class="main-container">
		<h3 class="page-header">Foodtruck Finder</h3>
		<div class="row">
			<h4>Recent Activity</h4>
			<div class="sub-container">
				<div class="col-lg-9">
					<c:forEach var="review" varStatus="reviewNo" items="${reviews }">
						<div class="panel panel-primary text-left">
							<div class="review-heading padding-10">
								<img class="somenail" src="${ctx }/resources/img/sampleUser.jpg"/>
								<div style="float:left; width:80%;">
									<ul>
										<li><a>${review.writer.memberId }</a></li>
										<li> <span class="sub-li-follow">${review.recommand } </span>
											 <span class="sub-li-favorite">71 </span>
										</li>
										<li> <a href="${ctx }/">${review.foodtruck.foodtruckName }</a> 에 대한 리뷰 </li>
									</ul>
								</div>
							</div>
							<div class="panel-body ">
								<div style="display:block;width:500px; float:right;">
									<span class="starRating" style="text-align:left;"><span style="width: ${review.score *20}%">${review.score }점</span></span> ${review.writeDate}
									<p class="reviewContent">
								 		${review.contents }
									</p>
								</div>
								<div style="float:left; width:180px">
									<img id="${review.reviewId}" src="${ctx }/resources/img/sample1.jpg" style="width: 160px; height:160px; margin:10px"/>
									<div class="somenail-list">
									<c:forEach var="image" varStatus="imageNo" items="${review.images }">
										<img src="${ctx }/resources/img/${image.filename}" onclick="previewImage(this.src, '${review.reviewId}');"/>
									</c:forEach>
									</div>
								</div>							
							</div>
						</div>					
					</c:forEach>
				</div>

				<div class="col-lg-3">
					<div class="alert alert-warning text-center">
						<i class="fa fa-thumbs-up fa-2x"></i>
						<b>500</b> 단골 <br/>
						<i class="fa fa-twitter fa-2x"></i>
						<b>500</b> 팔로우   <br/>
						<i class="fa fa-pencil fa-2x"></i>
						<b>500</b> 리뷰  <br/>
					</div>				
					<div class="alert alert-success text-center">
						<i class="fa fa-thumbs-up fa-1x"></i>
						<b>500</b> 팔로우  
					</div>		
					<div class="alert alert-info text-center">
						<i class="fa fa-tumbs-up fa-1x"></i>
						<b>2000</b> 단골 
					</div>				
					<div class="alert alert-danger text-center">
						<i class="fa fa-tumbs-up fa-1x"></i>
						<b>500</b> 팔로우  
					</div>		
				</div>	
			</div>
		</div>
	</div>
	<!-- end main-container -->
    <!-- Core Scripts - Include with every page -->
    <script src="${ctx}/resources/plugins/jquery-1.10.2.js"></script>
    <script src="${ctx}/resources/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="${ctx}/resources/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${ctx}/resources/plugins/pace/pace.js"></script>
    <script src="${ctx}/resources/scripts/siminta.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<!--  Page Script  -->
	<script>
	
	$( document ).ready(function() {
		var mainImgSrc = "${mainFoodImg}";
		var mainMemberSrc = "${mainMember.profileImg}";
		
		console.log("mainImgSrc : "+mainImgSrc+" mainMemberSrc : "+mainMemberSrc);
		$("#mainNav").css("background-image", "url('${ctx}/resources/img/"+mainImgSrc+"')");
		$("#mainMemberImg").attr("src","${ctx}/resources/img/${mainMember.profileImg}");
		
	});
	
	var previewImage = function(target, idNo){
		$("#"+idNo).attr('src', target);
		var targetDiv = document.getElementById(idNo);
		var src = target;
	};	   	
	
	var searchTruck = function(){
		var keyword = $("#searchKey").val();
		var loc = $("#searchLoc").val();
		
		console.log("keyword : "+keyword+" loc : "+loc);
		
 		if(loc == '') {
 			loc="서울";
 		}
		if(keyword == ''){
			window.location.href = "${ctx}/searchByLoc.do?location="+loc;
		}else {
			window.location.href = "${ctx}/searchByKeyLoc.do?location="+loc+'&keyword='+keyword;
		}
	};
	</script>

</body>
</html>