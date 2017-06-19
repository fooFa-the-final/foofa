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

	if (classN == "btn btn-default") {
		url = "/FoodtruckFinderProject/favorite/create.do";
		classN = "btn btn-danger btn-lg";
	} else {
		url = "/FoodtruckFinderProject/favorite/remove.do";
		classN = "btn btn-default btn-lg";
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
		classN = "btn btn-danger btn-lg";
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
				console.log("end");
				followCount(memberId);
			}
		}
	});
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
						'btn btn-default btn-circle  btn-lg');
			}
		}
	});
};

// follow 수 반환
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
	console.log("123");
};

// 미리보기
var previewImage = function(target, idNo) {
	$("#" + idNo).attr('src', target);
	var targetDiv = document.getElementById(idNo);
	var src = target;
};

//리뷰 추천하기
var recReview = function(reviewId) {

	$.ajax({
		type : 'get',
		url : "/FoodtruckFinderProject/review/recommand.do",
		data : {
			reviewId : reviewId
		},
		success : function(data) {
			var revId = "#rec" + reviewId;
			var recCount = eval($(revId).text());
			$(revId).text("");
			if ($.trim(data) == 'true') {
				$(revId).text(recCount + 1);
				alert("리뷰를 추천하셨습니다.");
			} else if ($.trim(data) == 'false') {
				$(revId).text(recCount - 1);
				alert("리뷰를 추천 해제 하셨습니다.")
			}
		}
	});
};

//리뷰 신고하기
var report = function(reviewId) {
	var reaId = "#reason" + reviewId;
	var name = "reason" + reviewId
	var st = $(":input:radio[name='" + name + "']:checked").val();
	$.ajax({
		type : 'POST',
		url : "/FoodtruckFinderProject/review/report/create.do",
		data : {
			reviewId : reviewId,
			reason : st
		},
		success : function(data) {
			if ($.trim(data) == 'true') {
				alert("신고 등록이 완료되었습니다.");
			} else if ($.trim(data) == 'false') {
				alert("이미 신고된 리뷰입니다.");
			}
		}
	});
};