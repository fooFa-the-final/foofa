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
    <link href="${ctx}/resources/plugins/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="${ctx}/resources/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="${ctx}/resources/plugins/pace/pace-theme-big-counter.css" rel="stylesheet" />
  <link href="${ctx}/resources/css/style.css" rel="stylesheet" />
      <link href="${ctx}/resources/css/main-style.css" rel="stylesheet" />

    <!-- Page-Level CSS -->
    <link href="resources/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet" />

<c:set var="ctx">${pageContext.request.contextPath }</c:set>
</head>
<body>
    <!--  wrapper -->
    <div id="wrapper">
        <!-- navbar top -->
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation" id="navbar">
            <!-- navbar-header -->
                <a class="navbar-brand" href="index.html">
                    <img src="../../resources/img/logo.png" alt="" />
                </a>
            <!-- navbar-top-links -->
            <ul class="nav navbar-top-links navbar-right">
                <!-- main dropdown -->
                <li class="row">
                		<div class="col-xs-10" style="margin-right: 200px">
	            			<!-- search section-->
	                        <div class="input-group custom-search-form">
	                        	<input type="text" class="form-control" placeholder="Search" style="width: 400px">
	                            <input type="text" class="form-control" placeholder="Location" style="width: 400px">
	                                <button class="btn btn-default" type="button">
	                                    <i class="fa fa-search"></i>
	                                </button>
	                        </div>
	                		<!--end search section-->
	            		</div>
                </li>
                <li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-user fa-3x"></i>
				</a> <!-- dropdown user-->
					<ul class="dropdown-menu dropdown-user">
						<li><a href="#"><i class="fa fa-user fa-fw"></i>User
								Profile</a></li>
						<li><a href="#"><i class="fa fa-gear fa-fw"></i>Settings</a>
						</li>
						<li class="divider"></li>
						<li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i>Logout</a>
						</li>
					</ul> <!-- end dropdown-user --></li>
				<!-- end main dropdown -->
			</ul>
			<!-- end navbar-top-links -->

		</nav>
		<!-- end navbar top -->
       
		<!-- navbar side -->
		<script>
    function fileSubmit() {
        var formData = new FormData($("#fileForm")[0]);
        $.ajax({
            type : 'post',
            url : '${ctx }/member/fileUpload.do',
            data : formData,
            processData : false,
            contentType : false,
            success : function(html) {
                alert("파일 업로드하였습니다.");
            },
            error : function(error) {
                alert("파일 업로드에 실패하였습니다.");
                console.log(error);
                console.log(error.status);
            }
        });
    }
    
    
    $(document).ready(function(){
    $("#remove").click(function(){
    	var id = $("#").val();
    	$.ajax({
    		type : 'POST',
    		url : '${ctx }/follow/remove.do',
    		data : {
    			id : id
    		},
    		success:displayComment
    	});
    });
    });
    </script>
		<nav class="navbar-default navbar-static-side" role="navigation">
			<!-- sidebar-collapse -->
			<div class="sidebar-collapse">
				<!-- side-menu -->
				<ul class="nav" id="side-menu">

					<li class="selected"><a href="#"><i
							class="fa fa-flask fa-fw"></i>My Reviews</a>
					<li><a href="#"><i class="fa fa-flask fa-fw"></i>Followers</a>
					<li><a href="#"><i class="fa fa-flask fa-fw"></i>My
							Followers Review</a></li>
					<li><a href="#"><i class="fa fa-table fa-fw"></i>단골</a></li>
					<li><a href="#"><i class="fa fa-edit fa-fw"></i>회원정보수정</a></li>
				</ul>
				<!-- end side-menu -->
			</div>
			<!-- end sidebar-collapse -->
		</nav>
		<!-- end navbar side -->
		<!--  page-wrapper -->
		<div id="page-wrapper" style="background-color: #FFFFFF">
			<div class="container">
				<div class="row">
					<!-- Page Header -->
					<div class="row"
						style="height: 300px; background-color: #FFFFFF; position: absolute; width: 83.5%">
						<a class="navbar-brand" href="#"
							style="margin-top: 10px; margin-left: 20px">
							 <img
	src="../../resources/img/waikiki.jpg"
								style="height: 250px; width: 250px" />
								<br>

    <form id="fileForm" action="fileUpload" method="post"
        enctype="multipart/form-data">
        <input type="file" id="fileUp" name="fileUp"/>
        <input type="button" value="전송하기" onClick="fileSubmit();">
    </form>


								
						</a>
						<div class="user-info">
								<h1>"${member.memberId }"님의 프로필 페이지</h1>
								<br>
								<h5>twicejjang@chogo</h5>
								<h5>144Followers</h5>
								<h5>255Reviews</h5>
						</div>
						<span style="float: right; margin-right: 90px; margin-top: 30px">
							<a href="${ctx }/member/checkPw.do"><button type="button" class="btn btn-default">회원
									탈퇴</button></a> <br> <br> <br> <br> <br> <br>
							<br> <a href="#"><button type="button"
									class="btn btn-default">Make Follow</button></a>
						</span>

					</div>

				</div>
				<!--End Page Header -->
			</div>

			<div class="row">
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br> <br> <br> <br>
				<br>

				<div class="container">
<br><br>
					<h1>Follwer List</h1>
					<br>
					<c:forEach var="follow" items="${follow}" varStatus="sts">
					<div id="follwer" style="margin-bottom:50px">

						<a class="navbar-brand" href="#"
							style="margin-top: 10px; margin-left: 20px"> <img
							src="../../resources/img/waikiki.jpg"
							style="height: 70px; width: 70px" />
						</a>
						<div class="user-info">
						<tr class="odd gradeX">
						<td>${follow.fromId }</td>
							</tr>
							<br>
							<h5>144Followers</h5>
							<h5>255Reviews</h5>
							<br>
							</div><div style="float: right;">
							<br> <br> <br>
							<button id="remove" type="button" class="btn btn-default" style="inlince-bolck; margin-left: 350px;"value="${follow.fromId}" >UNFOLLOW</button>
							
						</div>
							</c:forEach>
						</div>
					</div>
</div>
				<!-- end page-wrapper -->

			</div>
			<!-- end wrapper -->

    <!-- Core Scripts - Include with every page -->
    <script src="../../resources/plugins/jquery-1.10.2.js"></script>
    <script src="../../resources/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="../../resources/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="../../resources/plugins/pace/pace.js"></script>
    <script src="../../resources/scripts/siminta.js"></script>
    <!-- Page-Level Plugin Scripts-->
    <script src="../../resources/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="../../resources/plugins/dataTables/dataTables.bootstrap.js"></script>
    <script>
        $(document).ready(function () {
            $('#dataTables-example').dataTable();
        });
    </script>

</body>

</html>
