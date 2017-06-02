<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
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
    <title>Foodtruck Finder</title>
    <!-- Core CSS - Include with every page -->
    <link href="${ctx }/resources/plugins/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="${ctx }/resources/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="${ctx }/resources/plugins/pace/pace-theme-big-counter.css" rel="stylesheet" />
  	<link href="${ctx }/resources/css/style.css" rel="stylesheet" />
    <link href="${ctx }/resources/css/main-style.css" rel="stylesheet" />
	<script src="${ctx }/resources/plugins/jquery-1.10.2.js"></script>
    <!-- Page-Level CSS -->
    <link href="${ctx }/resources/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet" />

</head>

<body>
    <!--  wrapper -->
    <div id="wrapper" style="color:#FFFFFF">
<<<<<<< HEAD
        <!-- navbar top -->
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation" id="navbar">
            <!-- navbar-header -->
                <a class="navbar-brand" href="index.html">
                    <img src="${ctx }/resources/img/logo.png" alt="" />
                </a>
            <!-- navbar-top-links -->
            <ul class="nav navbar-top-links navbar-right">
                <!-- main dropdown -->
                <li class="row">
                		<div class="col-xs-10" style="margin-right: 200px">
	            			<!-- search section-->
	            			<form action="${ctx }/foodtruck/searchByKeyLoc.do" method="post">
		                        <div class="input-group custom-search-form">
		                        	<input type="text" class="form-control" name="keyword" placeholder="Search" style="width:400px">
		                            <input type="text" class="form-control" name="location" placeholder="Location" style="width:400px">
		                            <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
		                        </div>
	                        </form>
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
=======


		<%@ include file="../header.jspf"%>
>>>>>>> branch '170524' of https://github.com/fooFa-the-final/foofa.git

        <!--  page-wrapper -->

                <!--End Page Header -->
            </div>

            <div class="row" style="margin-left:25%">
                <!-- Page Header -->
                <div class="col-lg-10" style="margin-top:6%; margin-bottom:4%">
                    <div class="col-sm-2">
                    	<button type="button" class="btn btn-outline btn-default" onClick="stateBtn(this)">OPEN NOW</button>
                	</div>    
                	<div class="col-md-6"> 
                    <label class="checkbox-inline">
                     <input type="checkbox" id="checkCard">카드 결제
                    </label>
                    <label class="checkbox-inline">
                     <input type="checkbox" id="checkDrinking">알콜 판매
                    </label>
                    <label class="checkbox-inline">
                     <input type="checkbox" id="checkParking">주차 가능
                    </label>
                    <label class="checkbox-inline">
                     <input type="checkbox" id="checkCatering">케이터링
                    </label>
                    </div>
                    <div class="cil-md-3">               
                     	 <select id="disabledSelect" class="form-control" style="width:15%">
                            <option>리뷰많은 순</option>
                            <option>단골많은 순</option>
                         </select>
                    </div>
                </div>
            </div>
    
    
    <div class="row">
    <div class="col-sm-2"></div>
    <div class="col-md-6">
            <table style="width:100%" id="dataTables-example">
            	<colgroup>
            		<col width="30%"/>
            		<col width="70%"/>
            	</colgroup>
            	<thead>
            		<tr></tr>
            		<tr></tr>
            	</thead>
          		<tbody>
          		<c:forEach items="${trucks }" var="truck">
          			<tr>
	          			<td rowspan="2" style="padding:10px;" align="right">
	          				<img width="130px" height="130px" src="${ctx }/resources/img/${truck.foodtruckImg }" style="margin-right:10px">
	          			</td>
	          			<td style="height:60px">
	          				<a href="${ctx }/foodtruck/"><font size="5px" color="black">${truck.foodtruckName }</font></a>&nbsp;
	          				<font size="2px">${truck.category1 }  ${truck.category2 }  ${truck.category3 }</font>
	          			</td>
          			</tr>
          			<tr>
          				<td valign="top">
          					<i class="fa fa-heart"></i> ${truck.favoriteCount } Fans<br>
          					<i class="fa fa-comment fa-fw"></i> 100 Reviews
          				</td>
          			</tr>
          		</c:forEach>	
          		</tbody>
          </table>
        </div>

       <div class="col-md-2">
			<img width="300px" height="300px" src="${ctx }/resources/img/map.jpg" >
        </div>
        <div class="col-sm-2"></div>
</div>
        <!-- end page-wrapper -->
<!-- <center><div class=conatiner>
    <a style="color:white; font-size: 30px;">1</a>
    <a style="color:white; font-size: 30px;">2</a>
    <a style="color:white; font-size: 30px;">3</a>
    <a style="color:white; font-size: 30px;">4</a>
    <a style="color:white; font-size: 30px;">5</a>

    </div></center> -->
    <!-- end wrapper -->

    <!-- Core Scripts - Include with every page -->
    <script src="${ctx }/resources/plugins/jquery-1.10.2.js"></script>
    <script src="${ctx }/resources/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="${ctx }/resources/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${ctx }/resources/plugins/pace/pace.js"></script>
    <script src="${ctx }/resources/scripts/siminta.js"></script>
    <!-- Page-Level Plugin Scripts-->
    <script src="${ctx }/resources/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="${ctx }/resources/plugins/dataTables/dataTables.bootstrap.js"></script>
    <script>
        $(document).ready(function () {
            $('#dataTables-example').dataTable();
        });
        
$("input:checkbox").on('click', function() {
      if ( $(this).prop('checked') ) {
    	  
      } else {
    	  
      }
    });
    
var stateBtn = function(obj){
	$(obj).removeClass("btn btn-outline btn-default").addClass("btn btn-success");
}

    </script>

</body>

</html>
