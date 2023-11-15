


function attIn() {
	let empName = $('#empName').val();
	
	let result = confirm(empName + "님, 현재 시간으로 출근하시겠습니까?")
	
	if(result === true) {
		const TIME_ZONE = 9 * 60 * 60 * 1000; // 9시간
		let nowDate = new Date(new Date().getTime() + TIME_ZONE).toISOString().replace('T', ' ').slice(0, -5);
		let username = $("#username").val();
	
		console.log(nowDate);
		
		var param = { "attIn" : nowDate,
					"username" : username }
		
	    $.ajax({
	        url: "/attendance/attIn",
	        type: "POST",
	        data: JSON.stringify(param),
	        contentType: "application/json",
	        success: function(data) {
	        	confirm(empName + "님의 출근처리가 완료되었습니다!\n오늘도 좋은 하루되세요!");
				console.log(data);
				location.href="/attendance/list";	
	        },
	        error: function(error) {
	        	confirm("에러가 발생했습니다.\n관리자에게 문의해주세요.");
	            console.log("Error:", error);
	        }
	    })		
	} else {
		return;
	}
}



function attOut() {
	let result = confirm("현재 시간으로 퇴근하시겠습니까?");
	
	if(result === true) {
		const TIME_ZONE = 9 * 60 * 60 * 1000; // 9시간
		let nowDate = new Date(new Date().getTime() + TIME_ZONE).toISOString().replace('T', ' ').slice(0, -5);
		let username = $("#username").val();
	
		console.log(nowDate);
		
		var param = { "attOut" : nowDate,
					"username" : username }
		
	    $.ajax({
	        url: "/attendance/attIn",
	        type: "POST",
	        data: JSON.stringify(param),
	        contentType: "application/json",
	        success: function(data) {
	        	confirm("퇴근처리가 완료되었습니다!");
				console.log(data);
				location.href="/attendance/list";	
	        },
	        error: function(error) {
	        	confirm("에러가 발생했습니다.\n관리자에게 문의해주세요.");
	            console.log("Error:", error);
	        }
	    })		
	} else {
		return;
	}
}