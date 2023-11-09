let apLineSelect = document.getElementById("apLineSelect");



apLineSelect.addEventListener("click", function(){
	$("#exampleModal").modal("show");
})

$(document).ready(function () {
    $(document).on('click', '.jstree-anchor', function () {
        let spanElement = $(this).find('span');
        
        let deptName = spanElement.text();
        
        $.ajax({
			url : "/approval/apLineSelect",
			type : "post",
			data : {deptName : deptName},
			success : function(data) {
				$("#empList").empty();
				
				let username = document.getElementById("username").val();
				
				for (let i = 0; i < data.length; i++) {
					var empData = [data[i].deptName, data[i].positionName, data[i].empName, data[i].username];
					if(username != data[i].username){ // 본인아이디에서는 결재선과 참조선에 이름이 나오지 않는 로직처리
						$("#empList").append($('<input/>', { type: 'checkbox', name: 'empList', value: a}));
						/*$("#empList").append($('<img/>',{src:path+'/resources/images/approve/circle_people.png',width:'20px',height:'20px'}));*/
						$("#empList").append(data[i].deptName, '&nbsp;', data[i].positionName, '&nbsp;', data[i].empName, '&nbsp;', data[i].username, '<br>')
					}
				}
			}
		})
    });
});


/*const changeDep = (e) => {  // 결재선 선택창에서 부서 눌렀을 때
	const value = e.target.value;

	$.post(path + "/approve/changeDep.do",
			{ deptName: value },
			data => {  // 데이터를 객체로(키,값) 전달
				$("#people-box").empty(); // #people-box 밑에 자식요소들 모두삭제
				for (let i = 0; i < data.length; i++) {
					var a = [data[i].memberId, data[i].memberName, data[i].job.jobName, data[i].dept.deptName];
					if(memberId != data[i].memberId){ // 본인아이디에서는 결재선과 참조선에 이름이 나오지 않는 로직처리
						$("#people-box").append($('<input/>', { type: 'checkbox', name: 'peopleBox', value: a, width: '30px'}));
						$("#people-box").append($('<img/>',{src:path+'/resources/images/approve/circle_people.png',width:'20px',height:'20px'}));
						$("#people-box").append(data[i].memberId, '&nbsp;', data[i].memberName, '&nbsp;', data[i].job.jobName, '&nbsp;', data[i].dept.deptName, '<br>')
					}
				}
			});
}*/