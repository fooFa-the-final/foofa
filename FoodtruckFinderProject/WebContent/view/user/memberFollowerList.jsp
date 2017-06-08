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
<link href="${ctx }/resources/plugins/dataTables/dataTables.bootstrap.css"
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
						
                    	<form id="fileUpload" method="post" enctype="multipart/form-data">
                            <a class="navbar-brand" href="#" style="margin-top:10px;" >
                                <img name="image" id="image" src="${ctx }/resources/upload/${member.profileImg }" style="height:250px; width:250px" onClick="document.all.file.click();"/>
                            	<input type="file" name="file" id="file" style="display: none;" onchange="fileinfo(this)"/>
                            </a>
                        </form> 
						<div class="user-info">
                                <h2>${member.memberId}</h2><br>	
                                <h5>${member.email }</h5>
                                <h5>팔로워수&nbsp; ${member.followCount }</h5>
                                <h5>리뷰작성&nbsp;&nbsp;${member.reviewCount }</h5>
						</div>
						<span style="float: right; margin-right: 90px; margin-top: 30px">
							<a href="${ctx }/member/checkPw.do"><button type="button"
									class="btn btn-default">회원 탈퇴</button></a> <br> <br> <br>
							<br> <br> <br> <br> <a href="#">
							<c:if test="${loginUserId == member.memberId }">
							<button
									type="button" class="btn btn-default">Make Follow</button></c:if></a>
									
						</span> 
					</div>
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br> <br> <br> <br>
				<br>

					<br> <br>
					<h1>Follwer List</h1>
					<br>
					<c:forEach var="follow" items="${follow}" varStatus="sts">
						<div id="follwer${follow.memberId }" style="margin-bottom: 50px">
							<a class="navbar-brand" href="#"
								style="margin-top: 10px; margin-left: 20px"> <img
								src="${ctx }/resources/img/${follow.profileImg }"
								style="height: 70px; width: 70px" />
							</a>
							<div class="user-info">
								<tr class="odd gradeX">
									<td><a href="${ctx }/review/list/member.do?memberId=${follow.memberId }">${follow.memberId }</a></td>
								</tr>
								<br>
								<h5>팔로워수&nbsp; ${follow.followCount }</h5>
								<h5>리뷰작성&nbsp;&nbsp;${follow.reviewCount }</h5>
								<br>
							</div>
							<div style="float: right;">
								<br> <br> <br>
								<button type="button" class="btn btn-default"
									onclick="follow('${follow.memberId}');">UNFOLLOW</button>
							</div>
							</div>
					</c:forEach>
		</div>
		<!-- end page-wrapper -->

	</div>
	<!-- end wrapper -->
</div>
	<!-- Core Scripts - Include with every page -->
	<script src="${ctx }/resources/plugins/jquery-1.10.2.js"></script>
	<script src="${ctx }/resources/plugins/bootstrap/bootstrap.min.js"></script>
	<script src="${ctx }/resources/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="${ctx }/resources/plugins/pace/pace.js"></script>
	<script src="${ctx }/resources/scripts/siminta.js"></script>
	<!-- Page-Level Plugin Scripts-->
	<script src="${ctx }/resources/plugins/dataTables/jquery.dataTables.js"></script>
	<script
		src="${ctx }/resources/plugins/dataTables/dataTables.bootstrap.js"></script>
		
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="${ctx }/resources/js/jquery-3.1.1.min.js"></script>
	<script src="http://malsup.github.com/jquery.form.js"></script> 

		<script>
		function fileinfo(input){
	      	if (input.files && input.files[0]) {
	            var reader = new FileReader();
	            reader.onload = function (e) {
	                    $("#image").attr("src", e.target.result);
	                }
	            reader.readAsDataURL(input.files[0]);
            }
	      	$("#fileUpload").ajaxForm({
	      		url:"${ctx}/member/fileUpload.do",
	      		enctype: "multipart/form-data",
	      		success: function(result){
	      			alert("사진이 등록되었습니다.");
	      		},
	      		error: function(){
	      			alert("등록에 실패하였습니다. 다시 시도해주세요.")
	      		}
	      	});
	      	$("#fileUpload").submit();
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
				</script>

</body>

</html>
