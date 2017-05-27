<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>리뷰작성</title>
<!-- Core CSS - Include with every page -->
<link href="../../resources/plugins/bootstrap/bootstrap.css"
	rel="stylesheet" />
<link href="../../resources/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<link href="../../resources/plugins/pace/pace-theme-big-counter.css"
	rel="stylesheet" />
<link href="../../resources/css/style.css" rel="stylesheet" />
<link href="../../resources/css/main-style.css" rel="stylesheet" />

<!-- Page-Level CSS -->
<link href="../../resources/plugins/dataTables/dataTables.bootstrap.css"
	rel="stylesheet" />

</head>

<style>
#show {
	width: 100%;
	text-align: center;
}

#in {
	display: inline-block;
}
</style>


<body>
	<!--  wrapper -->
	<div id="wrapper">
		<!-- navbar top -->
		<nav class="navbar navbar-default navbar-fixed-top" role="navigation"
			id="navbar">
			<!-- navbar-header -->
			<a class="navbar-brand" href="index.html"> <img
				src="../../resources/img/logo.png" alt="" />
			</a>
			<!-- navbar-top-links -->
			<ul class="nav navbar-top-links navbar-right">
				<!-- main dropdown -->
				<li class="row">
					<div class="col-xs-10" style="margin-right: 200px">
						<!-- search section-->
						<div class="input-group custom-search-form">
							<input type="text" class="form-control" placeholder="Search"
								style="width: 400px"> <input type="text"
								class="form-control" placeholder="Location" style="width: 400px">
							<button class="btn btn-default" type="button">
								<i class="fa fa-search"></i>
							</button>
						</div>
						<!--end search section-->
					</div>
				</li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-user fa-3x"></i>
				</a> <!-- dropdown user-->

					<ul class="dropdown-menu dropdown-user">
						<li><a href="#"><i class="fa fa-user fa-fw"></i>User
								Profile</a></li>
						<li><a href="#"><i class="fa fa-gear fa-fw"></i>Settings</a>
						</li>
						<li class="divider"></li>
						<li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i>Logout</a>
						</li>
					</ul> <!-- end dropdown-user --></li>
				<!-- end main dropdown -->
			</ul>
			<!-- end navbar-top-links -->
		</nav>
		<!-- end navbar top -->

		<!--  page-wrapper -->



	</div>
	<!-- end page-wrapper -->

	<div class="container" style="color: black;">
		<h2>Write Review</h2>
		<div class="row">
			<div class="col-md-1 col-lg-1"></div>
			<div class="col-md-3 col-lg-3">
				<div class="blog-stripe">
					<img width="200x" height="200px"
						src="../../resources/img/pizzahut.png">
				</div>
			</div>
			<div class="col-md-1 col-lg-1"></div>
			<div class="col-md-7 col-lg-7" style="margin-bottom: 50px">

				<ul class="all-blogs">
					<li class="media">
						<div class="media-body">
							<h4 class="media-heading">
								<a href="" style="color: black; font-weight: bold">정찬기의 피자집</a>
							</h4>
						</div>
					</li>
					<li class="media">
						<div class="media-body">
							<h4 class="media-heading">피자, 파스타, 탄산</h4>


						</div>
					</li>
					<li class="media">
						<div class="media-body">
							<h4 class="media-heading">서울시 구로구 가산2동</h4>
						</div>
					</li>
				</ul>
			</div>
			<div class="form-group">
				<div class="text-right">
					<a href="">
						<button type="button" class="btn btn-primary" >Add photo</button>
					</a>
				</div>

				<br> <br>
				<div class="col-lg-12">
					<div class="col-lg-8" style="float: left">
						<table width="1150px">
							<thead>
								<tr>
									<th width="150px"></th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<fieldset class="rating" disabled>

											<label class="full" for="star5" title="Awesome - 5 stars"></label>
											<input type="radio" id="star3" name="rating1" value="3"
												checked /> <label class="half" for="star4half"
												title="Pretty good - 4.5 stars"></label> <label class="full"
												for="star4" title="Pretty good - 4 stars"></label> <label
												class="half" for="star3half" title="Meh - 3.5 stars"></label>
											<label class="full" for="star3" title="Meh - 3 stars"></label>
											<label class="half" for="star2half"
												title="Kinda bad - 2.5 stars"></label> <label class="full"
												for="star2" title="Kinda bad - 2 stars"></label> <label
												class="half" for="star1half" title="Meh - 1.5 stars"></label>
											<label class="full" for="star1"
												title="Sucks big time - 1 star"></label> <label class="half"
												for="starhalf" title="Sucks big time - 0.5 stars"></label>
										</fieldset>
									</td>
									<td>별점을 매겨주세요</td>

								</tr>
							</tbody>
							<tr>
								<td colspan="2"><textarea name="review"
										style="width: 100%; border: 1; overflow: visible; text-overflow: ellipsis;"
										rows=15></textarea></td>
							</tr>
						</table>
					</div>
				</div>



			            <div style="margin-left:30px">
<a style="color:black" onclick="this.nextSibling.style.display=(this.nextSibling.style.display=='none')?'block':'none';" href="javascript:void(0)"> 
푸드트럭 설문조사 항목
</a><div style="DISPLAY: none">
        
        
                                            <h4>음식의 가격에 만족하십니까?</h4>
                                            <label class="radio-inline">
                                                <input type="radio" name="optionsRadiosInline" id="optionsRadiosInline1" value="option1" >매우만족
                                            </label>
                                            <label class="radio-inline">
                                                <input type="radio" name="optionsRadiosInline" id="optionsRadiosInline2" value="option2">만족
                                            </label>
                                            <label class="radio-inline">
                                                <input type="radio" name="optionsRadiosInline" id="optionsRadiosInline3" value="option3">보통
                                            </label>
                                        
                                        <label class="radio-inline">
                                                <input type="radio" name="optionsRadiosInline" id="optionsRadiosInline3" value="option3">불만
                                            </label>
                                              <label class="radio-inline">
                                                <input type="radio" name="optionsRadiosInline" id="optionsRadiosInline3" value="option3">매우불만
                                            </label>
                                        
    
    <br>
                                                <h4>음식의 품질에 만족하십니까?</h4>
                                            <label class="radio-inline">
                                                <input type="radio" name="optionsRadiosInline" id="optionsRadiosInline1" value="option1" >매우만족
                                            </label>
                                            <label class="radio-inline">
                                                <input type="radio" name="optionsRadiosInline" id="optionsRadiosInline2" value="option2">만족
                                            </label>
                                            <label class="radio-inline">
                                                <input type="radio" name="optionsRadiosInline" id="optionsRadiosInline3" value="option3">보통
                                            </label>
                                        
                                        <label class="radio-inline">
                                                <input type="radio" name="optionsRadiosInline" id="optionsRadiosInline3" value="option3">불만
                                            </label>
                                              <label class="radio-inline">
                                                <input type="radio" name="optionsRadiosInline" id="optionsRadiosInline3" value="option3">매우불만
                                            </label>
    
    <br>
                                                <h4>푸드트럭커의 서비스에 만족하십니까? </h4>
                                            <label class="radio-inline">
                                                <input type="radio" name="optionsRadiosInline" id="optionsRadiosInline1" value="option1" >매우만족
                                            </label>
                                            <label class="radio-inline">
                                                <input type="radio" name="optionsRadiosInline" id="optionsRadiosInline2" value="option2">만족
                                            </label>
                                            <label class="radio-inline">
                                                <input type="radio" name="optionsRadiosInline" id="optionsRadiosInline3" value="option3">보통
                                            </label>
                                        
                                        <label class="radio-inline">
                                                <input type="radio" name="optionsRadiosInline" id="optionsRadiosInline3" value="option3">불만
                                            </label>
                                              <label class="radio-inline">
                                                <input type="radio" name="optionsRadiosInline" id="optionsRadiosInline3" value="option3">매우불만
                                            </label>
    
        
    <textarea name="ourtext" style="width:100%;border:1;overflow:visible;text-overflow:ellipsis;" rows=3 placeholder="기타의견사항"></textarea>
<br>
    </div>
    
    
        </div>    


			</div>
			<div class="show">
			<div class="in">
				<button type="button" class="btn btn-success" onclick="submit"
					style="margin-left:570px">리뷰등록</button>
			</div>
</div>
		</div>

	</div>
	<!-- end wrapper -->
	<!-- Core Scripts - Include with every page -->
	<script src="../resources/plugins/jquery-1.10.2.js"></script>
	<script src="../resources/plugins/bootstrap/bootstrap.min.js"></script>
	<script src="../resources/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="../resources/plugins/pace/pace.js"></script>
	<script src="../resources/scripts/siminta.js"></script>

</body>

</html>
