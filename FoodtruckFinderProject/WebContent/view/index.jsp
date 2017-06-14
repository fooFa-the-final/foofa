<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
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

<style>
.mySlides {display:none; margin: 0 auto; width:90%;}
.mySlides2 {display:none; margin: 0 auto; width:90%;}
.w3-left, .w3-right, .w3-badge {cursor:pointer}
.w3-badge {height:13px;width:13px;padding:0}	
a.link {font-size: 0.7em; color:blue;}

.horizonal-ul{list-style:none; margin:0; padding:0;}
.horizonal-ul li {
display:inline; border-left: 1px solid #999; padding: 0 20px;}
.horizonal-ul li:first-child{border-left:none;}

#trapezoid {
	border-top: 360px solid rgba(255, 246, 244, 0.84);
	border-right: 150px solid transparent;
	height: 0;
	width: 330px;
	 position:absolute;
}

.mainTableDiv {
width:740px;
height:360px;  padding:0;
background-position: right center;display:inline-block;float:left; position:relative;
}

.background-cover{
	background-position: center center;
	background-repeat : no-repeat;
	background-size :cover;
}

#mainTableh3{
color:rgb(130, 7, 9);
font-size:2.4em;

}
#mainTableh4{
font-size:1.8em;
text-align:left;
}

.mainTableImgs{
 border: 1px solid #eee;
 height:120px; padding:10px;  
}
</style>
</head>

<body class="main-body">
	<!-- navbar top -->

	<nav id="mainNav" class=" main-head-top effect" role="navigation" id="navbar" style=" background-color: rgba(0, 0, 0, .8); background-position:center center">
		<!-- navbar-header -->
		<div class="col-lg-12 top-head-menu" style="">
			<span style="float: right; margin: 20px 30px 0 0;">
			<button type="button" class="btn btn-link loginBtn" onclick="location.href='${ctx}/login.do'">Log in</button>
			<button type="button" class="btn btn-outline btn-danger signUpBtn"  onclick="location.href='${ctx}/member/createForm.do'">Sign up</button>
			</span>
		</div>
		<ul class="nav navbar-top-links navbar-center navbar-main-links ">
			<li class="row" style="margin-top: 13%;">
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
	                   <form method="post" action="${ctx }/foodtruck/searchByKeyLoc.do" style="margin:7px;">
						<input id="searchKey" type="text" name="keyword" class="form-control" placeholder="Search"
							style="width: 400px"> <input id="searchLoc" type="text"
							class="form-control" name="location"  placeholder="Location" style="width: 400px">
						<button class="btn btn-danger searchBtn" type="submit">
							<i class="fa fa-search"></i>
						</button>
						</form>
					</div>
					<!--end search section-->
				</div>
			</li>
			</ul>
			<div id="col-lg-12" class="text-center">
					<img id="mainMemberImg"  class="main_img_person" src="${ctx}/resources/upload/${mainMember.profileImg}" onclick="location.href='${ctx}/review/list/member.do?memberId=${mainMember.memberId}'" />
			</div>
		<!-- navbar-top-links -->
	</nav>
	<!-- end navbar top -->

	<!--  main-container -->
	<div class="main-container">
		<h3 class="page-header">Foodtruck Finder</h3>
		<div class="row" >
				<h4>How about this?</h4>
			<div class="sub-container" style="height:400px;">
				<c:forEach varStatus="no" var="truck" items="${adTrucks }">
					<c:if test="${no.index == 0 }">
					<div id="mainTable" class="background-cover mainTableDiv" style="background-image:url('${ctx}/resources/img/truck/${truck.foodtruckImg }');">
					
						<div id="trapezoid">
						</div>
						<div  style=" font-weight:bold; position:absolute; left:15px; top:20px; text-align:left;">
							<h3 id="mainTableh3">${truck.foodtruckName }</h3>
							<h4 id="mainTableh4"><span class="starRating2" style="text-align:left;"><span id="mainTableScore" style="width: ${truck.score*20 }%">${truck.score }점</span></span></h4>
							<img src="${ctx }/resources/img/location.png" style="width:30px; " ><span id="mainTableLocation"style="line-height:13px;vertical-align:bottom;">&nbsp;${truck.location }</span>
						</div>
					
					</div>				
					<div style="padding:0; display:inline-block; width:360px;">
					</c:if>
							<div class="col-lg-4 background-cover mainTableImgs effect" 
							style="background-image:url('${ctx}/resources/img/truck/${truck.foodtruckImg }');"
							onmouseover="show('${truck.foodtruckImg}', '${truck.foodtruckName }', '${truck.score }', '${truck.location }', this);"
							onclick="location.href='${ctx }/review/list/truck.do?foodtruckId=${truck.foodtruckId}"
							>
							<!-- 	<div style="padding:10px; border-radius:10px; border:1px solid white; height:100%;"></div> -->
							</div>
					<c:if test="${no.count == fn:length(adTrucks) }">
					</div>	
					</c:if>
			</c:forEach>
			</div>
		</div>

				<div class="row div-gray" style="margin-top:20px;">
					<h4>Hot Reviews</h4>
					<div class="sub-container">
						<div class="col-lg-9">
								<div class="panel panel-primary text-left" style="height:327px">
									<div class="review-heading padding-10" style="height: 90px;">
										<img class="somenail" src="${ctx }/resources/upload/${hotReview.writer.profileImg }"/>
										<div style="float:left; margin-left:20px;">
											<ul class="list-unstyled">
												<li><a href="${ctx }/review/list/member.do?memberId=${hotReview.writer.memberId }">${hotReview.writer.memberId }</a></li>
												<li> <span class="sub-li-recommand"><i class="fa fa-thumbs-up fa-1x"></i>${hotReview.recommand } </span>
													 <span class="sub-li-follow"><i class="fa fa-twitter fa-1x"></i>${hotReview.writer.followCount } </span>
													 <span class="sub-li-follow"><i class="fa fa-pencil fa-1x"></i>${hotReview.writer.reviewCount } </span>
												</li>
												<li> 
													<ul class="horizonal-ul">
														<li><a href="${ctx }/review/list/truck.do?foodtruckId=${hotReview.foodtruck.foodtruckId }">${hotReview.foodtruck.foodtruckName }</a> 에 대한 리뷰 	</li>
														<li><b>점수 : </b><span class="starRating" style="text-align:left;"><span style="width: ${hotReview.score *20}%">${hotReview.score }점</span></span></li>
														<li><b>작성일 : </b> ${hotReview.writeDate}</li>
													</ul>
																						
												</li>
											</ul>
										</div>
									</div>
									<div class="panel-body ">
										<div style="display:block;width:490px; float:right;">
											<p class="reviewContent">
										 		${hotReview.contents }
											</p>
										</div>
										<div class="reviewMainImg">
											<img id="${hotReview.reviewId}" src="${ctx }/resources/img/reviewImg/${hotReview.mainImage.filename }"/>
											<div class="somenail-list">
											<c:forEach var="image" varStatus="imageNo" items="${hotReview.images }">
												<img src="${ctx }/resources/img/reviewImg/${image.filename}" onclick="previewImage(this.src, '${hotReview.reviewId}');"/>
											</c:forEach>
											</div>
										</div>							
									</div>
								</div>		
						</div>
						<div class="col-lg-3">
							<div class="panel panel-primary text-center" style="height:327px">
								<c:forEach var="review" varStatus="no" items="${reviews}"> 
									<div class="review-heading" style="height:25px">
										 <a href="${ctx }/review/list/truck.do?foodtruckId=${review.foodtruck.foodtruckId }">${review.foodtruck.foodtruckName }</a>		 By <a href="${ctx }/review/list/member.do?memberId=${review.writer.memberId }">${review.writer.memberId }</a>						
									</div>
									<div class="panel-body" style="padding:10px; height:85px;">
										<img class="somenail" src="${ctx }/resources/img/reviewImg/${review.mainImage.filename}" style="margin-right:10px;"/>
		
										 <p class="index-overflow">${review.contents }</p>
									</div>					
								
								</c:forEach>				
							</div>	
						</div>
					</div>
				</div>
				<div class="row">
					<h4>Nearlest Foodtrucks</h4>
				<div class="w3-content w3-display-container text-center">
						<c:forEach varStatus="no" var="ntruck" items="${nearTrucks }">
							<c:choose>	
								<c:when test="${(no.count mod 3) == 1 }">
									<div class="mySlides2">	
										<div class="col-lg-4">
											<div class="panel panel-danger">
												<div class="panel-header">
													<img src="${ctx}/resources/img/truck/${ntruck.foodtruckImg }" class="main-truck-img"onclick="location.href='${ctx }/review/list/truck.do?foodtruckId=${truck.foodtruckId}'"/>
												</div>
												<div class="panel-body text-left">
													<b><a href="${ctx }/review/list/truck.do?foodtruckId=${ntruck.foodtruckId }">${ntruck.foodtruckName }</a></b> <br> <p > 평점 :<span class="starRating" style="text-align:left;"><span style="width: ${ntruck.score*20 }%">${ntruck.score }점</span></span></p>리뷰수 : ${ntruck.reviewCount }
												</div>
											</div>
										</div>		
								</c:when>
								<c:when test="${(no.count mod 3) == 2 }">
										<div class="col-lg-4">
											<div class="panel panel-danger">
												<div class="panel-header">
													<img src="${ctx}/resources/img/truck/${ntruck.foodtruckImg }" class="main-truck-img" onclick="location.href='${ctx }/review/list/truck.do?foodtruckId=${ntruck.foodtruckId}'"/>
												</div>
												<div class="panel-body text-left">
														<b><a href="${ctx }/review/list/truck.do?foodtruckId=${ntruck.foodtruckId }">${ntruck.foodtruckName }</a></b> <br> <p > 평점 :<span class="starRating" style="text-align:left;"><span style="width: ${ntruck.score*20 }%">${ntruck.score }점</span></span></p>리뷰수 : ${ntruck.reviewCount }
												</div>
											</div>
										
										</div>	
								</c:when>
								<c:otherwise>
										<div class="col-lg-4">
											<div class="panel panel-danger">
												<div class="panel-header">
													<img src="${ctx}/resources/img/truck/${ntruck.foodtruckImg }" class="main-truck-img" onclick="location.href='${ctx }/review/list/truck.do?foodtruckId=${ntruck.foodtruckId}'" />
												</div>
												<div class="panel-body text-left">
														<b><a href="${ctx }/review/list/truck.do?foodtruckId=${ntruck.foodtruckId }">${ntruck.foodtruckName }</a></b> <br> <p > 평점 :<span class="starRating" style="text-align:left;"><span style="width: ${ntruck.score*20 }%">${ntruck.score }점</span></span></p>리뷰수 : ${ntruck.reviewCount }
												</div>
											</div>	
										</div>
									</div>			
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<button class="w3-button w3-white w3-display-left" onclick="plusDivs2(-1)">&#10094;</button>
				 		<button class="w3-button w3-white w3-display-right" onclick="plusDivs2(1)">&#10095;</button>
						  <div class="w3-center w3-container w3-section w3-large w3-text-gray" style="width:100%">
							    <span class="w3-badge demo2 w3-border w3-transparent w3-hover-gray" onclick="currentDiv2(1)"></span>
							    <span class="w3-badge demo2 w3-border w3-transparent w3-hover-gray" onclick="currentDiv2(2)"></span>
							    <span class="w3-badge demo2 w3-border w3-transparent w3-hover-gray" onclick="currentDiv2(3)"></span>
						</div>
					</div>
			</div>
	<!-- end main-container -->
</div>
    <!-- Core Scripts - Include with every page -->
    <script src="${ctx}/resources/plugins/jquery-1.10.2.js"></script>
    <script src="${ctx}/resources/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="${ctx}/resources/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${ctx}/resources/plugins/pace/pace.js"></script>
    <script src="${ctx}/resources/scripts/siminta.js"></script>

	<!--  Page Script  -->
	<script>
var slideIndex = 1;
var slideIndex2 = 1;
showDivs2(slideIndex2);

function plusDivs(n) {
  showDivs(slideIndex += n);
}
function plusDivs2(n) {
	  showDivs2(slideIndex2 += n);
}
function currentDiv(n) {
  showDivs(slideIndex = n);
}
function currentDiv2(n) {
	  showDivs2(slideIndex2 = n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  if (n > x.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
     dots[i].className = dots[i].className.replace(" w3-gray", "");
  }
  x[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " w3-gray";
}

function showDivs2(n) {
	  var i;
	  var x = document.getElementsByClassName("mySlides2");
	  var dots = document.getElementsByClassName("demo2");
	  if (n > x.length) {slideIndex2 = 1}    
	  if (n < 1) {slideIndex2 = x.length}
	  for (i = 0; i < x.length; i++) {
	     x[i].style.display = "none";  
	  }
	  for (i = 0; i < dots.length; i++) {
	     dots[i].className = dots[i].className.replace(" w3-gray", "");
	  }
	  x[slideIndex2-1].style.display = "block";  
	  dots[slideIndex2-1].className += " w3-gray";
	}
	
	$( document ).ready(function() {
		var mainImgSrc = "${mainFoodImg}";
		var mainMemberSrc = "${mainMember.profileImg}";
		
		$("#mainNav").css("background-image", "url('${ctx}/resources/img/reviewImg/"+mainImgSrc+"')");
		
		$(".mainTableImgs").mouseout(function(){
			$(this).css("border", "1px solid #eee");
		});
		
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
	
	var show = function(img, name, score, location, div){
		$(div).css('border', "1px solid red");
		console.log("g"+location);
		$("#mainTable").css('background-image', "url('${ctx}/resources/img/truck/"+img+"')");
		$("#mainTableh3").text(name);
		$("#mainTableScore").text(score);
		$("#mainTableScore").css("width", score*20+"%");
		$("#mainTableLocation").text(location);
		
		
	};
		
		
		

	</script>
</body>
</html>
