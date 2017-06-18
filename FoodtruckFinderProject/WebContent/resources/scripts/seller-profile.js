//favorite 수 반환
var favoriteCount = function(truckId) {
	$.ajax({
		type : 'get',
		url : "/FoodtruckFinderProject/favorite/count.do",
		data : {
			foodtruckId : truckId
		},
		success : function(data) {
			$("#favoriteCount").html(data);
		}
	});
};

// 버튼 서식 지정
var favoriteExist = function(truckId) {
	console.log("ajwl22");
	$.ajax({
		type : 'get',
		url : "/FoodtruckFinderProject/favorite/exist.do",
		data : {
			foodtruckId : truckId
		},
		success : function(data) {
			if (data) {
				$("#favoriteBtn").attr('class',
						'btn btn-danger btn-circle btn-lg');
			} else {
				$("#favoriteBtn").attr('class',
						'btn btn-default btn-circle btn-lg');
			}
		}
	});
};
// favorite : unfavorite
var favorite = function(truckId) {
	console.log(truckId + " : come");
	var btn = $("#favoriteBtn");
	var classN = btn.attr('class');
	var url = "";

	if (classN == "btn btn-default btn-circle btn-lg") {
		url = "/FoodtruckFinderProject/favorite/create.do";
		classN = "btn btn-danger btn-circle btn-lg";
	} else {
		url = "/FoodtruckFinderProject/favorite/remove.do";
		classN = "btn btn-default btn-circle btn-lg";
	}

	$.ajax({
		type : 'GET',
		url : url,
		data : {
			foodtruckId : truckId
		},
		success : function(data) {
			if (data) {
				btn.attr("class", classN);
			}
		}
	});
	favoriteCount(truckId);
};

// 팔로우
var follow = function(memberId) {
	var btn = $("#followBtn");
	var classN = btn.attr('class');
	var url = "";

	if (classN == "btn btn-default btn-circle btn-lg") {
		url = "/FoodtruckFinderProject/follow/create.do";
		classN = "btn btn-danger btn-circle btn-lg";
	} else {
		url = "/FoodtruckFinderProject/follow/remove.do";
		classN = "btn btn-default btn-circle btn-lg";
	}

	$.ajax({
		type : 'GET',
		url : url,
		data : {
			toId : memberId
		},
		success : function(data) {
			if (data) {
				btn.attr("class", classN);
			}
		}
	});
	followCount(memberId);
};

// 팔로우 존재 확인
var followExist = function(memberId) {
	$.ajax({
		type : 'get',
		url : "/FoodtruckFinderProject/follow/exist.do",
		data : {
			toId : memberId
		},
		success : function(data) {
			if (data) {
				$("#followBtn").attr('class',
						'btn btn-danger btn-circle btn-lg');
			} else {
				$("#followBtn").attr('class',
						'btn btn-default btn-circle btn-lg');
			}
		}
	});
};

//follow 수 반환
var followCount = function(memberId) {
	$.ajax({
		type : 'get',
		url : "/FoodtruckFinderProject/follow/count.do",
		data : {
			toId : memberId
		},
		success : function(data) {
			$("#followCount").html(data);
		}
	});
};

//truck state 확인
var stateCheck = function(state){
	if(state=="true"){
		$("#openstateBtn").removeClass("btn btn-outline btn-default").addClass("btn btn-success");
		$("#openstateBtn").val("OPEN NOW");
	}
	if(state=="false"){
		$("#openstateBtn").removeClass("btn btn-success").addClass("btn btn-outline btn-default");
		$("#openstateBtn").val("CLOSED");
	}
};

//truck state 변경
var stateBtn = function(obj){
	var openState = $("#openstate").val();
	
	if($(obj).hasClass("btn btn-outline btn-default")){
		$(obj).removeClass("btn btn-outline btn-default").addClass("btn btn-success");
		$("#openstate").val("true");
		$("#openstateBtn").val("OPEN NOW");
	} else {
		$(obj).removeClass("btn btn-success").addClass("btn btn-outline btn-default");
		$("#openstate").val("false");
		$("#openstateBtn").val("CLOSED");
	}
	$.ajax({
		 url: '/FoodtruckFinderProject/foodtruck/modifyState.do',
	     data: {operation_state: openState},
	     type: 'get',
	     success: function(result){
	    	 
	    	 if($("#openstate").val() == 'false'){
		         alert("영업이 종료되었습니다! 오늘의 매출을 입력해주세요!^^!");
		         location.href='/FoodtruckFinderProject/sales/truck.do';
	    	 }else {
		         alert("영업을 시작합니다!");
	    	 }
	         
	     },
	     error: function(){
	     	alert("영업상태 변경을 실패하였습니다. 다시 시도해주세요.");
	     }
	});
};

//푸드트럭 사진 변경 
var fileinfo = function(input){
  	if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
                $("#image").attr("src", e.target.result);
            }
        reader.readAsDataURL(input.files[0]);
    }
  	$("#fileForm").ajaxForm({
  		url:"/FoodtruckFinderProject/foodtruck/modifyPicture.do",
  		enctype: "multipart/form-data",
  		success: function(result){
  			alert("사진이 등록되었습니다.");
  		},
  		error: function(){
  			alert("등록에 실패하였습니다. 다시 시도해주세요.")
  		}
  	});
  	$("#fileForm").submit();
};
