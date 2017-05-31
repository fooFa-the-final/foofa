<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<c:set value="${pageContext.request.contextPath}" var="ctx" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FOODTRUCK FINDER</title>
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
     <div id="wrapper">
		
		<%@ include file="../header.jspf"%>

        <!-- navbar side -->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <!-- sidebar-collapse -->
            <div class="sidebar-collapse">
                <!-- side-menu -->
                <ul class="nav" id="side-menu">
                    <li >
                        <a href="${ctx }/review/report/list.do"><i class="fa fa-dashboard fa-fw"></i>신고 관리 </a>
                    </li>
                     <li class="selected">
                        <a href="${ctx }/survey/item/list.do"><i class="fa fa-flask fa-fw"></i>설문조사 관리</a>
                    </li>
                    <li>
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
                    <h1 class="page-header">설문조사 관리</h1>
                </div>
                <!--End Page Header -->
            </div>
			<div class="row">
                <div class="col-lg-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">  
                    	<div class="panel-heading">  설문 조사 항목</div>
                 	    <div class="panel-body">
                            <div id="itemTableDiv" class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="itemTable" >
                                    <thead>
                                        <tr>
                                            <th class="text-center">Question</th>
                                            <th class="text-center">수정</th>
                                            <th class="text-center">삭제</th>
                                        </tr>
                                    </thead>
                                    <tbody style="vertical-align:middle">
                                    	<c:forEach var="item" varStatus="no" items="${items }">
                                          <tr class="odd gradeX">
                                            <td>${item.question }</td>
                							<td class="text-center"> <button type="button" class="btn btn-warning" onclick="modifyItem('${item.itemId}', '${item.question}');">수정</button></td>
                   					         <td class="text-center"><button type="button" class="btn btn-danger" onclick="deleteItem('${item.itemId}');">삭제</button></td>
                                           </tr>                                  	
                                    	</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                    <!--End Advanced Tables -->

                        </div>
                    </div>
                    
                    <!-- Add Item -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                             설문 조사 항목 추가
                        </div>
                        <div class="panel-body">
                        	  <div class="row">
                                <div class="col-lg-6">
                                        <div class="form-group">
                                            <input name="question" class="form-control size80"> <button type="button" class="btn btn-danger btn-circle" onclick="registerItem();"><i class="fa fa-check"></i>
                          				  </button>
                                            <p class="help-block">새로 추가할 항목을 입력하세요!</p>
                                        </div>
                        		</div>
                        		</div>
                        		<!--  End Add Item -->
                        		</div>
                        		</div>
                </div>
			</div>
        </div>
        <!-- end page-wrapper -->

    </div>
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
            $('#itemTable').dataTable();

        });
        
        var setDataTable = function(){
        	 $('#itemTable').dataTable();
        };
        var registerItem = function(){
        	var question = $("input[name=question]").val();
        	var id = $("input[name=question]").attr('id');
        	
        	if(id == "" || id == "undefined"){
        		$.ajax({
				url:"${ctx}/survey/item/create.do"
					,type:"get"
					,data:{question:question}
					,success:displayItems
					,error:errorCallback
				});
        		
        	}else {
        		$.ajax({
    				url:"${ctx}/survey/item/modify.do"
    					,type:"get"
    					,data:{itemId:id, question:question}
    					,success:displayItems
    					,error:errorCallback
    				});
        	}
        	
        };  
        var modifyItem = function(itemId, question){
        	$("input[name=question]").val(question);
        	$("input[name=question]").attr("id",itemId);
   	
        };       
        var deleteItem = function(surveyItemId){
			$.ajax({
				url:"${ctx}/survey/item/remove.do"
				,type:"get"
				,data:{surveyItemId:surveyItemId}
				,success:displayItems
				,error:errorCallback
			});       	
        };
        
        
        var displayItems = function(resultData){
            
        	var itemsHtml = "";    				
        	itemsHtml += '<table class="table table-striped table-bordered table-hover" id="itemTable" ><thead><tr><th class="text-center">Question</th><th class="text-center">수정</th><th class="text-center">삭제</th></tr></thead> <tbody style="vertical-align:middle">';

			$.each(resultData, function(index, item){
				itemsHtml += '<tr class="odd gradeX">';
				itemsHtml += '<td>'+item.question+'</td>';
				itemsHtml += '<td class="text-center"> <button type="button" class="btn btn-warning" onclick="modifyItem(';
				itemsHtml += "'"+item.itemId+"', '"+item.question+"');"+'">수정</button></td>';
				itemsHtml += '<td class="text-center"><button type="button" class="btn btn-danger" onclick="deleteItem('+"'"+item.itemId+"'"+');">삭제</button></td>';
				itemsHtml += '</tr>';
			});
			itemsHtml += '</tbody></table>';
			
			$("#itemTableDiv").empty();
			$("#itemTableDiv").append(itemsHtml);
			$("input[name=question]").val("");   
			setDataTable();
        };
        
		var errorCallback = function() {
			alert("수행중 오류가 발생했습니다.");
		};
    </script>

</body>
</html>