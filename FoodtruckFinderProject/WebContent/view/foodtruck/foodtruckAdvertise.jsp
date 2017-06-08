<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<c:set value="${pageContext.request.contextPath}" var="ctx" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>foodtruckAdvertise</title>
<!-- Core CSS - Include with every page -->
<link href="${ctx}/resources/plugins/bootstrap/bootstrap.css"
	rel="stylesheet" />
<link href="${ctx}/resources/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<link href="${ctx}/resources/plugins/pace/pace-theme-big-counter.css"
	rel="stylesheet" />
<link href="${ctx}/resources/css/style.css" rel="stylesheet" />
<link href="${ctx}/resources/css/main-style.css" rel="stylesheet" />

<!-- Page-Level CSS -->
<link
	href="${ctx}/resources/plugins/dataTables/dataTables.bootstrap.css"
	rel="stylesheet" />

</head>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<script>

$(document).ready(function(){
    $("form").submit(function(){
		var st = $(":input:radio[name=period]:checked").val();
    	var today = new Date();  
    	var dateString =  $("input[name='startdate']").val();
    	var dateArray = dateString.split("-");  
    	var dateObj = new Date(dateArray[0], Number(dateArray[1])-1, dateArray[2]);  
    	var betweenDay = (today.getTime() - dateObj.getTime());  
	        if($("input[name='startdate']").val() == ""){
            $("input[name='startdate']").css("border", "1px solid red").after("<span>날짜를 입력해주세요.</span>");
            $("span").css("color", "red").fadeOut(3000);
            return false;
        	} else if(betweenDay > 0){
                $("input[name='startdate']").css("border", "1px solid red").after("<span>광고시작 날짜는 지난 날짜를 선택할 수 없습니다.</span>");
                $("span").css("color", "red").fadeOut(3000); 				
 				return false;       		
        	}else if (st == null){
            	var sel_type = null;
            	var chk_radio = document.getElementsByName('period');
            	for(var i=0;i<chk_radio.length;i++){
            		if(chk_radio[i].checked == true){ 
            			sel_type = chk_radio[i].value;
            		}
            	}
            	if(sel_type == null){
                	$("input[name='result']").css("border", "1px solid red").after("<span>기간을 선택해 주세요.</span>");
                    $("span").css("color", "red").fadeOut(3000);
            		return false;
            	}
        	} 
    });   
});
</script>

<body>
	<!--  wrapper -->
	<div id="wrapper">
		<%@ include file="../header.jspf"%>
		<%@ include file="../include/sellerLeft.jspf"%>
		<!--  page-wrapper -->
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default"
						style="margin-top: 15px; height: 320px;">
						<div class="panel-body">
							<span> <a class="navbar-brand" href="#"
								style="margin-top: 10px;"> <img
									src="${ctx }/resources/img/${truck.foodtruckImg}"
									style="height: 250px; width: 250px" />
							</a>
							</span>
							<div class="user-info">
								<h1>${truck.foodtruckName }</h1>
								<br>
								<h5>${truck.category1 }</h5>
								<h5>${truck.location }</h5>
								<h5>단골수:&nbsp;&nbsp; ${truck.favoriteCount }</h5>
								<h5>리뷰수:&nbsp;&nbsp; ${truck.reviewCount }</h5>
							</div>
							<%-- 
							<span style="float: right; margin-right: 30px; margin-top: 30px">
								<a href="${ctx }/seller/modify.do"><button type="button"
										class="btn btn-default" onclick="${ctx}/seller/modify.do">판매자정보 수정</button></a> <a href="${ctx }/seller/remove.do">
										<button type="button" class="btn btn-default">판매자 탈퇴</button></a>
							</span>
							 --%>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<!-- Advanced Tables -->
					<div class="panel panel-default">
						<div class="panel-body">
							<form action="${ctx }/foodtruck/reqest.do" method="post">
								<input type="hidden" name="sellerId" value="${truck.sellerId }">
								<h2 style="border-bottom: 1px solid #eee">광고 요청</h2>
								<p>광고는 요청된 기간동안 메인페이지와 검색결과 상단에 무작위로 노출됩니다.</p>
								<br />
								<div class="form-group">
									<h4>
										- 광고 시작일 <small> 광고 시작일을 선택해주세요.</small>
									</h4>
									<input id="startdate" name="startdate" type="date" data-date-inline-picker="true" style="margin-left: 20px" />
								</div>
								<br />
								<h4>
									- 광고 기간 <small> 광고 기간을 선택해주세요. </small>
								</h4>
								<p></p>
								<div class="form-group" style="margin-left: 20px">
									<label class="radio-inline"> <input type="radio"
										name="period" value="3">3 일
									</label> <label class="radio-inline"> <input type="radio"
										name="period" value="7">7 일
									</label> <label class="radio-inline"> <input type="radio"
										name="period" value="14">14 일
									</label> <label class="radio-inline"> <input type="radio"
										name="period" value="30">30 일
										<input type="hidden" name="result">
									</label>
								</div>

								<div class="col-lg-6" style="display: block">
									<div class=" alert alert-warning">
										<p>요청이 많으면 광고가 지연될 수 있습니다. 문의사항은 관리자에게 연락주세요.</p>
										<p>항상 최상의 서비스를 선사하는 FOOFA 되겠습니다. 감사합니다.</p>
									</div>
								</div>
								<div style="width: 100%; height: 90px;"></div>
								<button type="button" class="btn btn-primary btn-lg" aria-expanded="true"
											data-toggle="modal" data-target="#myModal"
									>결제</button>
								<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
									aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-hidden="true">&times;</button>
												<h4 class="modal-title" id="myModalLabel">광고 결제</h4>
											</div>
											<div class="modal-body">정말로 결제를 하시겠습니까?</div>
											<div class="modal-footer">
												<button type="submit" class="btn btn-primary btn-lg" aria-expanded="true">결제하기</button>
											<button type="button" class="btn btn-default"
													data-dismiss="modal">취소하기</button>
											
											</div>
										</div>
									</div>
								</div>
							</form>
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
	<script
		src="${ctx}/resources/plugins/dataTables/dataTables.bootstrap.js"></script>
	<script>
		$(document).ready(function() {
			$('#dataTables-example').dataTable();
			$('#side-adv').attr('class', 'selected');
		});
	</script>

</body>
</html>