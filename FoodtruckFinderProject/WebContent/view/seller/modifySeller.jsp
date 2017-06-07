<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>판매자 정보수정</title>
<!-- Core CSS - Include with every page -->
<link href="${ctx }/resources/plugins/bootstrap/bootstrap.css"
	rel="stylesheet" />
<link href="${ctx }/resources/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<link href="${ctx }/resources/plugins/pace/pace-theme-big-counter.css"
	rel="stylesheet" />
<link href="${ctx }/resources/css/style.css" rel="stylesheet" />
<link href="${ctx }/resources/css/main-style.css" rel="stylesheet" />
</head>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<script>
$(document).ready(function(){
    $("form").submit(function()
    		{
       	var pw1 = document.getElementById("password").value;
       	var pw2 = document.getElementById("password1").value;
    	if(pw1 != pw2){
            $("input[name='password1']").css("border", "1px solid red").after("<span>비밀번호가 일치하지 않습니다</span>");
            $("span").css("color", "red").fadeOut(3000);
            return false;
        } else if ($("input[name='certification']").val().length != 10) {
				$("input[name='certification']").css("border","1px solid red").after("<span>사업자등록번호를 10자리를 입력해주세요</span>");
				$("span").css("color", "red").fadeOut(3000);
				return false;
			} else if ($("input[name='phone']").val().length != 11) {$("input[name='phone']").css("border","1px solid red").after("<span>휴대폰 번호 11자리를 입력해주세요</span>");
				$("span").css("color", "red").fadeOut(3000);
				return false;
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
	<!--  wrapper -->
	<div id="wrapper">
		<%@ include file="../header.jspf"%>
		<%@ include file="../left/sellerLeft.jspf"%>
		<!--  page-wrapper -->
		<div id="page-wrapper">
			<div class="col-lg-6">
				<h2>Modify your Info</h2>
				<form action="${ctx }/seller/modify.do" method="post">
					<div class="form-group">
						<label>ID</label> <b class="form-control"><input type="hidden"
							class="form-control" name="sellerId" value="${seller.sellerId }">${seller.sellerId }</b>
					</div>
					<div class="form-group">
						<label>비밀번호 변경</label> <input class="form-control" id="password"
							name="password" type="password" value="${seller.password }"
							placeholder="비밀번호를 입력해 주세요"> <br> 
						<label>비밀번호 변경확인</label>	
							<input
							class="form-control" id="password1" name="password1"
							type="password" value="${seller.password }"
							placeholder="비밀번호를 입력해 주세요">
					</div>
					<br>
					<div class="form-group">
						<label>Business Registration Number</label> <input type="number"
							name="certification" class="form-control" id="certification"
							value="${seller.certification }"
							placeholder="${seller.certification }">
					</div>

					<div class="form-group">
						<label>Phone</label><br> <input id="phone" name="phone"
							type="number" name="phone" class="form-control" id="phone"
							value="${seller.phone }" placeholder="${seller.phone }">
					</div>
					<button type="submit" class="btn btn-primary">회원정보수정</button>
				</form>
			</div>
		</div>
		<!-- end page-wrapper -->

	</div>
	<!-- end wrapper -->

	<!-- Core Scripts - Include with every page -->
	<script src="${ctx }/resources/plugins/jquery-1.10.2.js"></script>
	<script src="${ctx }/resources/plugins/bootstrap/bootstrap.min.js"></script>
	<script src="${ctx }/resources/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="${ctx }/resources/plugins/pace/pace.js"></script>
	<script src="${ctx }/resources/scripts/siminta.js"></script>
	<script>
		$(document).ready(function() {
			$('#side-modify-seller').attr('class', 'selected');
		})
	</script>
</body>

</html>