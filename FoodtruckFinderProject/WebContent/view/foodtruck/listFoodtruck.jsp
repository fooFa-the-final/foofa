<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

    <style>
     table.alignCenter {
        margin-left: auto;
        margin-right: auto;
        
        }
        table.border {
            
        }

    </style>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>푸드트럭 검색결과</title>
    <!-- Core CSS - Include with every page -->
    <link href="../../resources/plugins/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="../../resources/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="../../resources/plugins/pace/pace-theme-big-counter.css" rel="stylesheet" />
  <link href="../../resources/css/style.css" rel="stylesheet" />
      <link href="../../resources/css/main-style.css" rel="stylesheet" />

    <!-- Page-Level CSS -->
    <link href="../../resources/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet" />

</head>

<body>
    <!--  wrapper -->
    <div id="wrapper" style="color:#FFFFFF">
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
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-3x"></i>
                    </a>
                    <!-- dropdown user-->
                    
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i>User Profile</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i>Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i>Logout</a>
                        </li>
                    </ul>
                    <!-- end dropdown-user -->
                </li>
                <!-- end main dropdown -->
            </ul>
            <!-- end navbar-top-links -->
        </nav>
        <!-- end navbar top -->

        <!--  page-wrapper -->

                <!--End Page Header -->
            </div>

            <div class="row">
                <!-- Page Header -->
                <div class="col-lg-12">
                <br>
                    <br>
                    <table class="alignCenter" >
                <tr><td>  
                    <button type="button" class="btn btn btn-warning">OPEN NOW</button>&nbsp; &nbsp;&nbsp;</td>
                <td>    <div class="checkbox"> 
                    <label>
                     <input type="checkbox" value="">카드 결제
                     </label>
                     </div>
                    </td>
    <td>&nbsp;&nbsp; &nbsp; </td><td>
                     <div class="checkbox">
                     <label>
                     <input type="checkbox" value="">알콜 판매
                     </label>
                     </div>
        </td>
    <td>&nbsp;&nbsp; &nbsp; </td><td>
                     <div class="checkbox">
                     <label>
                     <input type="checkbox" value="">주차 가능
                     </label>
                     </div>
        </td>
    <td>&nbsp;&nbsp; &nbsp; </td><td>
                     <div class="checkbox">
                     <label>
                     <input type="checkbox" value="">케이터링
                     </label>
                     </div>
        </td>
                      <td>&nbsp;&nbsp; &nbsp; </td><td>
   <div class="selectbox">                <select id="disabledSelect" class="form-control">
                                        <option>리뷰많은 순</option>
                                        <option>단골많은 순</option>
                                        
                                                                        
                                  </select>
                        
                     </div>
                    
                    
                                                 
                        </table>
                </div>
            </div>
    
    
    
    <div>
    <div style="float: left; width: 66%" >
            <h2>검색어 결과 </h2><br>
            <div class="find">
            <table>
          <tr>
          <th rowspan="3"><img width="200px" height="200px" src="../../resources/img/pizzahut.png" style="margin-right:10px"></th>
        <th width="200px"> <a href="" style="color:black">정찬기의 피자집</a>
        &nbsp;&nbsp;<th>피자</th>
        </tr>
        <tr>  
          <td>단골 144명</td> </tr>
          <tr><td>225리뷰</td></tr>
          </table>
                   <br>
            </div>

            
     
            <div class="find" style="maring-bottom:20px">
            <table>
          <tr>
          <th rowspan="3"><img width="200px" height="200px" src="../../resources/img/pizzahut.png" style="margin-right:10px"></th>
        <th width="200px" > <a href="" style="color:black; font-weight:bold">이승건의 삐따기</a>
        &nbsp;&nbsp;<th>핫도그</th>
        </tr>
       <tr>  
          <td>단골 144명</td> </tr>
          <tr><td>225리뷰</td></tr>
          </table>
                   <br>
            </div>
            
                 
            <div class="find" style="maring-bottom:20px">
            <table>
          <tr>
          <th rowspan="3"><img width="200px" height="200px" src="../../resources/img/pizzahut.png" style="margin-right:10px"></th>
        <th width="200px" > <a href="" style="color:black; font-weight:bold">이승건의 삐따기</a>
        &nbsp;&nbsp;<th>핫도그</th>
        </tr>
       <tr>  
          <td>단골 144명</td> </tr>
          <tr><td>225리뷰</td></tr>
          </table>
                   <br>
            </div>
            
                 
            <div class="find" style="maring-bottom:20px">
            <table>
          <tr>
          <th rowspan="3"><img width="200px" height="200px" src="../../resources/img/pizzahut.png" style="margin-right:10px"></th>
        <th width="200px" > <a href="" style="color:black; font-weight:bold">이승건의 삐따기</a>
        &nbsp;&nbsp;<th>핫도그</th>
        </tr>
       <tr>  
          <td>단골 144명</td> </tr>
          <tr><td>225리뷰</td></tr>
          </table>
                   <br>
            </div>


            <div class="find" style="maring-bottom:20px">
            <table>
          <tr>
          <th rowspan="3"><img width="200px" height="200px" src="../../resources/img/pizzahut.png" style="margin-right:10px"></th>
        <th width="200px" > <a href="" style="color:black; font-weight:bold">이승건의 삐따기</a>
        &nbsp;&nbsp;<th>핫도그</th>
        </tr>
       <tr>  
          <td>단골 144명</td> </tr>
          <tr><td>225리뷰</td></tr>
          </table>
                   <br>
            </div>

        



        </div>

       <div style="float: left; width:33%; margin-top: 100px">
<img width="400px" height="400px" src="../../resources/img/map.jpg" >
        </div>
        </div>
        <!-- end page-wrapper -->
<!-- <center><div class=conatiner>
    <a style="color:white; font-size: 30px;">1</a>
    <a style="color:white; font-size: 30px;">2</a>
    <a style="color:white; font-size: 30px;">3</a>
    <a style="color:white; font-size: 30px;">4</a>
    <a style="color:white; font-size: 30px;">5</a>

    </div></center> -->
    <div style="float: left; margin:auto" >
         <div style="margin-left: 700px; margin-right: auto; margin-bottom: 50px">
        
             
           <a href="" >1&nbsp;</a><a href="">2&nbsp;</a><a href="">3&nbsp;</a><a href="">4&nbsp;</a><a href="">5&nbsp;</a><a href="">6&nbsp;</a>
        </div>
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
