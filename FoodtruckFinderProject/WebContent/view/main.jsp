<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE>
<html>
<c:set value="${pageContext.request.contextPath}" var="ctx" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FoodtruckMain</title>
<!-- Core CSS - Include with every page -->
<link href="${ctx}/resources/plugins/bootstrap/bootstrap.css" rel="stylesheet" />
<link href="${ctx}/resources/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href="${ctx}/resources/plugins/pace/pace-theme-big-counter.css" rel="stylesheet" />
<link href="${ctx}/resources/css/style.css" rel="stylesheet" />
<link href="${ctx}/resources/css/main-style.css" rel="stylesheet" />

<!-- Page CSS -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="${ctx}/resources/plugins/timeline/timeline.css" rel="stylesheet" />
<link href="${ctx}/resources/plugins/morris/morris-0.4.3.min.css" rel="stylesheet" />

<style>
.mySlides {display:none; width: 1200px; margin: 0 auto;}
.w3-left, .w3-right, .w3-badge {cursor:pointer}
.w3-badge {height:13px;width:13px;padding:0}


#trapezoid {
	border-top: 360px solid rgba(255, 246, 244, 0.84);
	border-right: 150px solid transparent;
	height: 0;
	width: 330px;
	 position:absolute;
}

.mainTableDiv {
width:810px;
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
						href="${ctx }/main.do"> <img style="height:60px;" src="${ctx}/resources/img/mainLogo.png" alt="" />
					</a>
				</div>
			</li>
			<li class="row">
				<div class="col-lg-12">
					<!-- search section-->
					<div class="input-group custom-search-form">
	                   <form method="post" action="${ctx }/foodtruck/searchByKeyLoc.do" style="margin:7px;">
						<input id="searchKey" type="text" class="form-control"  name="keyword"  placeholder="Search" style="width: 400px"> 
						<input id="searchLoc" name="location"  type="text" class="form-control" placeholder="Location" style="width: 400px">
						<button class="btn btn-danger searchBtn" type="submit"><i class="fa fa-search"></i></button>
						</form>
					</div>
					<!--end search section-->
				</div>
			</li>
			<li class="row" style="display: block;">
				<div id="col-lg-12">
					<img id="mainMemberImg"  class="main_img_person" src="${ctx}/resources/upload/${mainMember.profileImg}" onclick="location.href='${ctx}/review/list/member.do?memberId=${mainMember.memberId}'" />
				</div>
			</li>

		</ul>
		<!-- navbar-top-links -->
	</nav>
	<!-- end navbar top -->

	<!--  main-container -->
	<div class="main-container">
		<h2 class="page-header">Foodtruck Finder</h2>
		<div class="row sub-container">
				<div class="col-lg-12">
					<div class="alert alert-warning"  style="margin-top:15px; margin-bottom:15px;">
						<i class="fa fa-bell"></i><b>&nbsp;Hello ! </b> Welcome Back to <b>Foofa ! </b> Check your favorite foodtrucks <b><a href="${ctx }/favorite/list.do">now open ! </a></b>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="alert alert-danger text-center " style="padding:15px 30px; margin-bottom:15px;">
						<i class="fa fa-twitter fa-3x" style="display:inline-block; float:left;"></i><span style="flaot:left;"><b>${member.followCount }</b>명이 회원님을 <br>팔로우합니다.</span>
					</div>
				</div>

				<div class="col-lg-4">
					<div class="alert alert-success text-center" style="padding:15px 30px; margin-bottom:15px;">
						<i class="fa fa-edit fa-3x"style="display:inline-block; float:left;"></i><span style="flaot:left;"><b>${member.reviewCount }</b>개의 리뷰를 <br>작성하셨습니다.</span>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="alert alert-info text-center" style="padding:15px 30px; margin-bottom:15px;">
						<i class="fa fa-heart fa-3x"style="display:inline-block; float:left;"></i><span style="flaot:left;"><b>${member.favoriteCount }</b>개의 단골을<br> 추가하셨습니다.</span>
					</div>
				</div>	
		</div>
		
		<div class="row">
			<ul class="list-inline">
				<li class="tab-li" ><h4><a href="#home" data-toggle="tab">Home</a></li>
				<li class="tab-li" style="border-bottom:2px solid #FAC6C6;"><h4><a href="#recent" data-toggle="tab" style=" color:#d32323;">Recent Activity</a></h4></li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane fade" id="home">
					<div class="row" >
						<h4>How about this?</h4>
						<div class="sub-container" style="padding: 0 15px;">
							<c:forEach varStatus="no" var="truck" items="${adTrucks }">
								<c:if test="${no.index == 0 }">
								<div id="mainTable" class="background-cover mainTableDiv" style="background-image:url('${ctx}/resources/img/truck/${truck.foodtruckImg }');">
								
									<div id="trapezoid">
									</div>
									<div  style=" font-weight:bold; position:absolute; left:15px; top:20px; text-align:left; height:85%;">
										<h3 id="mainTableh3">${truck.foodtruckName }</h3>
										<h4 id="mainTableh4"><span class="starRating2" style="text-align:left;"><span id="mainTableScore" style="width: ${truck.score*20 }%">${truck.score }점</span></span></h4>
										<i class="fa fa-map-marker"></i><span id="mainTableLocation"style="line-height:13px;vertical-align:bottom;">&nbsp;${truck.location }</span>
										<div id="mainTableState" style="display:none; position:absolute; bottom:0px;">
										<span class="user-circle-online btn btn-success btn-circle "></span>&nbsp;Now Open
										</div>
									</div>
								
								</div>				
								<div style="padding:0; display:inline-block; width:360px;">
								</c:if>
										<div class="col-lg-4 background-cover mainTableImgs effect" 
										style="background-image:url('${ctx}/resources/img/truck/${truck.foodtruckImg }');"
										onmouseover="show('${truck.foodtruckImg}', '${truck.foodtruckName }', '${truck.score }', '${truck.location }', '${truck.state }',this);"
										onclick="location.href='${ctx }/review/list/truck.do?foodtruckId=${truck.foodtruckId}'"
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
									<div class="panel panel-danger text-left" style="height:327px">
										<div class="panel-heading padding-10" style="height: 90px;">
											<img class="somenail" src="${ctx }/resources/upload/${hotReview.writer.profileImg }"/>
											<div style="float:left; margin-left:20px;">
												<ul class="list-unstyled">
													<li><a href="${ctx }/review/list/member.do?memberId=${hotReview.writer.memberId }">${hotReview.writer.memberId }</a></li>
													<li> <span class="sub-li-recommand"><i class="fa fa-thumbs-up fa-1x"></i>${hotReview.recommand } </span>
														 <span class="sub-li-follow"><i class="fa fa-twitter fa-1x"></i>${hotReview.writer.followCount } </span>
														 <span class="sub-li-review"><i class="fa fa-pencil fa-1x"></i>${hotReview.writer.reviewCount } </span>
													</li>
													<li> 
														<ul class="list-inline">
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
								<div class="panel panel-danger text-center" style="height:327px">
									<c:forEach var="review" varStatus="no" items="${reviews}"> 
										<div class="panel-heading" style="height:25px; padding:0 10px;">
											 <b><a href="${ctx }/review/list/truck.do?foodtruckId=${review.foodtruck.foodtruckId }">${review.foodtruck.foodtruckName }</a></b>		 By <b><a href="${ctx }/review/list/member.do?memberId=${review.writer.memberId }">${review.writer.memberId }</a></b>						
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
						<div class="w3-content w3-display-container text-center"  style="width:1300px; max-width:1300px;">
								<c:forEach varStatus="no" var="ntruck" items="${nearTrucks }">
									<c:choose>	
										<c:when test="${(no.count mod 4) == 1 }">
											<div class="mySlides">	
												<div class="col-lg-3">
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
										<c:when test="${(no.count mod 4) != 0 }">
												<div class="col-lg-3">
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
												<div class="col-lg-3">
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
								<button class="w3-button w3-white w3-display-left" onclick="plusDivs(-1)">&#10094;</button>
						 		<button class="w3-button w3-white w3-display-right" onclick="plusDivs(1)">&#10095;</button>
								  <div class="w3-center w3-container w3-section w3-large w3-text-gray" style="width:100%">
									    <span class="w3-badge demo w3-border w3-transparent w3-hover-gray" onclick="currentDiv(1)"></span>
									    <span class="w3-badge demo w3-border w3-transparent w3-hover-gray" onclick="currentDiv(2)"></span>
									    <span class="w3-badge demo w3-border w3-transparent w3-hover-gray" onclick="currentDiv(3)"></span>
								</div>
							</div>
						</div>
				</div>
				<div class="tab-pane fade in active" id="recent" style="text-align:left;">
					<div class="sub-container">
					<div class="col-lg-12">
						<c:set scope="page" var="lsize" value="${fn:length(followReviews) /3 }"/>
						<c:choose>
							<c:when test="${fn:length(followReviews) == 0 }">
									<div class="panel panel-primary text-left">
										등록된 팔로우들의 리뷰가 없습니다.
									</div>							
							</c:when>
							<c:otherwise>
								<c:forEach var="review" varStatus="reviewNo" items="${followReviews }">
										<c:if test="${reviewNo.count == 1 }">
										<div class="col-lg-4"  style=" z-index: 1;position: relative;">
										</c:if>
											<div class="panel panel-default" id="${reviewNo.count }">
												<div class="panel-heading" style="height:80px;">
													<img class="somenail" src="${ctx }/resources/upload/${review.writer.profileImg }"/>
													<div style="float:left; width:180px; margin-left:10px; overflow:hidden;">
														<ul class="list-unstyled">
															<li><h4><a href="${ctx }/review/list/member.do?memberId=${review.writer.memberId }">${review.writer.memberId }</a></h4></li>
															<li> <span class="sub-li-recommand"><i class="fa fa-thumbs-up"></i> <span  id="rec${review.reviewId }" >${review.recommand }</span> </span>
																 <span class="sub-li-follow"><i class="fa fa-twitter"></i>${review.writer.followCount } </span>
																 <span class="sub-li-review"><i class="fa fa-pencil"></i>${review.writer.reviewCount } </span>
															</li>
														</ul>
													</div>	
												<div class="drop-down-btn-check info drop-down-btn"  style=" padding-top:17px;"> 
													<i class="fa fa-check"></i>
															<div class="dis-none drop-down-list">
						                       					<button id="recommandBtn_${review.reviewId }" type="button" class="btn btn-success btn-circle btn-lg" style="margin:5px;" onclick="recReview('${review.reviewId}');">
																	<i class="fa fa-thumbs-up"></i></button>&nbsp;추천하기
						                       					<button id="repportBtn_${review.reviewId }" type="button" class="btn btn-warning btn-circle btn-lg" style="margin:5px;" data-toggle="modal" data-target="#myModal${review.reviewId }">
																	<i class="fa fa-warning"></i></button>&nbsp;신고하기
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
											<div class="col-lg-4" id="next">
											</c:if>
								</c:forEach>		
								</div>				
								<button type="button" class="btn btn-info btn-lg btn-block" onclick="location.href='${ctx}/follow/list.do'">내 팔로우들 뉴스피드 보러가기</button>
							</c:otherwise>
						</c:choose>
					</div>
				</div></div>
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
    <script src="${ctx }/resources/scripts/default.js"></script>
	<script>
	
	$( document ).ready(function() {
		var mainImgSrc = "${mainFoodImg}";
		var mainMemberSrc = "${mainMember.profileImg}";
		
		$("#mainNav").css("background-image", "url('${ctx}/resources/img/food/"+mainImgSrc+"')");
		
		$(".mainTableImgs").mouseout(function(){
			$(this).css("border", "1px solid #eee");
		});
		
		$(".tab-li").click(function(){
			$(".tab-li").css("border-bottom", "0px");
			$(".tab-li").css("color", "black");
			$(this).css("border-bottom", "2px solid #FAC6C6");
			$(this).css("color", "rgb(130, 7, 9)");
			
			
			
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
	
	var show = function(img, name, score, location, state, div){
		$(div).css('border', "1px solid red");
		$("#mainTable").css('background-image', "url('${ctx}/resources/img/truck/"+img+"')");
		$("#mainTableh3").text(name);
		$("#mainTableScore").text(score);
		$("#mainTableScore").css("width", score*20+"%");
		$("#mainTableLocation").text(location);
		if(state == 'true'){
			$("#mainTableState").css("display","block");
		}else {
			$("#mainTableState").css("display","none");
		}
		
		
	};
	</script>

</body>
</html>