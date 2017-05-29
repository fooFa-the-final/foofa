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

<style>
.mySlides {display:none; width: 900px; margin: 0 auto;}
.w3-left, .w3-right, .w3-badge {cursor:pointer}
.w3-badge {height:13px;width:13px;padding:0}

</style>
</head>

<body class="main-body">
	<!-- navbar top -->

	<nav class=" main-head-top effect" role="navigation" id="navbar" style=" background-color: rgba(0, 0, 0, .8);">
		<!-- navbar-header -->
		<br>
		<div class="col-lg-12 top-head-menu" style="">
			<span style="float: right; margin: 20px 30px 0 0;">
			<button type="button" class="btn btn-link loginBtn">Log in</button>
			<button type="button" class="btn btn-outline btn-danger signUpBtn">Sign up</button>
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
						<input type="text" class="form-control" placeholder="Search"
							style="width: 400px"> <input type="text"
							class="form-control" placeholder="Location" style="width: 400px">
						<button class="btn btn-danger searchBtn" type="button">
							<i class="fa fa-search"></i>
						</button>
					</div>
					<!--end search section-->
				</div>
			</li>
			<li class="row" style="display: block; float: bottom">
				<div id="col-lg-12">
					<img class="main_img_person" src="${ctx}/resources/img/user.jpg" />
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
	<div class="mySlides" style="width:90%">
				<div class="col-lg-4">
					<div class="panel panel-danger">
						<div class="panel-header">
							<img src="${ctx}/resources/img/waikiki.jpg" class="main-truck-img" />
						</div>
						<div class="panel-body text-left">
							푸드트럭 이름 <br> <p > 평점 :<span class="starRating" style="text-align:left;"><span style="width: 40%">2.5점</span></span></p>리뷰수 : 144
						</div>
					</div>
				
				</div>
				<div class="col-lg-4">
					<div class="panel panel-danger">
						<div class="panel-header">
							<img src="${ctx}/resources/img/twiceprofile.jpg" class="main-truck-img" />
						</div>
						<div class="panel-body text-left">
							푸드트럭 이름 <br> <p > 평점 :<span class="starRating" style="text-align:left;"><span style="width: 40%">2.5점</span></span></p>리뷰수 : 144
						</div>
					</div>
				
				</div>
				<div class="col-lg-4">
					<div class="panel panel-danger">
						<div class="panel-header">
							<img src="${ctx}/resources/img/waikiki.jpg" class="main-truck-img" />
						</div>
						<div class="panel-body text-left">
							푸드트럭 이름 <br> <p > 평점 :<span class="starRating" style="text-align:left;"><span style="width: 40%">2.5점</span></span></p>리뷰수 : 144
						</div>
					</div>	
				</div>
		</div>
	<div class="mySlides"style="width:90%">
				<div class="col-lg-4">
					<div class="panel panel-danger">
						<div class="panel-header">
							<img src="${ctx}/resources/img/waikiki.jpg" class="main-truck-img" />
						</div>
						<div class="panel-body text-left">
							푸드트럭2 이름 <br> <p > 평점 :<span class="starRating" style="text-align:left;"><span style="width: 40%">2.5점</span></span></p>리뷰수 : 144
						</div>
					</div>
				
				</div>
				<div class="col-lg-4">
					<div class="panel panel-danger">
						<div class="panel-header">
							<img src="${ctx}/resources/img/twiceprofile.jpg" class="main-truck-img" />
						</div>
						<div class="panel-body text-left">
							푸드트럭2 이름 <br> <p > 평점 :<span class="starRating" style="text-align:left;"><span style="width: 40%">2.5점</span></span></p>리뷰수 : 144
						</div>
					</div>
				
				</div>
				<div class="col-lg-4">
					<div class="panel panel-danger">
						<div class="panel-header">
							<img src="${ctx}/resources/img/waikiki.jpg" class="main-truck-img" />
						</div>
						<div class="panel-body text-left">
							푸드트럭 이름 <br> <p > 평점 :<span class="starRating" style="text-align:left;"><span style="width: 40%">2.5점</span></span></p>리뷰수 : 144
						</div>
					</div>	
				</div>
		</div>
	<div class="mySlides"style="width:90%">
				<div class="col-lg-4">
					<div class="panel panel-danger">
						<div class="panel-header">
							<img src="${ctx}/resources/img/waikiki.jpg" class="main-truck-img" />
						</div>
						<div class="panel-body text-left">
							푸드트럭1 이름 <br> <p > 평점 :<span class="starRating" style="text-align:left;"><span style="width: 40%">2.5점</span></span></p>리뷰수 : 144
						</div>
					</div>
				
				</div>
				<div class="col-lg-4">
					<div class="panel panel-danger">
						<div class="panel-header">
							<img src="${ctx}/resources/img/twiceprofile.jpg" class="main-truck-img" />
						</div>
						<div class="panel-body text-left">
							푸드트럭 이름 <br> <p > 평점 :<span class="starRating" style="text-align:left;"><span style="width: 40%">2.5점</span></span></p>리뷰수 : 144
						</div>
					</div>
				
				</div>
				<div class="col-lg-4">
					<div class="panel panel-danger">
						<div class="panel-header">
							<img src="${ctx}/resources/img/waikiki.jpg" class="main-truck-img" />
						</div>
						<div class="panel-body text-left">
							푸드트럭 이름 <br> <p > 평점 :<span class="starRating" style="text-align:left;"><span style="width: 40%">2.5점</span></span></p>리뷰수 : 144
						</div>
					</div>	
				</div>
		</div>
		  <button class="w3-button w3-white w3-display-left" onclick="plusDivs(-1)">&#10094;</button>
 		 <button class="w3-button w3-white w3-display-right" onclick="plusDivs(1)">&#10095;</button>
  <div class="w3-center w3-container w3-section w3-large w3-text-gray" style="width:100%">
    <span class="w3-badge demo w3-border w3-transparent w3-hover-gray" onclick="currentDiv(1)"></span>
    <span class="w3-badge demo w3-border w3-transparent w3-hover-gray" onclick="currentDiv(2)"></span>
    <span class="w3-badge demo w3-border w3-transparent w3-hover-gray" onclick="currentDiv(3)"></span>
  </div>
</div>
				
		</div>
				<div class="row">
				<h4>Hot Reviews</h4>
				<div class="col-lg-8">
					<div class="panel panel-primary text-left">
						<div class="review-heading padding-10">
							
							<img class="somenail" src="${ctx }/resources/img/sampleUser.jpg"/>
							<div style="float:left; width:80%;">
							<ul>
								<li><a>Dennis W.</a></li>
								<li> <span class="sub-li-follow">684 </span>
									<span class="sub-li-favorite">71 </span>
								</li>
								<li> <a>효지니의 핏짜핏짜</a> 에 대한 리뷰 
								</li>
								</ul></div>

						</div>
						<div class="panel-body ">
							<div style="display:block;">
								<span class="starRating" style="text-align:left;"><span style="width: 40%">2.5점</span></span> 05/01/2017
								<p class="reviewContent">
								 엄청난 리스펙트를 보낸다! Art while it is subjective and at times difficult to comprehend or even relate to, it is often not within a stone's throw of our daily lives. The SF MoMa is in fact relatively accessible from most anywhere in the Bay Area and provides its visitors 7 floors of conscious altering, psychologically intriguing, puzzling and sometimes downright spectacular visual forms of subjective interpretation.
								</p>
							</div>
						</div>
					</div>
					<a>Read another top review...</a>
				</div>
				<div class="col-lg-4">
					<div class="panel panel-primary text-left">
						<div class="panel-body">
							<img class="somenail" src="${ctx }/resources/img/sampleUser.jpg"/>
							 <a>효지니의 핏짜핏짜</a><br>
							By <a>Dennis W.</a>
						</div>
						<hr style="margin:5px 20px;">
						<div class="panel-body">
							<img class="somenail" src="${ctx }/resources/img/sampleUser.jpg"/>
							 <a>효지니의 핏짜핏짜</a><br>
							By <a>Dennis W.</a>
						</div>
						<hr style="margin:5px 20px;">
												<div class="panel-body">
							<img class="somenail" src="${ctx }/resources/img/sampleUser.jpg"/>
							 <a>효지니의 핏짜핏짜</a><br>
							By <a>Dennis W.</a>
						</div>
					</div>	
					<a> Read more list</a>					
				</div>			
		</div>
				<div class="row">
				<h4>Nearlest Foodtrucks</h4>
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
</body>
</html>
