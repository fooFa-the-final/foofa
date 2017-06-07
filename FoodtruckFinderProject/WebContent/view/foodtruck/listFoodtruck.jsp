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
        
       	ul {  
    text-align:center;  
}  
ul li {  
    display:inline;  
    vertical-align:middle;  
}
  
ul li a {  
    display:-moz-inline-stack;  /*FF2*/  
    display:inline-block;  
    vertical-align:top;  
    padding:4px;  
    margin-right:3px;  
    width:30px !important;  
    color:#000;  
    font:bold 12px tahoma;  
    border:1px solid #eee;  
    text-align:center;  
    text-decoration:none;  
    width /**/:26px;    /*IE 5.5*/  
}  
ul li a.now {  
    color:#fff;  
    background-color:#f44;  
    border:1px solid #f40;  
}  
ul li a:hover, ul li a:focus {  
    color:#fff;  
    border:1px solid #f40;  
    background-color:#f40;  
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
		<%@ include file="../header.jspf"%>
        <!--  page-wrapper -->
    </div>
		<form id="search-with-filter" action="${ctx }/foodtruck/searchByFilter.do" method="post">
            <div class="row" style="margin-left:25%">
                <!-- Page Header -->
                <div class="col-lg-10" style="margin-top:6%; margin-bottom:4%">
                    <div class="col-sm-2">
                    	<button type="button" id="openstateBtn" name="openstateBtn" class="btn btn-outline btn-default" onClick="stateBtn(this)">OPEN NOW</button>
                    	<input type="hidden" id="openstate" name="openstate" value="">
                	</div>    
                	<div class="col-md-6"> 
                    <label class="checkbox-inline">
                   		<input type="checkbox" id="card" name="checkFilter">카드 결제
                    </label>
                    <label class="checkbox-inline">
                     	<input type="checkbox" id="drinking" name="checkFilter">알콜 판매
                    </label>
                    <label class="checkbox-inline">
                    	 <input type="checkbox" id="parking" name="checkFilter">주차 가능
                    </label>
                    <label class="checkbox-inline">
                    	 <input type="checkbox" id="catering" name="checkFilter">케이터링
                    </label>
                    </div>
                    <div class="cil-md-3">               
                     	 <select id="disabledSelect" class="form-control" style="width:15%">
                            <option>리뷰많은 순</option>
                            <option>단골많은 순</option>
                         </select>
                    </div>
                </div>
                <input type="hidden" id="keyword" name="keyword" value="${keyword }">
				<input type="hidden" id="location" name="location" value="${location }">
				<input type="hidden" id="checking" name="checking" value="">
            </div>
    
    
    <div class="row">
    <div class="col-sm-2"></div>
    <div class="col-md-6" id="searchList">
            <table style="width:100%" id="dataTables-example">
            	<colgroup>
            		<col width="30%"/>
            		<col width="70%"/>
            	</colgroup>
            	<thead>
            		<tr></tr>
            		<tr></tr>
            	</thead>
          		<tbody id="ajax-tbody-results">
          		<c:choose>
          		<c:when test="${trucks eq null || empty trucks }">
          			<tr>
          				<td align="center">해당 검색 결과가 없습니다.</td>
          			</tr>
          		</c:when>
          		<c:otherwise>
          		<c:forEach items="${trucks }" var="truck">
          			<tr>
	          			<td rowspan="2" style="padding:10px;" align="right">
	          				<img width="130px" height="130px" src="${ctx }/resources/img/${truck.foodtruckImg }" style="margin-right:10px">
	          			</td>
	          			<td style="height:60px">
	          				<a href="${ctx }/review/list/truck.do?foodtruckId=${truck.foodtruckId }"><font size="5px" color="black">${truck.foodtruckName }</font></a>&nbsp;
	          				<font size="2px">${truck.category1 }  ${truck.category2 }  ${truck.category3 }</font><br>
	          				<font size="2px">${truck.spot }</font>
	          			</td>
          			</tr>
          			<tr>
          				<td valign="top">
          					<i class="fa fa-heart"></i> ${truck.favoriteCount } Fans<br>
          					<i class="fa fa-comment fa-fw"></i> 100 Reviews
          				</td>
          			</tr>
          		</c:forEach>
          		</c:otherwise>
          		</c:choose>	
          		</tbody>
          </table>
        </div>

       <div class="col-md-2">
			<img width="300px" height="300px" src="${ctx }/resources/img/map.jpg" >
        </div>
        <div class="col-sm-2"></div>
</div>
<div class="col-lg-12" id="pagingArea" style="text-align:center; margin-bottom:100px; margin-top:50px">
	<input type="hidden" id="currentIndex" value="${currentIndex }">
	<input type="hidden" id="allCount" value="${allCount }">
</div>
</form>
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
    
    $(document).ready(function() {
    	
    	var allCount = $("#allCount").val();
    	var rowCount = 10;
    	var totalIndex = Math.ceil(allCount/rowCount);
    	var firstIndex = "";
    	var lastIndex = "";
    	
    	var currentIndex = $("#currentIndex").val();
    	
    	if(currentIndex == "" || currentIndex == 1){
    		firstIndex = 1;
    		currentIndex = 1;
    	}
    	
    	if(totalIndex <= 10){
    		lastIndex = totalIndex;
    	} else if(firstIndex == 1 && totalIndex > 10){
    		lastIndex = 10;
    	} else {
    		lastIndex = Math.ceil(currentIndex/10)*10;
    		firstIndex = lastIndex - 9;
    		if(lastIndex > totalIndex){
    			lastIndex = totalIndex;
    		}
    	}
    	
    	var pagingHtml = "";
    	var prePagingHtml = "";
    	var postPagingHtml = "";
    	
    	for(var i = firstIndex; i <= lastIndex; i++){
    		if(i == currentIndex){
    			pagingHtml += "<span onclick='movePage(" + i + ")' style='cursor:pointer;'><b>" + "[" + i + "]" + "</b></span>"
    		} else {
    			pagingHtml += "<span onclick='movePage(" + i + ")' style='cursor:pointer;'>" + "[" + i + "]" + "</span>"
    		}
    	}

    	if(currentIndex != 1){
    		prePagingHtml += "<span onclick='movePage(1)' style='cursor:pointer;'>[<<]</span>";
    		var pageBefore = firstIndex - 1;
    		if(pageBefore < 1){
    			pageBefore = 1;
    		}
    		prePagingHtml +="<span onclick='movePage(" + pageBefore + ")' style='cursor:pointer;'>[<]</span>"
    	}
    	if(currentIndex != totalIndex){
    		var Pageafter = lastIndex + 1;
    		if(pageAfter > totalIndex){
    			pageAfter = totalIndex;
    		}
    	}
    	if(currentIndex != totalIndex){
    		var pageAfter = lastIndex + 1;
    		if(pageAfter > totalIndex){
    			pageAfter = totalIndex;
    		}
    		postPagingHtml += "<span onclick='movePage(" + pageAfter + ")' style='cursor:pointer;'>[>]</span>";
    		postPagingHtml += "<span onclick='movePage(" + totalIndex + ")' style='cursor:pointer;'>[>>]</span>"
    	}
    	
    	$("#pagingArea").empty();
    	$("#pagingArea").append(prePagingHtml + pagingHtml + postPagingHtml);
    	
    	var card = "${card}";
    	var drinking = "${drinking}";
    	var parking = "${parking}";
    	var catering = "${catering}";
    	var openstate = "${openState}";
    	
    	if(card=="true"){
    		$("#card").prop('checked', true);
    	}
    	if(drinking=="true"){
    		$("#drinking").prop('checked', true);
    	}
    	if(parking=="true"){
    		$("#parking").prop('checked', true);
    	}
    	if(catering=="true"){
    		$("#catering").prop('checked', true);
    	}
    	if(openstate=="true"){
    		$("#openstateBtn").removeClass("btn btn-outline btn-default").addClass("btn btn-success");
    		$("#openstate").val("true");
    	}
	});
    
    var movePage = function(pageNum) {
		$("#currentIndex").val(pageNum);
		window.location = '${ctx}/foodtruck/searchByKeyLoc.do?keyword=${keyword}&location=${location}&currentIndex=' + pageNum + '';
	}
    
	
	$(":checkbox").change(function() {
	    var notChecked = [], checked = [];
	    $(":checkbox").map(function() {
	        this.checked ? checked.push(this.id) : notChecked.push(this.id);
	    });
	    var checked2 = "";
	    for(var a=0; a<checked.length; a++){
	    	checked2 += checked[a] + "/";
	    }
// 	    alert(checked2);
	    $("#checking").val(checked2);
	    $("#search-with-filter").submit();
	});
	    
	
	var stateBtn = function(obj){
		var notChecked = [], checked = [];
	    $(":checkbox").map(function() {
	        this.checked ? checked.push(this.id) : notChecked.push(this.id);
	    });
	    var checked2 = "";
	    for(var a=0; a<checked.length; a++){
	    	checked2 += checked[a] + "/";
	    }
	    $("#checking").val(checked2);
		
		if($(obj).hasClass("btn btn-outline btn-default")){
			$(obj).removeClass("btn btn-outline btn-default").addClass("btn btn-success");
			$("#openstate").val("true");
			$("#search-with-filter").submit();
		} else {
			$(obj).removeClass("btn btn-success").addClass("btn btn-outline btn-default");
			$("#openstate").val("");
			$("#search-with-filter").submit();
		}
	}
	
	
    </script>
    
</body>

</html>
