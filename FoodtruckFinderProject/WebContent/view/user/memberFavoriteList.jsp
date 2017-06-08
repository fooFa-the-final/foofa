<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<c:set value="${pageContext.request.contextPath}" var="ctx" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>팔로우리스트</title>
<!-- Core CSS - Include with every page -->
<link href="${ctx}/resources/plugins/bootstrap/bootstrap.css"
	rel="stylesheet" />
<link href="${ctx}/resources/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<link href="${ctx}/resources/plugins/pace/pace-theme-big-counter.css"
	rel="stylesheet" />
<link href="${ctx}/resources/css/style.css" rel="stylesheet" />
<link href="${ctx}/resources/css/main-style.css" rel="stylesheet" />

<!-- Page-Level CSS -->
<link href="resources/plugins/dataTables/dataTables.bootstrap.css"
	rel="stylesheet" />

<c:set var="ctx">${pageContext.request.contextPath }</c:set>
</head>
<body>
   <div id="wrapper">
		<%@ include file="../header.jspf"%>
		<%@ include file="../left/memberLeft.jspf"%>
		<!--  page-wrapper -->
		<div id="page-wrapper">
		
				<div class="row">
					<!-- Page Header -->
					<div class="col-lg-12 div-profile"
						style="height: 350px; background-color: #FFFFFF; ">
						<a class="navbar-brand" href="#"
							style="margin-top: 10px; margin-left: 20px"> <img
							src="${ctx }/resources/upload/${member.profileImg }"
							style="height: 250px; width: 250px" /> <br>

							<form id="fileForm" action="fileUpload" method="post" enctype="multipart/form-data">
								<input type="file" id="fileUp" name="fileUp" /> <input
									type="button" value="전송하기" onClick="fileSubmit();">
							</form>

						</a>
						<div class="user-info">
                                <h2>${member.memberId}</h2><br>	
                                <h5>${member.email }</h5>
                                <h5>팔로워수&nbsp; ${member.followCount }</h5>
                                <h5>리뷰작성&nbsp;&nbsp;${member.reviewCount }</h5>
						</div>
					<%-- 	<span style="float: right; margin-right: 90px; margin-top: 30px">
							<a href="${ctx }/member/checkPw.do"><button type="button"
									class="btn btn-default">회원 탈퇴</button></a>
						 <a href="#"><button
									type="button" class="btn btn-default">Make Follow</button></a>
						</span>
					 --%>
					</div>
				</div>

			<div class="row">
					<div class="col-lg-12">
					<h1>Favorite List</h1>
					<c:forEach var="truck" items="${trucks}" varStatus="sts">
						<div id="${truck.foodtruckId }" style="margin-bottom: 50px">
							<a class="navbar-brand" href="#"
								style="margin-top: 10px; margin-left: 20px"> <img
								src="../resources/img/waikiki.jpg"
								style="height: 70px; width: 70px" />
							</a>
							<div class="user-info">
								<p>
									<a href="${ctx }/review/list/truck.do?foodtruckId=${truck.foodtruckId }">${truck.foodtruckName }</a>
								</p>
								<br>
								<h5>${truck.favoriteCount } Favorite</h5>
								<h5>${truck.reviewCount } Reviews</h5>
								<br>
							</div>
							<div style="float: right;">
								<br> <br> <br>
								<button type="button" class="btn btn-default"
									onclick="favorite('${truck.foodtruckId }');">Unfavorite</button>
							</div>
							</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<!-- end page-wrapper -->

	</div>
	<!-- end wrapper -->

	<!-- Core Scripts - Include with every page -->
	<script src="${ctx}/resources/plugins/jquery-1.10.2.js"></script>
	<script src="${ctx}/resources/plugins/bootstrap/bootstrap.min.js"></script>
	<script src="${ctx}/resources/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="${ctx}/resources/plugins/pace/pace.js"></script>
	<script src="${ctx}/resources/scripts/siminta.js"></script>
	<!-- Page-Level Plugin Scripts-->
	<script src="${ctx}/resources/plugins/dataTables/jquery.dataTables.js"></script>
	<script
		src="${ctx}/resources/plugins/dataTables/dataTables.bootstrap.js"></script>
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script>

			function fileSubmit() {
				var formData = new FormData($("#fileForm")[0]);
				$.ajax({
					type : 'post',
					url : '${ctx }/member/fileUpload.do',
					data : formData,
					processData : false,
					contentType : false,
					success : function(html) {
						alert("파일 업로드하였습니다.");
					},
					error : function(error) {
						alert("파일 업로드에 실패하였습니다.");
						console.log(error);
						console.log(error.status);
					}
				});
			}

			var favorite = function(foodtruckId) {
					
					$.ajax({
						type : 'GET',
						url : "${ctx }/favorite/remove.do",
						data : {
							foodtruckId : foodtruckId
						},
						success : function(data) {
							$("#"+foodtruckId).remove();
						}
					});
			}
			
	        $(document).ready(function () {
				$('#side-favorite').attr('class', 'selected');
	        });
	</script>

</body>

</html>
