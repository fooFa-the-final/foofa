<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<c:set value="${pageContext.request.contextPath}" var="ctx" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FooFa deleteMember</title>
    <!-- Core CSS - Include with every page -->
    <link href="${ctx}/resources/plugins/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="${ctx}/resources/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="${ctx}/resources/plugins/pace/pace-theme-big-counter.css" rel="stylesheet" />
  <link href="${ctx}/resources/css/style.css" rel="stylesheet" />
      <link href="${ctx}/resources/css/main-style.css" rel="stylesheet" />

    <!-- Page-Level CSS -->
    <link href="resources/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet" />

<c:set var="ctx">${pageContext.request.contextPath }</c:set>
</head>
<script type="text/javascript">
	function pass() {
		req = document.getElementsByName("bye");
		if (req[0].checked) {
			var f = document.forName;
			f.action = "${ctx }/member/remove.do";
			f.submit();
		} else {
			var msg = "약관동의에 체크해 주세요";
			alert(msg);
		}
	}	
</script>
<body class="body-Login-back">
 <!--  wrapper -->
    <div id="wrapper">

		<%@ include file="../include/header.jspf"%>
		<%@ include file="../include/memberLeft.jspf"%>
		<!--  page-wrapper -->
		<div id="page-wrapper">
			<div class="row">
       			 <form method="post" name="forName">
				<div class="col-lg-12">
           			 <div class="col-md-8 col-md-offset-2 text-center logo-margin ">
          			  	<h1>회원탈퇴</h1>  
  			          </div>
    		          <div class="col-md-6 col-md-offset-3">
             
              		  <div class="login-panel panel panel-default">                  
               		     <div class="panel-heading">
               		         <h3 class="panel-title">약관동의</h3>
             		       </div>
              	      <div class="panel-body">
                      
		                   	  <h1>탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</h1>
		                     		 <h1>사용하고 계신 아이디는 탈퇴할 경우 재사용 및 복구가 불가능합니다.</h1>
							<input type="checkbox" id="bye" name="bye" value="yes"><b>안내 사항을 모두 확인하였으며, 이에 동의합니다.</b>
                    	</div>
               		 </div>
            		<span>우린 친구라고 믿었는대...잘가...</span>  
            		<button type="button" onclick="pass();" class="btn btn-primary">Delete</button>
            		</div>		
				</div>
            	</form>
			</div>
		</div>		
		<!--  end page-wrapper -->
	</div>
	
 <!--  end wrapper -->


	<!-- Core Scripts - Include with every page -->
	<script src="${ctx}/resources/plugins/jquery-1.10.2.js"></script>
	<script src="${ctx}/resources/plugins/bootstrap/bootstrap.min.js"></script>
	<script src="${ctx}/resources/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="${ctx}/resources/plugins/pace/pace.js"></script>
	<script src="${ctx}/resources/scripts/siminta.js"></script>
	<script>

	</script>

</body>

</html>
