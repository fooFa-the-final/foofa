<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<c:set value="${pageContext.request.contextPath}" var="ctx" />
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bootsrtap Free Admin Template - SIMINTA | Admin Dashboad Template</title>
    <!-- Core CSS - Include with every page -->
    <link href="${ctx}/resources/plugins/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="${ctx}/resources/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="${ctx}/resources/plugins/pace/pace-theme-big-counter.css" rel="stylesheet" />
    <link href="${ctx}/resources/css/style.css" rel="stylesheet" />
    <link href="${ctx}/resources/css/main-style.css" rel="stylesheet" />

</head>

<body>
    <!--  wrapper -->
    
    <div id="wrapper">
        <!-- navbar top -->
        <%@ include file="../header.jspf"%>
        <!-- end navbar top -->
        <%@ include file="../left/memberLeft.jspf"%>
        
        <!--  page-wrapper -->
        <div id="page-wrapper">
                <div class="row" >
                	<div style="height:300px; background-color:#FFFFFF; position:relative; width:83.5%; display:block">
                    <span>
                                  <img name="image" id="image" src="${ctx }/resources/upload/${member.profileImg }" style="height:250px; width:250px"/>
                            <div class="user-info" >
                                <h2>${member.memberId}</h2><br>	
                                <h5>${member.email }</h5>
                                <h5>팔로워수&nbsp; ${member.followCount }</h5>
                                <h5>리뷰작성&nbsp;&nbsp;${member.reviewCount }</h5>
                            </div>  
                    </span>
                        </div>
            
                <!-- Page Header -->

                <!--End Page Header -->
                <div class="col-md-12">
                	<h1>My Followers Review</h1>
                	<c:forEach items="${list }" var="Review">
                		<div class = "col-md-offset-1 col-md-8" style="height:500px;margin-top:50px">
                		<span><font class="h3"><a href="${ctx }/review/list/truck.do?foodtruckId=${Review.foodtruck.foodtruckId }">${Review.foodtruck.foodtruckName }</a></font></span>
                		<span style="float:right"><input type="button" value="follow" class="btn btn-result"> <input type="button" value="!" class="btn btn-result"></span><br>
                		<img src="${ctx}/resources/img/smile.png" width="300px" height="300px"><br><br>
                		<font size="4px">
                		<span>점수 : ${Review.score } 추천: ${Review.recommand }</span>
                		<span style="float:right">${Review.writeDate }</span><br>
                		${Review.contents }	
                		</font>
                		</div>
                	</c:forEach>
                </div>
            </div>
        </div>
        <!-- end page-wrapper -->
        
    </div>
    <!-- end wrapper -->

    <!-- Core Scripts - Include with every page -->
    <script src="${ctx}/resources/plugins/jquery-1.10.2.js"></script>
    <script src="${ctx}/resources/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="${ctx}/resources/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${ctx}/resources/plugins/pace/pace.js"></script>
    <script src="${ctx}/resources/scripts/siminta.js"></script>
    <script>
    $(document).ready(function () {
		$('#side-news').attr('class', 'selected');
    });
    </script>

</body>
</html>