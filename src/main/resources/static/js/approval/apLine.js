const changeDep = (e) => {  // 결재선 선택창에서 부서 눌렀을 때
	const value = e.target.value;

	$.ajax({
		type: 'POST',
		url: path + '/approve/changeDep.do',
		data: { deptName: value },
		success: function(data) {
			$("#people-box").empty(); // #people-box 밑에 자식요소들 모두삭제
				for (let i = 0; i < data.length; i++) {
				var a = [data[i].memberId, data[i].memberName, data[i].job.jobName, data[i].dept.deptName];
				
				if (memberId !== data[i].memberId) {
					$("#people-box").append($('<input/>', { type: 'checkbox', name: 'peopleBox', value: a, width: '30px' }));
					$("#people-box").append($('<img/>', { src: path + '/resources/images/approve/circle_people.png', width: '20px', height: '20px' }));
					$("#people-box").append(data[i].memberId, '&nbsp;', data[i].memberName, '&nbsp;', data[i].job.jobName, '&nbsp;', data[i].dept.deptName, '<br>');
					}
				}
			},
		error: function(xhr, status, error) {
		console.error(error);
		}
	});
}