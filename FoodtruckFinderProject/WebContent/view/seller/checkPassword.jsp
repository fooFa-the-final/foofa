<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<head>
<c:set value="${pageContext.request.contextPath}" var="ctx" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호 확인</title>
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
<style type="text/css">
.col-lg-6 {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 300px;
	height: 500px;
	overflow: hidden;
	margin-top: -150px;
	margin-left: -100px;
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		//비밀번호  확인 버튼 클릭
		$("#pwCheck").click(function() {
			var password = $("#password").val();
			$.ajax({
				type : 'POST',
				url : "${ctx }/seller/checkPw.do",
				data : {
					password : password
				},
				success : function(data) {
					$("#result").html(data);
					if ($.trim(data) == 'yes') {
						$("form").submit();
						return true;
					} else if ($.trim(data) == 'no') {
						$("#passwordResult").html("비밀번호가 일치하지않습니다.");
					}

				}
			});
		});
	});
</script>
<body>

	<div id="wrapper">

		<%@ include file="../include/header.jspf"%>
		<%@ include file="../include/sellerLeft.jspf"%>
		<!--  page-wrapper -->
		<div id="page-wrapper">
			<div class="row">
				<div class="col-md-4 col-md-offset-4">
					<div class="login-panel panel panel-danger">
						<div class="panel-heading">
							<h3 class="panel-title">비밀번호 확인 </h3>
						</div>
						<div class="panel-body">
						<form role="form" action="${ctx }/seller/remove.do" method="GET">
							<div class="form-group">
								<input class="form-control" id="password"
									name="password" type="password" placeholder="비밀번호를 입력해 주세요" />
								<p id="passwordResult" style="color:red;text-align:center; margin-top:5px;"></p>
							</div>
							<button type="button" class="btn btn-danger" style="float:right;"id="pwCheck">확인</button>
						</form>
					</div></div>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- Core Scripts - Include with every page -->
	<script src="${ctx}/resources/plugins/jquery-1.10.2.js"></script>
	<script src="${ctx}/resources/plugins/bootstrap/bootstrap.min.js"></script>
	<script src="${ctx}/resources/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="${ctx}/resources/plugins/pace/pace.js"></script>
	<script src="${ctx}/resources/scripts/siminta.js"></script>
	<script>
		$(document).ready(function() {
			$('#side-remove-seller').attr('class', 'selected');
		})
	</script>
</body>
</html>