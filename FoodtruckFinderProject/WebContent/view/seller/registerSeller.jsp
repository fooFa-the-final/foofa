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
<link href="${ctx}/resources/plugins/dataTables/dataTables.bootstrap.css"
	rel="stylesheet" />

<c:set var="ctx">${pageContext.request.contextPath }</c:set>
</head>

<style>
</style>

<script>

$(document).ready(function(){
    $("form").submit(function(){
        if($("input[name='sellerId']").val() == ""){
            $("input[name='sellerId']").css("border", "1px solid red").after("<span>아이디를 입력해주세요</span>");
            $("span").css("color", "red").fadeOut(3000);
            return false;
        }
    });   
    $(":input").focus(function(){
        $(this).css("border", "4px red solid");
    }).blur(function(){
        $(this).css("border", "");
    });       
    
    $(":text").focus(function(){
        $(this).after("<strong>필수 항목입니다.</strong>");
    }).blur(function(){
    $("strong").remove();
    })
    

	$(":radio").click(function(){
   		$("label").css("font-weight", "");
    	$("label[for='" + $(this).attr("id") + "']").css("font-weight", "bold");
	});
});



//아이디 ajax

		$("#sellerId").keyup(function() {
			$.ajax({
				url : "${ctx}/seller/checkId.do",
				type : "post",
				data : $("form").serialize(),
				success : function(data) {
					if (data.length > 0) {
					document.getElementById('duplicateResult').value = "이미 해당 아이디로 가입된 회원가 있습니다.";
					} else {
						if ($("#sellerId").val().length < 5) {
						document.getElementById('duplicateResult').value = "아이디를 5자 이상 입력해주세요.";
						} else {
							document.getElementById('duplicateResult').value = "사용 가능한 아이디입니다.";
						}
					}
				},
				error : function(error) {
					alert(error.statusText);
				}
			});

			return false;
		});

//비밀번호 일치 확인 
	function checkPwd() {
		var f1 = document.forms[0];
		var pw1 = f1.password.value;
		var pw2 = f1.password1.value;
		if (pw1 != '' && pw2 != '') {
			if (pw1 != pw2) {
				document.getElementById('checkPwd').style.color = "red";
				document.getElementById('checkPwd').innerHTML = "동일한 암호를 입력하세요.";
			} else {
				document.getElementById('checkPwd').style.color = "black";
				document.getElementById('checkPwd').innerHTML = "암호가 확인 되었습니다.";
			}
		}
	}
</script>

<body>

	<!--  wrapper -->
	<div id="wrapper">
		<!-- navbar top -->

		<nav class="navbar navbar-default navbar-fixed-top" role="navigation"
			id="navbar">
			<!-- navbar-header -->
			<br>

			<ul class="nav navbar-top-links navbar-right">
				<div class="col-xs-10" style="margin-right: 550px">
					<a class="navbar-brand" style="float: center" href="index.html">
						<img src="../../resources/img/MainLogo.png" alt="" />
					</a>
				</div>
			</ul>
			<!-- navbar-top-links -->
			<ul class="nav navbar-top-links navbar-right">
				<li class="row">
					<div class="col-xs-10" style="margin-right: 350px">
						<!-- search section-->
						<div class="input-group custom-search-form">
							<input type="text" class="form-control" placeholder="Search"
								style="width: 400px"> <input type="text"
								class="form-control" placeholder="Location" style="width: 400px">
							<button class="btn btn-default" type="button">
								<i class="fa fa-search"></i>
							</button>
						</div>
						<!--end search section-->
					</div>
				</li>
			</ul>
		</nav>
		<!-- end navbar top -->

		<!-- Core Scripts - Include with every page -->


		<!-- end page-wrapper -->

	</div>
	<!-- end wrapper -->

	<!-- Core Scripts - Include with every page -->

	<script src="assets/plugins/jquery-1.10.2.js"></script>
	<script src="assets/plugins/bootstrap/bootstrap.min.js"></script>
	<script src="assets/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="assets/plugins/pace/pace.js"></script>
	<script src="assets/scripts/siminta.js"></script>

</body>
<br>
<br>
<br>
<br>
<br>
<div id="Register">
	<b style="margin-left: 157px"><font size="6">Join With us as Seller</font></b>
</div>
<br>
<br>
<div class="container">
	<div class="row" id="Truck">
		<form action="${ctx }/seller/create.do" method="post">
			<b> <font size="4">ID</font></b> <br>
			<div id="idmessage">
				<input id="sellerId" name="sellerId" class="form-control" onkeyup="checkId()" type="text" placeholder="ID를 입력해주세요.">
					 <div id="duplicateResult"></div>
					 <button type="button" id="chdckId" onclick="checkId();" value="">중복확인</button>
					 <br>
			</div>
			<div>
				<b> <font size="4">Password</font></b> <br> <input
					id="password" name="password" class="form-control" type="password">
				<br> <br> <b> <font size="4">Confirm Password</font></b> <br>
				<input id="password1" name="password1" class="form-control"
					type="password" onkeyup="checkPwd()"> 
					<div id="checkPwd"></div> 
					<br> <b><font size="4">Business
						Registration Number</font></b> <br> <input id="certification"
					name="certification" class="form-control" type="text"> <br>
				<br> <b><font size="4">Phone</font></b> <br> <input
					id="phone" name="phone" type="text" class="form-control"
					name="phone"> <br> <br>
				<div class="col-md-offset-5 col-sm-25 col-lg-25">
					<input type="submit" value="등록" class="btn btn-primary">
				</div>
			</div>
		</form>
	</div>
	<br> <br>
</div>
</html>
