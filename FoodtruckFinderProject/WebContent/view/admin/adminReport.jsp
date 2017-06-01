<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<c:set value="${pageContext.request.contextPath}" var="ctx" />
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>adminReport</title>
    <!-- Core CSS - Include with every page -->
    <link href="${ctx}/resources/plugins/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="${ctx}/resources/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="${ctx}/resources/plugins/pace/pace-theme-big-counter.css" rel="stylesheet" />
  <link href="${ctx}/resources/css/style.css" rel="stylesheet" />
      <link href="${ctx}/resources/css/main-style.css" rel="stylesheet" />

    <!-- Page-Level CSS -->
    <link href="${ctx}/resources/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet" />

</head>

<body>
    <!--  wrapper -->
    <div id="wrapper">
		
		<%@ include file="../header.jspf"%>

        <!-- navbar side -->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <!-- sidebar-collapse -->
            <div class="sidebar-collapse">
                <!-- side-menu -->
                <ul class="nav" id="side-menu">
                    <li class="selected">
                        <a href="${ctx }/review/report/list.do"><i class="fa fa-dashboard fa-fw"></i>신고 관리 </a>
                    </li>
                     <li>
                        <a href="${ctx }/survey/item/list.do"><i class="fa fa-flask fa-fw"></i>설문조사 관리</a>
                    </li>
                    <li >
                        <a href="${ctx }/advertise/list/asc.do"><i class="fa fa-table fa-fw"></i>광고 관리</a>
                    </li>
                </ul>
                <!-- end side-menu -->
            </div>
            <!-- end sidebar-collapse -->
        </nav>
        <!-- end navbar side -->
        <!--  page-wrapper -->
        <div id="page-wrapper">

            <div class="row">
                <!-- Page Header -->
                <div class="col-lg-12">
                    <h1 class="page-header">신고 관리</h1>
                </div>
                <!--End Page Header -->
            </div>
			<div class="row">
                <div class="col-lg-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                             	신고 리뷰 목록 
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                        	<th>Status</th>
                                            <th>Comments</th>
                                            <th>ID</th>
                                            <th>Count</th>
                                            <th>P/D</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach items="${list }" var = "review" varStatus="status">
	                                        <tr class="odd gradeX">
	                                            <td>${status.count }</td>
	                                            <td><input type="button" class="btn btn-default" value="리뷰 내용"></td>
	                                            <td class="center">${review.writer.memberId }</td>
	                                            <td class="center">5</td>
	                                			<td><button type="button" class="btn btn-primary">PASS</button><button type="button" class="btn btn-danger">DELETE</button></td>
	                                        </tr>
                                        </c:forEach>
                                       <!--  <tr class="odd gradeX">
                                            <td>2</td>
                                            <td>서대현 바보 .</td>
                                            <td>이승건 </td>
                                            <td class="center">1</td>
                                            <td class="center"><button type="button" class="btn btn-danger">DELETE</button></td>
                                			<td><button type="button" class="btn btn-primary">PASS</button></td>
                                        <tr class="odd gradeX">
                                            <td>3</td>
                                            <td>골드까지올려주실분구함 .</td>
                                            <td>서대현 </td>
                                            <td class="center">190</td>
                                            <td class="center"><button type="button" class="btn btn-danger">DELETE</button></td>
                                			<td><button type="button" class="btn btn-primary">PASS</button></td>
                                		</tr> -->
                                    </tbody>
                                </table>
                            </div>
                            
                        </div>
                    </div>
                    <!--End Advanced Tables -->
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
    <!-- Page-Level Plugin Scripts-->
    <script src="${ctx}/resources/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="${ctx}/resources/plugins/dataTables/dataTables.bootstrap.js"></script>
    <script>
        $(document).ready(function () {
            $('#dataTables-example').dataTable();
        });
    </script>

</body>
</html>