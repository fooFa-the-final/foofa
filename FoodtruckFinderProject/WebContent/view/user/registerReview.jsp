<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var = "ctx" value = "${pageContext.request.contextPath }"/>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>리뷰작성</title>
<!-- Core CSS - Include with every page -->
<link href="${ctx }/resources/plugins/bootstrap/bootstrap.css"
	rel="stylesheet" />
<link href="${ctx }/resources/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<link href="${ctx }/resources/plugins/pace/pace-theme-big-counter.css"
	rel="stylesheet" />
<link href="${ctx }/resources/css/style.css" rel="stylesheet" />
<link href="${ctx }/resources/css/main-style.css" rel="stylesheet" />

<script src="${ctx }/resources/plugins/jquery-1.10.2.js"></script>
<!-- Page-Level CSS -->
<script>
	$(document).ready(function(){
		<c:if test="${review ne 'null'}">
			$('input:radio[name=score]:input[value='+${review.score}+']').attr("checked", true);
			$('#contents').val("${review.contents}");
		</c:if>
	});
</script>
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
		<header>
			<%@ include file="../header.jspf"%>
		</header>

		<!--  page-wrapper -->



	</div>
	<!-- end wrapper -->
	<div class="container" style="color: black;">
	<form method="POST" action="${ctx }/review/create.do">
		<h2>Write Review</h2>
		<div class="row">
			<div class="col-md-1 col-lg-1"></div>
			<div class="col-md-3 col-lg-3">
				<div class="blog-stripe">
					<img width="200x" height="200px"
						src="${ctx }/resources/img/pizzahut.png">
				</div>
			</div>
			<div class="col-md-1 col-lg-1"></div>
			<div class="col-md-7 col-lg-7" style="margin-bottom: 50px">

				<ul class="all-blogs">
					<li class="media">
						<div class="media-body">
							<h4 class="media-heading">
								<a href="" style="color: black; font-weight: bold">${truck.foodtruckName }</a>
							</h4>
						</div>
					</li>
					<li class="media">
						<div class="media-body">
							<h4 class="media-heading">${truck.category1 }, ${truck.category2 }</h4>


						</div>
					</li>
					<li class="media">
						<div class="media-body">
							<h4 class="media-heading">${truck.spot }</h4>
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
				<c:choose>
				<c:when test="${review eq 'null'}">
					<form method="post" action="${ctx }/review/create.do">
					<input type="hidden" name="foodtruckId" value="${truck.foodtruckId}">
				</c:when>
				<c:otherwise>
					<form method="post" action="${ctx }/review/modify.do">
				</c:otherwise>
				</c:choose>
				
					
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
										<!-- <fieldset class="rating">
										    <input type="radio" id="star5" name="rating" value="5" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>
										    <input type="radio" id="star4half" name="rating" value="4 and a half" /><label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
										    <input type="radio" id="star4" name="rating" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
										    <input type="radio" id="star3half" name="rating" value="3 and a half" /><label class="half" for="star3half" title="Meh - 3.5 stars"></label>
										    <input type="radio" id="star3" name="rating" value="3" /><label class = "full" for="star3" title="Meh - 3 stars"></label>
										    <input type="radio" id="star2half" name="rating" value="2 and a half" /><label class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
										    <input type="radio" id="star2" name="rating" value="2" /><label class = "full" for="star2" title="Kinda bad - 2 stars"></label>
										    <input type="radio" id="star1half" name="rating" value="1 and a half" /><label class="half" for="star1half" title="Meh - 1.5 stars"></label>
										    <input type="radio" id="star1" name="rating" value="1" /><label class = "full" for="star1" title="Sucks big time - 1 star"></label>
										    <input type="radio" id="starhalf" name="rating" value="half" /><label class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
										</fieldset> -->
										<input type = "radio" name="score" value="5"> 5
										<input type = "radio" name="score" value="4"> 4
										<input type = "radio" name="score" value="3"> 3
										<input type = "radio" name="score" value="2"> 2
										<input type = "radio" name="score" value="1"> 1
									</td>
									<td>별점을 매겨주세요</td>

								</tr>
							</tbody>
							<tr>
								<td colspan="2"><textarea name="contents" id="contents"
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
			<div class="in" align="center">
			<c:choose>
				<c:when test="${review eq 'null'}">
					<input type="submit" class="btn btn-success" value="리뷰 등록">
				</c:when>
				<c:otherwise>
					<input type="submit" class="btn btn-primary" value="리뷰 수정">	
				</c:otherwise>
			</c:choose>
			</div>
			
</div>
		</div>
	</form>
	</div>
	<!-- end wrapper -->
	<!-- Core Scripts - Include with every page -->
	<script src="${ctx }/resources/plugins/bootstrap/bootstrap.min.js"></script>
	<script src="${ctx }/resources/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="${ctx }/resources/plugins/pace/pace.js"></script>
	<script src="${ctx }/resources/scripts/siminta.js"></script>

</body>

</html>
