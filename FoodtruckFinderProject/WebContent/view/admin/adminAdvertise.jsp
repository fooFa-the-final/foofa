<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FOODTRUCK FINDER</title>
    <!-- Core CSS - Include with every page -->
    <link href="resources/plugins/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="resources/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="resources/plugins/pace/pace-theme-big-counter.css" rel="stylesheet" />
  <link href="resources/css/style.css" rel="stylesheet" />
      <link href="resources/css/main-style.css" rel="stylesheet" />

    <!-- Page-Level CSS -->
    <link href="resources/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet" />

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
                    <li >
                        <a href="#"><i class="fa fa-dashboard fa-fw"></i>신고 관리 </a>
                    </li>
                     <li>
                        <a href="#"><i class="fa fa-flask fa-fw"></i>설문조사 관리</a>
                    </li>
                    <li class="selected">
                        <a href="#"><i class="fa fa-table fa-fw"></i>광고 관리</a>
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
                    <h1 class="page-header">광고 관리</h1>
                </div>
                <!--End Page Header -->
            </div>
            
			<div class="row">
            <div class="col-lg-12">
                     <!--Basic Tabs   -->
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#approved" data-toggle="tab">승인</a>
                                </li>
                                <li><a href="#unapproved" data-toggle="tab">미승인</a>
                                </li>
                            </ul>

                            <div class="tab-content">
                                <div class="tab-pane fade in active" id="approved">
                                    <h4>승인된 광고 목록</h4>
                           

                                    <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Status</th>
                                            <th>Name</th>
                                            <th>Start-Date</th>
                                            <th>End-Date</th>
                                            <th>Days</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="odd gradeX">
                                            <td>1</td>
                                            <td>효지니의 온니온니핏</td>
                                            <td>17/03/04</td>
                                            <td>17/06/04</td>
                                			<td>90</td>
                                        </tr>
                                        <tr class="odd gradeX">
                                            <td>2</td>
                                            <td>주희의 은혜로운 컵밥 </td>
                                            <td>17/06/01</td>
                                            <td>17/06/08</td>
                                			<td>7</td>
                                            </tr>
                                        <tr class="odd gradeX">
                                            <td>3</td>
                                            <td>승거니의 라멘달인</td>
                                            <td>17/06/01</td>
                                            <td>17/06/31</td>
                                			<td>30</td>
                                		</tr>
                                    </tbody>
                                </table>
                            </div>
                    <!--End Advanced Tables -->

                        </div>   
                               </div>
                                <div class="tab-pane fade" id="unapproved">
                                    <h4>미승인된 광고 목록</h4>   
                                    <Form method="post" action="">
                                    <div class="panel-body">
                            <div class="table-responsive">
                            
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Status</th>
                                            <th>Name</th>
                                            <th>Start-Date</th>
                                            <th>End-Date</th>
                                            <th>Days</th>
                                            <th>Select</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="odd gradeX">
                                            <td>1</td>
                                            <td>승거니의막말하는핏짜 </td>
                                            <td>17/07/04</td>
                                            <td>17/07/14</td>
                                			<td>10</td>
                                			<td> <input type="checkbox" name="check" value="">
											</td>
                                        </tr>
                                        <tr class="odd gradeX">
                                            <td>2</td>
                                            <td>주희의 은혜로운 컵밥 </td>
                                            <td>17/06/01</td>
                                            <td>17/06/08</td>
                                			<td>7</td>
                                			<td><input type="checkbox" name="check" value=""></td>
                                            </tr>
                                        <tr class="odd gradeX">
                                            <td>3</td>
                                            <td>승거니의 라멘달인</td>
                                            <td>17/06/01</td>
                                            <td>17/06/31</td>
                                			<td>30</td>
                                			<td><input type="checkbox" name="check" value=""></td>
                                		</tr>
                                    </tbody>
                                </table>
                            </div>
                    <!--End Advanced Tables -->
                                    </div>
                                    <div style="text-align:right">
                                        <button type="submit" class="btn btn-primary">Pass</button>
                                        <button type="button" class="btn btn-success">Approve</button>
                                    </div>
                                         </Form>               
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--End Basic Tabs   -->
                </div>
            </div>
            
           
            

        </div>
        <!-- end page-wrapper -->

    </div>
    <!-- end wrapper -->

    <!-- Core Scripts - Include with every page -->
    <script src="resources/plugins/jquery-1.10.2.js"></script>
    <script src="resources/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="resources/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="resources/plugins/pace/pace.js"></script>
    <script src="resources/scripts/siminta.js"></script>
    <!-- Page-Level Plugin Scripts-->
    <script src="resources/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="resources/plugins/dataTables/dataTables.bootstrap.js"></script>
    <script>
        $(document).ready(function () {
            $('#dataTables-example').dataTable();
        });
    </script>

</body>

</html>