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
<script src="http://malsup.github.com/jquery.form.js"></script> 

<!-- Page-Level CSS -->
<script>
	$(document).ready(function(){
		<c:choose>
		<c:when test="${review ne 'null'}">
			$('input:radio[name=score]:input[value='+${review.score}+']').attr("checked", true);
			$('#contents').val("${review.contents}");
			$('#submit').attr("action", "${ctx }/review/modify.do");
			$("#isSurvey").attr("disabled", true);
			var count = 0;
			<c:forEach items="${imglist}" var="filename">
				count++;
				var imgname = "#img" + count;
				var filename = "#file" + count;
				var filemodifyname = "#filemodify" + count;
				$(imgname).attr("src", "${ctx}/resources/img/reviewImg/${filename}");
				$(filemodifyname).val("${filename}");
				$(imgname).css("display", "");
			</c:forEach>	
		</c:when>
		<c:otherwise>
			console.log("등록");
			$('#submit').attr("action", "${ctx }/review/create.do");
		
		</c:otherwise>
		</c:choose>
	});
	var openSurvey = function(){
		if($("input:checkbox[id='isSurvey']").is(":checked"))
			$('#myModal').modal();
	}
	
	var uploadImage = function(){
		$('#upload').modal();
	}
	
	var image1;
	var image2;
	var flag = true;
	var fileinfo = function(input){
		if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
            	/* if(input.id == "file1")
            		$("#img1").attr("src", e.target.result);
            	else
            		$("#img2").attr("src", e.target.result); */
            	var id = input.id;
				
            	var imgid = "#img" + id.charAt(id.length -1);
            	var filemodifyid = "#filemodify" + id.charAt(id.length -1);
				if(flag == true){
            		flag = false;
            		for(var i=2;i<=5;i++){
            			var imgid2 = "#img" + i;
            			$(imgid2).attr("src","");
            			$(imgid2).css("display", "none");;
            		}
            	}
            	console.log(filemodifyid);
            	$(imgid).attr("src", e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
	}
	
	/* var imgUpload = function(){
		$('#uploadImage').ajaxForm({
			url: "${ctx}/review/img.do",
			enctype: "multipart/form-data", // 여기에 url과 enctype은 꼭 지정해주어야 하는 부분이며 multipart로 지정해주지 않으면 controller로 파일을 보낼 수 없음
			success: function(result){
				alert(result);
			}
		});
		$("#uploadImage").submit();
    } */
    
    var count = 1;
    var addImage = function(){
    	if(count==5){
    		alert("이미지 업로드는 최대 5장까지 가능합니다.");
    	}
    	else{
		   	count++;
		   	filename = "#file" + count;
		   	imgname = "#img" + count;
		   	$(filename).css("display", "");
		   	$(imgname).css("display", "");
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

	<!--  wrapper -->
	<div id="wrapper">
		<header>
			<%@ include file="../include/header.jspf"%>
		</header>

		<!--  page-wrapper -->



	</div>
	<!-- end wrapper -->
	<div class="container" style="color: black;">
		<h2>Write Review</h2>
		<div class="row">
		<div class="col-lg-12" style="display:block;">
		
			<div class="col-lg-3">
				<c:choose>
					<c:when test="${review eq 'null'}">
					<img width="280px" height="280px" style="border-radius:10px;"
						src="${ctx }/resources/img/food/${truck.foodtruckImg}">
					</c:when>
					<c:otherwise>
					<img width="200px" height="200px"style="border-radius:10px;"
						src="${ctx }/resources/img/food/${review.foodtruck.foodtruckImg}">
					</c:otherwise>
				</c:choose>
			</div>
			<div class="col-lg-8">
				<div class="col-lg-12" style="padding:0 20px;">
					<h4><a href="" style="color: black; font-weight: bold">${truck.foodtruckName }</a>&nbsp;&nbsp;<span class="starRating" style="text-align:left;"><span id="mainTableScore" style="width: ${truck.score*20 }%">${truck.score }점</span></span></h4>
					<h5><i class="fa fa-bookmark"></i>&nbsp; ${truck.category1 }&nbsp;${truck.category2 }&nbsp;${truck.category3 }</h5>
					<h5><i class="fa fa-location-arrow"></i>&nbsp;  ${truck.spot }</h5>
					<h5><i class="fa fa-map-marker"></i>&nbsp;  ${truck.location }</h5>
				</div>
				
				<div class="col-lg-12">
					<!-- 「그림」 -->
					<div style="display:inline-block;padding:20px;border:0px;" id="imgDiv">
						<img id = "img1" style="width:150px; height:150px;border:0px solid white;">
						<img id = "img2" style="width:150px;height:150px;border:0px;display:none">
						<img id = "img3" style="width:150px;height:150px;border:0px;display:none">
						<img id = "img4" style="width:150px;height:150px;border:0px;display:none">
						<img id = "img5" style="width:150px;height:150px;border:0px;display:none">
					</div>
				</div>
			</div>
			<div class="col-lg-11">
			
				설문 응답 여부 : 
				<input type="checkbox" class = "btn btn-primary btn-outline" name = "isSurvey" id = "isSurvey" onclick="openSurvey()"> 
				<input type="button" class="btn btn-primary" data-toggle="modal" data-target="#upload" value="Add Photo" style="float:right;">
			</div>
        
        <form id = "submit" method = "post" enctype="multipart/form-data">
        	<input type="hidden" name = "foodtruckId" value="${truck.foodtruckId }">
        	<c:if test="${review ne 'null'}">
				<input type="hidden" value="${review.reviewId }" name="reviewId">
			</c:if>
				<div class="col-lg-11">
					<ul class="list-inline" style="margin:10px;">
						<li><input type = "radio" name="score" value="5"> ★★★★★
										<input type = "radio" name="score" value="4"> ★★★★
										<input type = "radio" name="score" value="3"> ★★★
										<input type = "radio" name="score" value="2"> ★★
										<input type = "radio" name="score" value="1"> ★</li>
						<li>별점을 매겨주세요</li>
					</ul>
				<textarea name="contents" id="contents"
										style="width: 100%; border: 1; overflow: visible; text-overflow: ellipsis;"
										rows=15></textarea>

				</div>

				</div>
					
			
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
			 <!-- 그림 Modal -->
		  	<div class="modal fade" id="upload" role="dialog">
		    <div class="modal-dialog">
		      <!-- Modal content-->
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		          <h4 class="modal-title">사진 업로드</h4>
		        </div>
		        <div class="modal-body" id="fileDiv">
		           	<input type="file" id = "file1" name = "file1" onchange="fileinfo(this)">
		           	<input type="file" id = "file2" name = "file2" onchange="fileinfo(this)" style="display:none">
		           	<input type="file" id = "file3" name = "file3" onchange="fileinfo(this)" style="display:none">
		           	<input type="file" id = "file4" name = "file4" onchange="fileinfo(this)" style="display:none">
		           	<input type="file" id = "file5" name = "file5" onchange="fileinfo(this)" style="display:none">
		           	<input type="hidden" id="filemodify1" name="filemodify1">
		           	<input type="hidden" id="filemodify2" name="filemodify2">
		           	<input type="hidden" id="filemodify3" name="filemodify3">
		           	<input type="hidden" id="filemodify4" name="filemodify4">
		           	<input type="hidden" id="filemodify5" name="filemodify5">
		        </div>
		        <div class="modal-footer">
			        <input type="button" value="사진 추가" class="btn btn-default" onclick="addImage()">
			        <input type="button" class="btn btn-default" data-dismiss="modal" value="업로드">
		        </div>
		      </div>
		      
		    </div>
		  </div>	
</form>

	<!-- end wrapper -->
	<!-- Core Scripts - Include with every page -->
	<script src="${ctx }/resources/plugins/bootstrap/bootstrap.min.js"></script>
	<script src="${ctx }/resources/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="${ctx }/resources/plugins/pace/pace.js"></script>
	<script src="${ctx }/resources/scripts/siminta.js"></script>

</body>

</html>
