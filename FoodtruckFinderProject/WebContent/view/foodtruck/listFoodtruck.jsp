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

    <!-- Page-Level CSS -->
    <link href="${ctx }/resources/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet" />

</head>

<body>
    <!--  wrapper -->
    <div id="wrapper" style="color:#FFFFFF">


		<%@ include file="../header.jspf"%>

        <!--  page-wrapper -->

                <!--End Page Header -->
            </div>

            <div class="row" style="margin-left:25%">
                <!-- Page Header -->
                <div class="col-lg-10" style="margin-top:6%; margin-bottom:4%">
                    <div class="col-sm-2">
                    	<button type="button" class="btn btn btn-warning">OPEN NOW</button>
                	</div>    
                	<div class="col-md-6"> 
                    <label class="checkbox-inline">
                     <input type="checkbox">카드 결제
                    </label>
                    <label class="checkbox-inline">
                     <input type="checkbox">알콜 판매
                    </label>
                    <label class="checkbox-inline">
                     <input type="checkbox">주차 가능
                    </label>
                    <label class="checkbox-inline">
                     <input type="checkbox">케이터링
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
            <table>
            	<colgroup>
            		<col width="30%"/>
            		<col width="70%"/>
            	</colgroup>
            	<thead>
            		<tr></tr>
            		<tr></tr>
            	</thead>
          		<tbody>
          			<tr>
	          			<td rowspan="3">
	          				<img width="150px" height="150px" src="../../resources/img/pizzahut.png" style="margin-right:10px">
	          			</td>
          			</tr>
          			<tr>
          				<td rowspan="1">a</td>
          				<td rowspan="1">a</td>
          				<td rowspan="1">a</td>
          			</tr>
          		</tbody>
          </table>
        </div>

       <div class="col-md-2">
			<img width="300px" height="300px" src="../../resources/img/map.jpg" >
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
