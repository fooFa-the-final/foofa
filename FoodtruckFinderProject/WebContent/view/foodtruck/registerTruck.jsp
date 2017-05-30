<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Foodtruck Finder</title>
<!-- Core CSS - Include with every page -->
<script src="${ctx }/resources/plugins/jquery-1.10.2.js"></script>
<link href="${ctx }/resources/plugins/bootstrap/bootstrap.css" 	rel="stylesheet" />
<link href="${ctx }/resources/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href="${ctx }/resources/plugins/pace/pace-theme-big-counter.css" rel="stylesheet" />
<link href="${ctx }/resources/css/style.css" rel="stylesheet" />
<link href="${ctx }/resources/css/main-style.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="${ctx }/resources/css/jquery.timepicker.css"/>
<script src="${ctx }/resources/plugins/timepicker/jquery.timepicker.js"></script>
<script>
$(document).ready(function(){
    $('#startTime').timepicker();
    $('#endTime').timepicker();
});

var c = 0;
var registMenu = function(){
	var comHtml = "";
	var count = c++;
	comHtml += '<tr class="odd gradeX">';
	comHtml += '<td></td><td align="left" id="menuName'+ (count) +'" name="menuName">'+ $("#menuName").val() +'</td>';
	comHtml += '<td align="left" id="menuPrice'+ (count) +'" name="menuPrice">'+ $("#menuPrice").val() +'</td>';
	comHtml += '<td id="menuState'+ (count) +'" name="menuPrice">'+ $("#menuState").val() +'</td>';
	comHtml += '<td>';
// 	comHtml += '<button type="button" class="btn btn-default btn-circle" onClick="modifyMenu(this)"><i class="fa fa-pencil"></i></button>';
    comHtml += '<button type="button" class="btn btn-danger btn-circle" onClick="removeMenu(this)"><i class="fa fa-times"></i></button>';
    comHtml += '</td>';
    comHtml += '</tr>';
	$('#menus tr:last').before(comHtml);
	
	$('#menus tr:last').find("input[name^=menuName]").val("").end();
	$('#menus tr:last').find("input[name^=menuPrice]").val("").end();
	$('#menus tr:last').find("select[name^=menuState]").val("판매중").end();
}

var removeMenu = function(obj){
	var removeThis = $(obj).parent().parent();
    removeThis.remove();
}

// var modifyMenu = function(obj){
// 	var modifyThis = $(obj).parent().parent();
// 	modifyThis.
// }

</script>

</head>
<body>
	<header> <%@ include file="../header.jspf"%>
	</header>
	<!--  wrapper -->
	<div id="wrapper">
		<!-- navbar top -->
		<nav class="navbar navbar-default navbar-fixed-top" role="navigation" id="navbar"> 
		
		<!-- navbar-header --> 
		<a class="navbar-brand" href="index.html"> <img src="${ctx }/resources/img/logo.png" alt="" /> </a> 
		
		<!-- navbar-top-links -->
		<ul class="nav navbar-top-links navbar-right">
			<!-- main dropdown -->
			<li class="row">
				<div class="col-xs-10" style="margin-right: 200px">
					<!-- search section-->
					<div class="input-group custom-search-form">
						<input type="text" class="form-control" placeholder="Search"
							style="width: 400px"> <input type="text"
							class="form-control" placeholder="Location" style="width: 400px">
						<button class="btn btn-default" type="button">
							<i class="fa fa-search"></i>
						</button>
					</div>
					<!--end search section-->
				</div>
			</li>
			<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"> <i class="fa fa-user fa-3x"></i> </a> 
			
			<!-- dropdown user-->

				<ul class="dropdown-menu dropdown-user">
					<li><a href="#"><i class="fa fa-user fa-fw"></i>User Profile</a></li>
					<li><a href="#"><i class="fa fa-gear fa-fw"></i>Settings</a></li>
					<li class="divider"></li>
					<li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i>Logout</a>
					</li>
				</ul> <!-- end dropdown-user --></li>
			<!-- end main dropdown -->
		</ul>
		<!-- end navbar-top-links --> </nav>
		<!-- end navbar top -->

	</div>
	<!--  page-wrapper -->
	<div class="wrap-center container"  style="margin-top:120px">
				<form action="${ctx }/foodtruck/create.do" method="post">
                      <div class="col-lg-12">
                          <div class="panel panel-default">
                            <div class="panel-heading">
                                <h1>푸드트럭 등록</h1>
                            </div>
                            <div class="panel-body">
                                <div class="col-lg-10">
                                	<div class="form-group">
										<label>Name of Foodtruck</label> 
										<input type="text" class="form-control" placeholder="Required" style="width:500px">
									</div>
										<span class="form-group">
											<label>Category1</label> <input class="form-control" type="text" placeholder="Required" style="width:200px">
										</span>
										<span class="form-group">
											<label>Category2</label> <input class="form-control" type="text" placeholder="Optional" style="width:200px">
										</span>
										<span class="form-group"> 
											<label>Category3</label> <input class="form-control" type="text" placeholder="Optional" style="width:200px">
										</span>
                                	<div class="form-group">
                                		<label>Hours</label>
                                			<div class="panel-body">
				                                 <input id="startTime" type="text" class="time ui-timepicker-input" autocomplete="off" size="8"> 부터 
				                                 <input id="endTime" type="text" class="time ui-timepicker-input" autocomplete="off" size="8"> 까지
				                                <!--Time Picker 사용하는 방법 알아보고 적용할 것-->
				                            </div>
                                	</div>
                                	<div class="form-group">
                                		<label>Location</label> 
                                		<input type="text" class="form-control" placeholder="Required" style="width:500px">
                                	</div>
                                	<div class="form-group">
                                		<label>Payment</label>&nbsp;
                                		<label class="radio-inline">
                                			<input type="radio" name="paymentMethod" id="takesCard" value="true">Takes Card
                                		</label>
                                		<label class="radio-inline">
                                			<input type="radio" name="paymentMethod" id="onlyCash" value="false">Only Cash
                                		</label>
                                	</div>
                                	<div class="form-group">
		                                <table class="table table-striped table-bordered table-hover" id="menus" style="width:900px">
		                                    <thead>
		                                        <tr>
		                                            <th></th>
		                                            <th > Menu </th>
		                                            <th> Price </th>
		                                            <th> State </th>
		                                            <th width="90px"></th>
		                                        </tr>
		                                    </thead>
		                                    <tbody align="center">
		                                         <tr class="odd gradeX">
		                                            <td></td> 
		                                            <td align="left"><input id="menuName" name="menuName" type="text" placeholder="메뉴 명"></td>
		                                            <td align="left"><input id="menuPrice" name="menuPrice" type="number" placeholder="메뉴 가격"></td>
		                                            <td>
		                                                <select id="menuState" name="menuState">
		                                                    <option value="판매중">판매중</option>
		                                                    <option value="매진">매진</option>
		                                                </select>
		                                            </td>
		                                            <td align="center">
		                                                <button type="button" class="btn btn-primary btn-circle" onClick="registMenu()"><i class="fa fa-plus"></i></button>
		                                            </td>
		                                        </tr>
		                                    </tbody>
		                                </table>
		                            </div>
										
								</div>
                            </div>
                          </div>
                      </div>
                     <div class="col-lg-12" align="center" style="margin-top:100px">
						<button type="submit" class="btn btn-primary">ADD</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- Core Scripts - Include with every page -->
	
	<script src="${ctx }/resources/plugins/bootstrap/bootstrap.min.js"></script>
	<script src="${ctx }/resources/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="${ctx }/resources/plugins/pace/pace.js"></script>
	<script src="${ctx }/resources/scripts/siminta.js"></script>

</body>
</html>