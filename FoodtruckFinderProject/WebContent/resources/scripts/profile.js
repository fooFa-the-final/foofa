
//favorite 수 반환
var favoriteCount = function(truckId) {
	$.ajax({
		type : 'get',
		url : "/FoodtruckFinderProject/favorite/count.do",
		data : {
			foodtruckId : truckId
		},
		success : function(data) {
			$("#followCount").html(data);
		}
	});
}

// 버튼 서식 지정
var exist = function(truckId) {
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
	console.log(truckId+" : come");
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