<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:set value="${pageContext.request.contextPath}" var="ctx" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FooFa Register Member</title>
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

	var idReg = /^[a-z]+[a-z0-9]{3,17}$/g;
	var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/; 

	$(document).ready(function() {$("form").submit(function() {
						    $('#id').keyup(function(){if ( $('#id').val().length > 3) {
						            var id = $(this).val();
				                    console.log(id);
						            // ajax 실행
						            $.ajax({
						                type : 'POST',
										url : "${ctx }/member/checkId.do",
						                data:
						                {
						                    id: id
						                },
						                success : function(data) {
						                    console.log(data);
											if ($.trim(data) == 'no') {
												$('#idmessage').html("사용 가능한 ID 입니다.");
						                    } else {
												$('#idmessage').html("사용 중인 ID 입니다.");
						                    }
						                }
						            }); // end ajax
						        }
						    }); // end keyup
											if (!idReg.test($("input[name='memberId']").val())) {
												if ($("input[name='memberId']").val() == "") {
													$("input[name='memberId']").css("border","1px solid red").after("<span>아이디4글자 이상 16글자 이하 영문자 숫자의 조합입니다.</span>");
													$("span").css("color","red").fadeOut(3000);
													return false;
												} else {
													return false
												}
											} else if ($("input[name='password']").val() == "") {
												$("input[name='password']").css("border","1px solid red")
														.after("<span>비밀번호를 입력해주세요</span>");
												$("span").css("color", "red").fadeOut(3000);
												return false;
											} else if ($(
													"input[name='password1']")
													.val() == "") {
												$("input[name='password1']")
														.css("border",
																"1px solid red")
														.after(
																"<span>비밀번호를 한번더 입력해주세요</span>");
												$("span").css("color", "red")
														.fadeOut(3000);
												return false;
											} else if ($("input[name='email']").val().length < 0) {
												$("input[name='email']").css("border","1px solid red").after("<span>이메일을 입력해주세요</span>");
												$("span").css("color", "red").fadeOut(3000);
												return false;
											} else if(!regEmail.test($("input[name='email']").val())){
												$("input[name='email']").css("border","1px solid red").after("<span>올바른 이메일주소를 입력해주세요</span>");
												$("span").css("color", "red").fadeOut(3000);
												return false;												
											} else if ($("input[name='birthday']").val() == "") {
												$("input[name='birthday']").css("border","1px solid red")
														.after("<span>생년월일 입력해주세요</span>");$("span").css("color", "red").fadeOut(3000);
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
											} else if(($("input[name*='gender']:checked").length)<=0){$("input[name='genderCheck']").css("border","1px solid red").after("<span>성별을 선택해주세요.</span>");
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
	
	
	function checkId(){
		var id = $("#id").val();
		if($("input[name='memberId']").val().length > 3){
			$.ajax({
				type : 'POST',
				url : "${ctx }/member/checkId.do",
				data : {
					id : id
				},
				success : function(data) {
					$("#result").html(data);
					if ($.trim(data) == 'no') {
						$('#idmessage').html("사용 가능한 ID 입니다.");
	                    $(".signupbtn").prop("disabled", false);
	                    $(".signupbtn").css("background-color", "#4CAF50");
					} else {
						$('#idmessage').html("사용중인 ID 입니다.");
                        $(".signupbtn").prop("disabled", true);
                        $(".signupbtn").css("background-color", "#8A8A80");
					}

				}

			});
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
		<b style="margin-left: 15px"><font size="6">Join With us
				</font></b>
	<br>
	<a style="margin-left:715px" href="${ctx }/view/seller/registerSeller.jsp" target="_self">판매자 가입은 이쪽입니다</a>
	
	</div>
	<br>
	<br>

	<div class="container">
		<div class="row" id="Truck">
			<div class="col-lg-12">

				<form name="form" id="form" action="${ctx }/member/create.do" method="post">	
							
				<div>
					<b> <font size="4">ID</font></b> <br> <input id="id"
						name="memberId" type="text" placeholder="ID를 입력해주세요."
						onkeydown="fn_press_han(this);" oninput="checkId()">
					<div id="idmessage">
						<br>
					</div>
					<br>
					<div>
						<b> <font size="4">Password</font></b> <br> <input
							id="password" name="password" type="password"> <br>
						<br> <b> <font size="4">Confirm Password</font></b> <br>
						<input id="password1" name="password1" type="password"
							onkeyup="checkPwd();">
						<div id="checkPwd"></div>
						<br> <b><font size="4">Email</font></b> <br> <input id="email" name="email"
							type="text" onkeypress="fn_press_han">
						<br> <br> <b><font size="4">birthday</font></b>
						<br> <input id="birthday" name="birthday" type="text"
							onkeypress="onlyNumber();" maxlength="8"> 생년월일을 숫자로 입력해주세요 <br> <br>
								  <b><font size="4">Gender</font></b><br>
								  							<input type="hidden" name="genderCheck">
								  							<br>
								 <input type="radio" name="gender" id="gender" value="F">남성
									<input type="radio" name="gender" id="gender" value="M">여성
									<br><br>
						   <input type="submit" class="signupbtn" disabled="disabled" value="등록">
						   </div>
						</div>
																   				</form>
						
			</div>
		</div>
		
		</div>

		<br> <br>

	<!-- end wrapper -->

	<!-- Core Scripts - Include with every page -->
	<script src="${ctx}/resources/plugins/jquery-1.10.2.js"></script>
	<script src="${ctx}/resources/plugins/bootstrap/bootstrap.min.js"></script>
	<script src="${ctx}/resources/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="${ctx}/resources/plugins/pace/pace.js"></script>
	<script src="${ctx}/resources/scripts/siminta.js"></script>
</body>


</html>
