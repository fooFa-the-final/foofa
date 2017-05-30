<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html>
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
<style type="text/css">
.col-lg-6 {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 300px;
	height: 200px;
	overflow: hidden;
	margin-top: -150px;
	margin-left: -100px;
}
</style>

<script>

var PwdModifyCheckForm= function() { 
    var ReturnResult = false;
    OldPWDCheck(); 
    setTimeout("PwdModifyCheckForm2()", 500); 
// 약간의 지연 후에 함수를 실행 해야만 Ajax에서 변경된 값을 사용 할 수 있다. 아님 처음 로딩 된 값이 처리된다
    return ReturnResult; // 일단 submit은 실패 성공은 아래 함수에서 합니다 왜냐면 setTimeout 리턴을 받을 수 없습니다

    var pwdChk = createRequestObject();
    var page = '{$ctx}/view/seller/changePassword.jsp?old_pwd='+document.getElementById('old_pwd').value;
    pwdChk.open('get', page);
    pwdChk.setRequestHeader("If-Modified-Since", "Sat, 1 Jan 2000 00:00:00 GMT"); 

    pwdChk.onreadystatechange = function(){
        if(pwdChk.readyState == 4 && pwdChk.status == 200){
          var response = pwdChk.responseText;
          if(response == "0") { //pwd_chk.php에서 이전 비밀번호가 맞으면 0을 출력한다
            document.getElementById('pwdChkResult').value = "T";
          }else{
            document.getElementById('pwdChkResult').value = "F";
          }
        }    
    };
    
    pwdChk.send(null);
}

function PwdModifyCheckForm2(){

    if (document.getElementById('old_pwd').value.length == 0){
        alert("Please enter old password");
        document.getElementById('old_pwd').focus();
        return false;
    }

    var OLDResult = document.getElementById('pwdChkResult').value;    
    if ( OLDResult != "T"){
        alert("Invalid old Password");
        document.getElementById('old_pwd').focus();
        return false;
    }

    if (document.getElementById('new_pwd').value.length == 0){
        alert("Please enter new password");
        document.getElementById('new_pwd').focus();
        return false;
    }

    if (document.getElementById('new_pwd').value.length < 4){
        alert("The length of your password is at least 4 characters");
        document.getElementById('new_pwd').focus();
        return false;
    }
    
    if (document.getElementById('old_pwd').value == document.getElementById('new_pwd').value){
        alert("New password is old password the same");
        document.getElementById('new_pwd').focus();
        return false;
    }

    if (document.getElementById('re_pwd').value.length == 0){
        alert("Please enter confirm new password");
        document.getElementById('re_pwd').focus();
        return false;
    }
    
    if (document.getElementById('new_pwd').value != document.getElementById('re_pwd').value){
        alert("Confirm passwords are not equal");
        document.getElementById('re_pwd').focus();
        return false;
    }
        
    var msg = "Would you like to modify your password?"
    if(confirm(msg)){
        document.getElementById('AdminPwdModifyForm').submit(); // setTimeout 리턴을 할 수 없기 때문에 강제로 submit
    }else{
        return false;
    }    


}





</script>
</head>
<body>
	<header>
		<%@ include file="../header.jspf"%>
	</header>
	<div class="col-lg-6">
	<input type="hidden" id="pwdChkResult" name="pwdChkResult" value="F" />
		
		  <form id="AdminPwdModifyForm" method="post" action="./checkPassword.jsp" onsubmit="return PwdModifyCheckForm();">
     
    <fieldset>
      <legend>Administrator Password Modify</legend>
        <label for="old_pwd">Old Password</label>
        <input class="inputText" type="password" name="old_pwd" id="old_pwd" maxlength="20" value="" />
        <label for="new_pwd">New Password</label>
        <input class="inputText" type="password" name="new_pwd" id="new_pwd" maxlength="20" value="" /> 
        <label for="re_pwd">Confirm New Password</label>
        <input class="inputText" type="password" name="re_pwd" id="re_pwd" maxlength="20" value="" /> 
        <input type="submit" name="save" value="Save" />      
    </fieldset>    
    </form>
		
<%-- 		<form role="form" action="${ctx }/seller/checkPw.do" method="post">
			<div class="form-group">
				<label>Password</label> <input class="form-control" id="password"
					placeholder="비밀번호를 입력해 주세요">

				<button type="submit" class="btn btn-primary">submit</button>
			</div>
		</form>
		 --%>
		
	</div>
	<!-- Core Scripts - Include with every page -->
	<script src="${ctx}/resources/plugins/jquery-1.10.2.js"></script>
	<script src="${ctx}/resources/plugins/bootstrap/bootstrap.min.js"></script>
	<script src="${ctx}/resources/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="${ctx}/resources/plugins/pace/pace.js"></script>
	<script src="${ctx}/resources/scripts/siminta.js"></script>

</body>
</html>