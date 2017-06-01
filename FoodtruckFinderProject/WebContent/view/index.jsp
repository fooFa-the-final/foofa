<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
.mySlides {display:none; width: 900px; margin: 0 auto; width:90%;}
.w3-left, .w3-right, .w3-badge {cursor:pointer}
.w3-badge {height:13px;width:13px;padding:0}	

</style>
</head>

<body class="main-body">
	<!-- navbar top -->

	<nav id="mainNav" class=" main-head-top effect" role="navigation" id="navbar" style=" background-color: rgba(0, 0, 0, .8);">
		<!-- navbar-header -->
		<div class="col-lg-12 top-head-menu" style="">
			<span style="float: right; margin: 20px 30px 0 0;">
			<button type="button" class="btn btn-link loginBtn" onclick="location.href='${ctx}/login.do'">Log in</button>
			<button type="button" class="btn btn-outline btn-danger signUpBtn"  onclick="location.href='${ctx}/member/createForm.do'">Sign up</button>
			</span>
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
					<img id="mainMemberImg"  class="main_img_person" src="${ctx}/resources/img/user.jpg" onclick="location.href='${ctx}/review/list/member.do?memberId=${mainMember.memberId}'" />
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
				<h4>How about this?</h4>


<div class="w3-content w3-display-container text-center">

		<c:forEach varStatus="no" var="truck" items="${adTrucks }">
			<c:choose>	
				<c:when test="${(no.count mod 3) == 1 }">
				<div class="mySlides">	
					<div class="col-lg-4">
						<div class="panel panel-danger">
							<div class="panel-header">
								<img src="${ctx}/resources/img/${truck.foodtruckImg }" class="main-truck-img" />
							</div>
							<div class="panel-body text-left">
								<b>${truck.foodtruckName }</b> <br> <p > 평점 :<span class="starRating" style="text-align:left;"><span style="width: ${truck.reviewScore*20 }%">${truck.reviewScore }점</span></span></p>리뷰수 : ${truck.reviewCount }
							</div>
						</div>
					</div>		
				</c:when>
				<c:when test="${(no.count mod 3) == 0 }">
				<div class="col-lg-4">
					<div class="panel panel-danger">
						<div class="panel-header">
							<img src="${ctx}/resources/img/${truck.foodtruckImg }" class="main-truck-img" />
						</div>
						<div class="panel-body text-left">
							<b>${truck.foodtruckName }</b> <br> <p > 평점 :<span class="starRating" style="text-align:left;"><span style="width: ${truck.reviewScore*20 }%">${truck.reviewScore }점</span></span></p>리뷰수 : ${truck.reviewCount }
						</div>
					</div>	
				</div>
		</div>
				</c:when>
				<c:otherwise>
				<div class="col-lg-4">
					<div class="panel panel-danger">
						<div class="panel-header">
							<img src="${ctx}/resources/img/${truck.foodtruckImg }" class="main-truck-img" />
						</div>
						<div class="panel-body text-left">
							<b>${truck.foodtruckName }</b> <br> <p > 평점 :<span class="starRating" style="text-align:left;"><span style="width: ${truck.reviewScore*20 }%">${truck.reviewScore }점</span></span></p>리뷰수 : ${truck.reviewCount }						
						</div>
					</div>
				
				</div>				
				</c:otherwise>
			</c:choose>
		
		</c:forEach>
		  <button class="w3-button w3-white w3-display-left" onclick="plusDivs(-1)">&#10094;</button>
 		 <button class="w3-button w3-white w3-display-right" onclick="plusDivs(1)">&#10095;</button>
  <div class="w3-center w3-container w3-section w3-large w3-text-gray" style="width:100%">
    <span class="w3-badge demo w3-border w3-transparent w3-hover-gray" onclick="currentDiv(1)"></span>
    <span class="w3-badge demo w3-border w3-transparent w3-hover-gray" onclick="currentDiv(2)"></span>
    <span class="w3-badge demo w3-border w3-transparent w3-hover-gray" onclick="currentDiv(3)"></span>
  </div>
</div>
				
		</div>
				<div class="row div-gray">
				<h4>Hot Reviews</h4>
				<div class="sub-container">
				<div class="col-lg-9">
						<div class="panel panel-primary text-left" style="height:327px">
							<div class="review-heading padding-10">
								<img class="somenail" src="${ctx }/resources/img/${review.writer.profileImg }"/>
								<div style="float:left; width:80%;">
									<ul>
										<li><a>${hotReview.writer.memberId }</a></li>
										<li> <span class="sub-li-follow"><i class="fa fa-thumbs-up fa-1x"></i>${hotReview.recommand } </span>
											 <span class="sub-li-favorite"><i class="fa fa-twitter fa-1x"></i>${hotReview.recommand } </span>
										</li>
										<li> <a href="${ctx }/">${hotReview.foodtruck.foodtruckName }</a> 에 대한 리뷰 </li>
									</ul>
								</div>
							</div>
							<div class="panel-body ">
								<div style="display:block;width:500px; float:right;">
									<span class="starRating" style="text-align:left;"><span style="width: ${hotReview.score *20}%">${hotReview.score }점</span></span> ${review.writeDate}
									<p class="reviewContent">
								 		${hotReview.contents }
									</p>
								</div>
								<div style="float:left; width:180px">
									<img id="${hotReview.reviewId}" src="${ctx }/resources/img/${hotReview.mainImage.filename }" style="width: 160px; height:160px; margin:10px"/>
									<div class="somenail-list">
									<c:forEach var="image" varStatus="imageNo" items="${hotReview.images }">
										<img src="${ctx }/resources/img/${image.filename}" onclick="previewImage(this.src, '${review.reviewId}');"/>
									</c:forEach>
									</div>
								</div>							
							</div>
						</div>		
				</div>
				<div class="col-lg-3">
					<div class="panel panel-primary text-center" style="height:327px">
						<c:forEach var="review" varStatus="no" items="${reviews}"> 
							<div class="panel-body">
								<img class="somenail" src="${ctx }/resources/img/${review.mainImage.filename}"/>
								 <a>${review.foodtruck.foodtruckName }</a><br>
								By <a>${review.writer.memberId }</a>
							</div>
						<hr style="margin:5px 20px;">						
						
						</c:forEach>

					<a> Read more list</a>					
				</div>	
				</div></div>
		</div>
				<div class="row">
				<h4>Nearlest Foodtrucks</h4>
				
				<div class="sub-container">
				<div class="col-lg-4">
					<div class="panel panel-danger">
						<div class="panel-header">
							<img src="${ctx}/resources/img/waikiki.jpg"  class="main-truck-img" />
						</div>
						<div class="panel-body text-left">
							푸드트럭 이름 <br> 평점 별별별 <br> 리뷰수 : 144
						</div>
					</div>
				
				</div>
				<div class="col-lg-4">
					<div class="panel panel-danger">
						<div class="panel-header">
							<img src="${ctx}/resources/img/twiceprofile.jpg"  class="main-truck-img" />
						</div>
						<div class="panel-body text-left">
							푸드트럭 이름 <br> 평점 별별별 <br> 리뷰수 : 144
						</div>
					</div>
				
				</div>
				<div class="col-lg-4">
					<div class="panel panel-danger">
						<div class="panel-header">
							<img src="${ctx}/resources/img/waikiki.jpg"  class="main-truck-img" />
						</div>
						<div class="panel-body text-left">
							푸드트럭 이름 <br> 평점 별별별 <br> 리뷰수 : 144
						</div>
					</div>
				
				</div></div>
		</div>
	</div>
	<!-- end main-container -->
    <!-- Core Scripts - Include with every page -->
    <script src="${ctx}/resources/plugins/jquery-1.10.2.js"></script>
    <script src="${ctx}/resources/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="${ctx}/resources/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${ctx}/resources/plugins/pace/pace.js"></script>
    <script src="${ctx}/resources/scripts/siminta.js"></script>

	<!--  Page Script  -->
	<script>
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function currentDiv(n) {
  showDivs(slideIndex = n);
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
</script>

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
