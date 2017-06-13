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
                </div>
				<div class="row">
	                <div class="col-lg-12">
		                <div class="panel panel-default">
	                        <div class="panel-heading">
	                			<h4 class="panel-title">Follower List</h4>
	                        </div>
	                        <div class="panel-body">
								<c:forEach var="follow" items="${follow}" varStatus="sts">
								<div id="follow_${follow.memberId }"class="col-lg-6" style="border-bottom:1px solid #eee; padding:10px; margin:0px 0 10px 0;">
									<ul class="list-inline" style="display:inline-block; width:100%; ">
										<li><img src="${ctx }/resources/upload/${follow.profileImg }" style="height:70px;width:70px"></li>
										<li style="width:22%"><a href="${ctx }/review/list/member.do?memberId=${follow.memberId }"><b style="font-size:1.2em;">${follow.memberId }</b></a><br><br>
											<i class="fa fa-twitter"> &nbsp;</i>팔로워 : &nbsp; ${follow.followCount } <br> <i class="fa fa-pencil"> &nbsp;</i>리뷰 : &nbsp;${follow.reviewCount }
										</li>
										<li><button id="revList" type="button" class="btn btn-success btn-outline" onclick="location.href='${ctx}/review/list/member.do?memberId=${follow.memberId }'">리뷰 보기</button></li>
										<li><button id="favList" type="button" class="btn btn-info btn-outline" onclick="location.href='${ctx}/favorite/list.do?memberId=${follow.memberId }'">단골 보기</button></li>
										<c:if test="${loginUserId eq member.memberId }">
										<li><button id="unfollow" type="button" class="btn btn-danger btn-outline" onclick="unfollow('${follow.memberId}');">언팔로우</button></li>
										</c:if>
									</ul>
								</div>
								</c:forEach>
								
							</div>
						</div>
					</div>
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
								var fowId = "#follow_"+toId;
								$(fowId).remove();
								
							}
						});
		}
				</script>

</body>

</html>
