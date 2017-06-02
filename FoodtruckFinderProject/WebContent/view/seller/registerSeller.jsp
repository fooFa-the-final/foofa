<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:set value="${pageContext.request.contextPath}" var="ctx" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FooFa Register Seller</title>
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
<link
	href="${ctx}/resources/plugins/dataTables/dataTables.bootstrap.css"
	rel="stylesheet" />

<c:set var="ctx">${pageContext.request.contextPath }</c:set>
</head>

<style>
#indexMain {
	margin: 60px;
}

#indexbody {
	margin-left: 350px;
}

#Register {
	margin-left: 330px;
}

#Truck {
	margin-left: 200px;
}

#Location {
	margin-left: 700px;
}
}
</style>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<script>
	function fn_press_han(obj) {
		//좌우 방향키, 백스페이스, 딜리트, 탭키에 대한 예외
		if (event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37
				|| event.keyCode == 39 || event.keyCode == 46)
			return;
		//obj.value = obj.value.replace(/[\a-zㄱ-ㅎㅏ-ㅣ가-힣]/g, '');
		obj.value = obj.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');
	}
	var ds = document.getElementById('sucessCheck');

	var idReg = /^[a-z]+[a-z0-9]{3,17}$/g;

	$(document).ready(function() {$("form").submit(
										function() {
											alert()
											if (!idReg.test($("input[name='sellerId']").val())) {
												if ($("input[name='sellerId']").val() == "") {
													$("input[name='sellerId']").css("border","1px solid red").after("<span>아이디4글자 이상 16글자 이하 영문자 숫자의 조합입니다.</span>");
													$("span").css("color","red").fadeOut(3000);
													return false;
												} else {
													return false
												}
											} else if ($(
													"input[name='password']").val() == "") {$("input[name='password']").css("border","1px solid red").after("<span>비밀번호를 입력해주세요</span>");
												$("span").css("color", "red").fadeOut(3000);
												return false;
											} else if ($("input[name='password1']")
													.val() == "") {$("input[name='password1']").css("border","1px solid red").after("<span>비밀번호를 한번더 입력해주세요</span>");
												$("span").css("color", "red").fadeOut(3000);
												return false;
											} else if ($("input[name='certification']").val().length < 10) {
												$("input[name='certification']").css("border","1px solid red").after("<span>사업자등록번호를 입력해주세요</span>");
												$("span").css("color", "red").fadeOut(3000);
												return false;
											} else if ($("input[name='phone']").val() == "") {$("input[name='phone']").css("border","1px solid red").after("<span>핸드폰번호를 입력해주세요</span>");
												$("span").css("color", "red").fadeOut(3000);
												return false;
											}
										});
						$(":input").focus(function() {
							$(this).css("border", "4px red solid");
						}).blur(function() {
							$(this).css("border", "");
						});

						$(":text").focus(function() {
							$(this).after("<strong>필수 항목입니다.</strong>");
						}).blur(function() {
							$("strong").remove();
						})

						$("#idCheck").click(function() {
							var id = $("#id").val();
							$.ajax({
								type : 'POST',
								url : "${ctx }/seller/checkId.do",
								data : {
									sellerId : id
								/* sellerId => 넘어가는 parameter이름 : id 넘기는 var id */
								},
								success : function(data) {
									var suc = "suc";
									var fail = "fa"
									$("#result").html(data);
									if ($.trim(data) == 'no') {
										$('#idmessage').html("사용 가능한 ID 입니다.");
										$('#sucessCheck').val(data);
										var ds = document.getElementById('idmessage');
										alert(data);
										alert(ds);
										
									} else {
										$('#idmessage').html("사용중인 ID 입니다.");
										$('#sucessCheck').val(data); 
										alert(data);
										var ds = document.getElementById('sucessCheck');
										
										alert(ds);
									}
									
								}

							});
						});
					});

	function onlyNumber(str) {
		if ((event.keyCode < 48) || (event.keyCode > 57))
			event.returnValue = false;
	}

	//비밀번호 일치 확인 
	function checkPwd() {
		var pw1 = document.getElementById("password").value;

		var pw2 = document.getElementById("password1").value;
		if (pw1 != '' && pw2 != '') {
			if (pw1 != pw2) {
				document.getElementById('checkPwd').style.color = "red";
				document.getElementById('checkPwd').innerHTML = "암호가 일치하지 않습니다..";
			} else {
				document.getElementById('checkPwd').style.color = "black";
				document.getElementById('checkPwd').innerHTML = "암호가 일치합니다.";
			}
		}
	}
</script>

<body>

	<!--  wrapper -->
	<div id="wrapper">

		<%@ include file="../header.jspf"%>
		<!-- navbar top -->
	</div>
	<div id="Register">
		<b style="margin-left: 157px"><font size="6">Join With us
				as Seller</font></b>
	</div>
	<br>
	<br>
	<div class="container">
		<div class="row" id="Truck">
			<div class="col-lg-12">

				<form action="${ctx }/seller/create.do" method="post">



					<b> <font size="4">ID</font></b> <br> <input id="id"
						name="sellerId" type="text" placeholder="ID를 입력해주세요."
						onkeydown="fn_press_han(this);">
					<button type="button" name="checking" id="idCheck" value="t">중복확인</button>
					<div id="idmessage">
						<br>
					<input type="hidden" id="sucessCheck" name="sucessCheck" value="">
					</div>
					<br>
					<div>
						<b> <font size="4">Password</font></b> <br> <input
							id="password" name="password" type="password"> <br>
						<br> <b> <font size="4">Confirm Password</font></b> <br>
						<input id="password1" name="password1" type="password"
							onkeyup="checkPwd();">
						<div id="checkPwd"></div>
						<br> <b><font size="4">Business Registration
								Number</font></b> <br> <input id="certification" name="certification"
							type="text" onkeypress="onlyNumber()" maxlength="10">
						-(하이픈)입력하지 않으셔도 됩니다. <br> <br> <b><font size="4">Phone</font></b>
						<br> <input id="phone" name="phone" type="text" name="phone"
							onkeypress="onlyNumber();" maxlength="11"> <br> <br>
						<div class="col-md-offset-5 col-sm-25 col-lg-25">
							<input type="submit" value="등록" class="btn btn-primary">
						</div>
					</div>
				</form>
			</div>
		</div>
		<br> <br>
	</div>

	<!-- end wrapper -->

	<!-- Core Scripts - Include with every page -->
	<script src="${ctx}/resources/plugins/jquery-1.10.2.js"></script>
	<script src="${ctx}/resources/plugins/bootstrap/bootstrap.min.js"></script>
	<script src="${ctx}/resources/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="${ctx}/resources/plugins/pace/pace.js"></script>
	<script src="${ctx}/resources/scripts/siminta.js"></script>
</body>
</html>
