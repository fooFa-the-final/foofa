<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<c:set value="${pageContext.request.contextPath}" var="ctx" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 수정</title>
<!-- Core CSS - Include with every page -->
<link href="${ctx}/resources/plugins/bootstrap/bootstrap.css"
	rel="stylesheet" />
<link href="${ctx}/resources/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<link href="${ctx}/resources/plugins/pace/pace-theme-big-counter.css"
	rel="stylesheet" />
<link href="${ctx}/resources/css/style.css" rel="stylesheet" />
<link href="${ctx}/resources/css/main-style.css" rel="stylesheet" />
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	
	
<script>
$(document).ready(function(){
    $("form").submit(function()
    		{
       	var pw1 = document.getElementById("password").value;
       	var pw2 = document.getElementById("password1").value;
    	var gender = $('#gender');

       	if(pw1 != pw2){
            $("input[name='password1']").css("border", "1px solid red").after("<span>비밀번호가 일치하지 않습니다</span>");
            $("span").css("color", "red").fadeOut(3000);
            return false;
        } else if ($("input[name='birthday']").val() != ""){
			var data = document.getElementById("birthday").value;
			var y = parseInt(data.substr(0, 4), 10); 
			var m = parseInt(data.substr(4, 2), 10); 
			var d = parseInt(data.substr(6, 2), 10); 
			var dt = new Date(y, m-1, d); 
			if(dt.getDate() != d) { $("input[name='birthday']").css("border","1px solid red")
				.after("<span>유효한 연도를 입력해주세요</span>");$("span").css("color", "red").fadeOut(3000);
				return false;

			} 
			else if(dt.getMonth()+1 != m) { $("input[name='birthday']").css("border","1px solid red")
				.after("<span>유효한 월을 입력해주세요</span>");$("span").css("color", "red").fadeOut(3000); 
				return false;

			} 
			else if(dt.getFullYear() != y) { $("input[name='birthday']").css("border","1px solid red")
				.after("<span>유효한 일수를 입력해주세요</span>");$("span").css("color", "red").fadeOut(3000); 
				return false;
			} 
		}
    });   
    $(":input").focus(function(){
        $(this).css("border", "4px red solid");
    }).blur(function(){
        $(this).css("border", "");
    });       
});
</script>	

	
<body>

	<div id="wrapper">
		<%@ include file="../include/header.jspf"%>
		<%@ include file="../include/memberLeft.jspf"%>

		<!--  page-wrapper -->
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h2 class="page-header">Modify your Info</h2>
					<div class="col-lg-8 col-lg-push-2">
						<div class="panel panel-default">
							<div class="panel-heading">
							 수정할 정보를 입력해주세요.
							</div>
							<div class="panel-body">
								<div class="form-group">
									<form role="form" action="${ctx }/member/modify.do" method="post">
										<input type="hidden" value="${member.memberId }" name="memberId">
										<div class="form-group">
											<label>ID</label> <b class="form-control" style="background-color:#eee;">${member.memberId }</b>
										</div>
										<div class="form-group">
											<br><label>Password</label> <input class="form-control" id="password"
												type="password" name="password" value="${member.password}">
											<br> <label>Password Check</label><input class="form-control" id="password1"
									name="password1"			type="password" value="${member.password}"> <br>
										</div>
										<div class="form-group">
											<label>Email</label> <input class="form-control" id="email"
												type="text" name="email" value="${member.email}"> <br>
										</div>
										<div class="form-group">
											<label>Birthday</label> <input class="form-control"
												id="birthday" type="text" name="birthday"
												value="${member.birthday}"> <br>
										</div>
										<div class="form-group">
											<div>
											<label>성별</label><br>
											<c:choose>
												<c:when test="${member.gender eq 'M' }">
													<label class="radio-inline">
														<input type="radio" checked="checked" name="gender" id="gender" value="${member.gender }">남성
													</label>
													 <label class="radio-inline">
														<input type="radio" name="gender" id="gender" value="F">여성
													</label>
												</c:when>
												<c:otherwise>
													<label class="radio-inline">
														<input type="radio" checked="checked" name="gender" id="gender" value="M">남성
													</label>
													 <label class="radio-inline">
														<input type="radio" name="gender" checked="checked" id="gender" value="F">여성
													</label>
												</c:otherwise>
											</c:choose>
											</div>
										</div>
										<div style="text-align:center;">
											<button type="submit" class="btn btn-primary">Modify</button>
											<button type="reset" class="btn btn-default" onclick="javascript:history.back();">Cancel</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
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
		$('#side-modify').attr('class', 'selected');
	})
	</script>
</body>
</html>