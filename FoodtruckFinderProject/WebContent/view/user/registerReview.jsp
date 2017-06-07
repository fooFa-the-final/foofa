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
		<c:choose>
		<c:when test="${review ne 'null'}">
			$('input:radio[name=score]:input[value='+${review.score}+']').attr("checked", true);
			$('#contents').val("${review.contents}");
			$('#submit').attr("action", "${ctx }/review/modify.do");
			$("#isSurvey").attr("disabled", true); 
		</c:when>
		<c:otherwise>
			$('#submit').attr("action", "${ctx }/review/create.do");
		
		</c:otherwise>
		</c:choose>
		
		$("#file1").change(function(){
		    alert("file1");
		});
		$("#file2").change(function(){
		    alert("file2");
		});
	});
	var openSurvey = function(){
		if($("input:checkbox[id='isSurvey']").is(":checked"))
			$('#myModal').modal();
	}
	
	var uploadImage = function(){
		$('#upload').modal();
	}
	
	var fileinfo = function(input){
		if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                    $("#image").append('<img src="' + e.target.result + '" style="width:200px; height: 200px;">');
                }
            reader.readAsDataURL(input.files[0]);
            }
	}
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
<form id = "submit" method = "post">	
	<!--  wrapper -->
	<div id="wrapper">
		<header>
			<%@ include file="../header.jspf"%>
		</header>

		<!--  page-wrapper -->



	</div>
	<!-- end wrapper -->
	<div class="container" style="color: black;">
		<h2>Write Review</h2>
		<div class="row">
		<div class="col-lg-12" style="display:block;">
		
			<div class="col-lg-3">
				<div class="blog-stripe">
					<img width="200px" height="200px"
						src="${ctx }/resources/img/pizzahut.png">
				</div>
			</div>
			<div class="col-lg-6">

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
						<div class="media-body" >
							<h4 class="media-heading">${truck.spot }</h4>
						</div>
					</li>
				</ul>
			</div>
			<!-- 「그림」 -->
			<div class="col-lg-4" style="height:200px;display:inline-block">
				<img id = "img1" style="width:150px;height:150px;border:0px">
				<img id = "img2" style="width:150px;height:150px;border:0px">
			</div>
				<div class="text-right">
						<input type="button" class="btn btn-primary" data-toggle="modal" data-target="#upload" value="Add Photo">
        </div>    
        
        
				<div class="col-lg-12">
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
				
				설문 응답 여부 : 
				<input type="checkbox" class = "btn btn-default" name = "isSurvey" id = "isSurvey" onclick="openSurvey()"> 
					
			
					<div class="modal fade" id="myModal" role="dialog">
					    <div class="modal-dialog">
					      <!-- Modal content-->
					      <div class="modal-content">
					        <div class="modal-header">
					          <button type="button" class="close" data-dismiss="modal">&times;</button>
					          <h4 class="modal-title">설문</h4>
					        </div>
					        
					        <div class="modal-body">
					          <c:forEach items="${itemlist }" var = "item">
		     					<h4>${item.question }</h4>
		                        <label class="radio-inline">
		                            <input type="radio" name="q${item.itemId }" value="5" >매우만족
		                        </label>
		                        <label class="radio-inline">
		                            <input type="radio" name="q${item.itemId }" value="4">만족
		                        </label>
		                        <label class="radio-inline">
		                            <input type="radio" name="q${item.itemId }" value="3">보통
		                        </label>
		                    	<label class="radio-inline">
		                            <input type="radio" name="q${item.itemId }" value="2">불만
		                        </label>
		                        <label class="radio-inline">
		                            <input type="radio" name="q${item.itemId }" value="1">매우불만
		                        </label>
								</c:forEach>
								<textarea name="ourtext" style="width:100%;border:1;overflow:visible;text-overflow:ellipsis;" rows=3 placeholder="기타의견사항"></textarea>
					        </div>
					        <div class="modal-footer">
					          <input type="button" class="btn btn-default" data-dismiss="modal" value="닫기">
					        </div>
					      </div>
					      
					    </div>
					  </div>
    			</div>


			</div>
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
			 
</form>
<!-- 그림 Modal -->
		  	<div class="modal fade" id="upload" role="dialog">
		    <div class="modal-dialog">
		      <!-- Modal content-->
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		          <h4 class="modal-title">사진 업로드</h4>
		        </div>
		        
		        <div class="modal-body">
		           	<input type="file" id = "file1"><br>
		          	<input type="file" id = "file2">
		        </div>
		        <div class="modal-footer">
		        <input type="button" class="btn btn-default" data-dismiss="modal" value="업로드">
		          <input type="button" class="btn btn-default" data-dismiss="modal" value="닫기">
		        </div>
		      </div>
		      
		    </div>
		  </div>	
	<!-- end wrapper -->
	<!-- Core Scripts - Include with every page -->
	<script src="${ctx }/resources/plugins/bootstrap/bootstrap.min.js"></script>
	<script src="${ctx }/resources/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="${ctx }/resources/plugins/pace/pace.js"></script>
	<script src="${ctx }/resources/scripts/siminta.js"></script>

</body>

</html>
