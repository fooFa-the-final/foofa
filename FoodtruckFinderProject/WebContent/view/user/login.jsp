<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<c:set value="${pageContext.request.contextPath}" var="ctx" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FooFa Login</title>
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

<body class="body-Login-back">
 <!--  wrapper -->
    <div id="wrapper">
		<%@ include file="../header.jspf"%>
	</div>
	
 <!--  end wrapper -->
    <div class="container">
       
        <div class="row">
            <div class="col-md-8 col-md-offset-2 text-center logo-margin ">
            	<h1>푸드트럭 파인더를 찾아주셔서 감사합니다!</h1>  
            </div>
            <div class="col-md-6 col-md-offset-3">
                <div class="login-panel panel panel-default">                  
                    <div class="panel-heading">
                        <h3 class="panel-title">Please Sign In</h3>
                    </div>
                    <div class="panel-body">
                        <form method="post" action="${ctx }/login.do">
                     
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="ID" name="memberId" type="text" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Password" name="password" type="password" value="">
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input name="isSeller" type="checkbox" value="sellerLogin">판매자 로그인
                                    </label>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <button type="submit" class="btn btn-lg btn-success btn-block">Login</button>
                                <button type="button" class="btn btn-lg btn-success btn-block" onclick="loginG();">Google Login</button>
                            </fieldset>
                        </form>
                    </div>
                </div>
            	<span>아직 회원이 아니신가요? 가입해보세요!</span>  
            	 <div style="text-align:right; display:inline; float:right">
				<button type="submit" class="btn btn-primary" onclick="location.href='${ctx}/member/createForm.do'">회원 가입</button>
				<button type="button" class="btn btn-default"onclick="location.href='${ctx}/seller/create.do'">판매자 가입</button>
				</div>
            </div>
        </div>
    </div>

     <!-- Core Scripts - Include with every page -->
    <script src="resources/plugins/jquery-1.10.2.js"></script>
    <script src="resources/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="resources/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src=”resources/scripts/google_oauth.js”></script> 
</body>

</html>
