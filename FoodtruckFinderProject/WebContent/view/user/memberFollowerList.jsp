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
		<div id="page-wrapper">
				<div class="row">
				<div 
						style="height: 300px; background-color: #FFFFFF; position: absolute; width: 83.5%">
						<a class="navbar-brand" href="#"
							style="margin-top: 10px; margin-left: 20px"> 
							<img id ="blah" src="${member.profileImg }" style="height: 250px; width: 250px" /> <br>

							<form id="fileForm" runat="server" action="fileUpload" method="post"
								enctype="multipart/form-data" style="font-size:10px;">
								<input type="file" id="fileUp" name="fileUp" onchange='readURL(this)'/> 
								<input type="button" value="전송하기" onClick="fileSubmit();">
							</form>

						</a>
						<div class="user-info">
                                <h2>${member.memberId}</h2><br>	
                                <h5>${member.email }</h5>
                                <h5>팔로워수&nbsp; ${member.followCount }</h5>
                                <h5>리뷰작성&nbsp;&nbsp;${member.reviewCount }</h5>
						</div>
<%-- 						<span style="float: right; margin-right: 90px; margin-top: 30px">
							<a href="${ctx }/member/checkPw.do"><button type="button"
									class="btn btn-default">회원 탈퇴</button></a> <br> <br> <br>
							<br> <br> <br> <br> <a href="#">
							<c:if test="${loginUserId == member.memberId }">
							<button
									type="button" class="btn btn-default">Make Follow</button></c:if></a>
									
						</span> --%>
					</div>
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br> <br> <br> <br>
				<br>

					<br> <br>
					<h1>Follwer List</h1>
					<br>
					<c:forEach var="follow" items="${follow}" varStatus="sts">
						<div id="follwer${follow.toId }" style="margin-bottom: 50px">
							<a class="navbar-brand" href="#"
								style="margin-top: 10px; margin-left: 20px"> <img
								src="../resources/img/waikiki.jpg"
								style="height: 70px; width: 70px" />
							</a>
							<div class="user-info">
								<tr class="odd gradeX">
									<td><a href="${ctx }/review/list/member.do?memberId=${follow.toId }">${follow.toId }</a></td>
								</tr>
								<br>
								<h5>144Followers</h5>
								<h5>255Reviews</h5>
								<br>
							</div>
							<div style="float: right;">
								<br> <br> <br>
								<button type="button" class="btn btn-default"
									onclick="follow('${follow.toId}');">UNFOLLOW</button>
							</div>
							</div>
					</c:forEach>
		</div>
		<!-- end page-wrapper -->

	</div>
	<!-- end wrapper -->
</div>
	<!-- Core Scripts - Include with every page -->
	<script src="../../resources/plugins/jquery-1.10.2.js"></script>
	<script src="../../resources/plugins/bootstrap/bootstrap.min.js"></script>
	<script src="../../resources/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="../../resources/plugins/pace/pace.js"></script>
	<script src="../../resources/scripts/siminta.js"></script>
	<!-- Page-Level Plugin Scripts-->
	<script src="../../resources/plugins/dataTables/jquery.dataTables.js"></script>
	<script
		src="../../resources/plugins/dataTables/dataTables.bootstrap.js"></script>
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="resources/js/jquery-3.1.1.min.js"></script>
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
						alert("파일 업로드에 성공하였습니다.");
					},
					error : function(error) {
						alert("파일 업로드에 실패하였습니다.");
						console.log(error);
						console.log(error.status);
					}
				});
			}

			var follow = function(toId) {
				$(document).ready(function() {
					var btn = $("#delete");
					$.ajax({
						type : 'GET',
						url : "${ctx }/follow/remove.do",
						data : {
							toId : toId
						},
						success : function(data) {
							var fowId = "#follwer"+toId;
							$(fowId).remove();
							
						}
					});
				});
			}
			
			
			  function readURL(input) {
			        if (input.files && input.files[0]) {
			            var reader = new FileReader();
			            
			            reader.onload = function (e) {
			                $('#blah').attr('src', e.target.result);
			            }
			            
			            reader.readAsDataURL(input.files[0]);
			        }
			    }
			    
			    $("#fileUp").change(function(){
			        readURL(this);
			    });	        
			    
			    $(document).ready(function () {
					$('#side-follow').attr('class', 'selected');
		        });
		</script>

</body>

</html>
