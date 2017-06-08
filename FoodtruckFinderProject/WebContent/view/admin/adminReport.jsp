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

    <script src="${ctx}/resources/plugins/jquery-1.10.2.js"></script>
    <!-- Page-Level CSS -->
    <link href="${ctx}/resources/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
	<script>		
		
		var reportList = function(reviewId){
			$.ajax({
    			type: 'get',
    			url: "${ctx}/report/list.do",
    			data: {
    				reviewId : reviewId
    			},
    			success : function(data){
    				/* var id = "#report" + reviewId;
    				for(var i=0;i<data.length;i++){
    					console.log(data[i].reviewId);
    				} */
    				var contents = data;
    				var modalId = "#myModal" + reviewId;
    				var mContentId = "#modalCons" + reviewId;
    				var reportHtml = "<input type='button' id = 'rep"+reviewId+"' value='" + data.length + "' + style='border:0;background-color:transparent'>"
    				$("#report" + reviewId).html(reportHtml);
    				var reportContents = "";
    				for(var i=0;i<contents.length;i++)
    					reportContents += contents[i].memberId + " : " + contents[i].reason + "<br>";
    				$(mContentId).append(reportContents);
    				$("#rep"+reviewId).click(function(){
    					$(modalId).modal();
    				});
    			}
    		});	
		}

		var pass = function(reviewId){
			$.ajax({
    			type: 'get',
    			url: "${ctx}/review/report/remove.do",
    			data: {
    				reviewId : reviewId
    			},
    			success : function(data){
    				var trId = "#tr" + reviewId;
    				console.log(trId);
    				$(trId).remove();
    				alert("신고처리가 완료되었습니다.");
    			}
    		});	
			$('#dataTables-example').dataTable();
		}
		
		var del = function(reviewId){
			$.ajax({
    			type: 'get',
    			url: "${ctx}/review/reported/remove.do",
    			data: {
    				reviewId : reviewId
    			},
    			success : function(data){
    				var trId = "#tr" + reviewId;
    				console.log(trId);
    				$(trId).remove();
    				alert("신고처리가 완료되었습니다.");
    			}
    		});
			$('#dataTables-example').dataTable();
		}
	</script>
</head>

<body>
    <!--  wrapper -->
    <div id="wrapper">
		
		<%@ include file="../header.jspf"%>

		<%@ include file="../include/adminLeft.jspf"%>
		
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
	                                        <tr class="odd gradeX" id = "tr${review.reviewId }">
	                                            <td>${status.count }</td>
	                                            <td class="center">${review.contents }</td>
	                                            <td class="center">${review.writer.memberId }</td>
	                                            <td class="center" id="report${review.reviewId }">
	                                            	<script>
		                                            	reportList("${review.reviewId}");
	                                            	</script>
	                                            </td>
	                                			<td><button type="button" class="btn btn-primary" onclick = "pass('${review.reviewId}')">PASS</button><button type="button" class="btn btn-danger" onclick="del('${review.reviewId}')">DELETE</button></td>
	                                        </tr>
	                                       <!-- Modal -->
								  	<div class="modal fade" id="myModal${review.reviewId }" role="dialog">
								    <div class="modal-dialog">
								      <!-- Modal content-->
								      <div class="modal-content">
								        <div class="modal-header">
								          <button type="button" class="close" data-dismiss="modal">&times;</button>
								          <h4 class="modal-title">접수된 신고 이유</h4>
								        </div>
								        
								        <div class="modal-body" id = "modalCons${review.reviewId }">
								           	<h4>신고 된 리뷰 내용 : ${review.contents }</h4>
								          
								        </div>
								        <div class="modal-footer">
								          <input type="button" class="btn btn-default" data-dismiss="modal" value="닫기">
								        </div>
								      </div>
								      
								    </div>
								  </div>
                                        </c:forEach>
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
			$('#side-report').attr('class', 'selected');
        });
    </script>

</body>
</html>