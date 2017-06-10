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

		<%@ include file="../include/header.jspf"%>
		<%@ include file="../include/memberLeft.jspf"%>
		<div id="page-wrapper">
				<div class="row">
           		     <!-- Page Header -->
 					<%@ include file="../include/memberProfile.jspf" %>
            	    <!--End Page Header -->
                
					<h1>follower List</h1>
					<br>
					<c:forEach var="follow" items="${follow}" varStatus="sts">
						<div id="follower${follow.memberId }" style="margin-bottom: 50px">
							<a class="navbar-brand" href="#"
								style="margin-top: 10px; margin-left: 20px"> 
								<img src="${ctx }/resources/upload/${follow.profileImg }" style="height:70px;width:70px">
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
							<c:if test="${loginUserId eq member.memberId }">
							<div style="float: right;">
								<br> <br> <br>
								<button id="delete" type="button" class="btn btn-default"
									onclick="unfollow('${follow.memberId}');">UNFOLLOW</button>
							</div></c:if>
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
    <script src="${ctx}/resources/scripts/profile.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="http://malsup.github.com/jquery.form.js"></script> 
	<script>
        $(document).ready(function () {
			$('#side-follow').attr('class', 'selected');
			if ('${loginUserId}' !=''){
				followExist('${member.memberId}');
			}
        });
		

		var unfollow = function(toId) {
						var btn = $("#delete");
						$.ajax({
							type : 'GET',
							url : "${ctx }/follow/remove.do",
							data : {
								toId : toId
							},
							success : function(data) {
								var fowId = "#follower"+toId;
								$(fowId).remove();
								
							}
						});
		}
				</script>

</body>

</html>
