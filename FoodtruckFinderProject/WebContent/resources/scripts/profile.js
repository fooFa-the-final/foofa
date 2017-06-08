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
}

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
}
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
}

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
}