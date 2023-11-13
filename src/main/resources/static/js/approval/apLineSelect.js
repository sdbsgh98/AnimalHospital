let apLineSelect = document.getElementById("apLineSelect");



apLineSelect.addEventListener("click", function(){
	$("#exampleModal").modal("show")
})


    $(document).on('click', '.jstree-anchor', function () {
        let spanElement = $(this).find('span');
        
        let deptName = spanElement.text().trim();
        console.log(deptName);
        
        $.ajax({
			url : "/approval/apLineSelect",
			type : "post",
			data : {deptName : deptName},
			success : function(data) {
				$("#empList").empty();
				
				let username = document.getElementById("username").value;
				
				for (let i = 0; i < data.length; i++) {
					var empData = [data[i].deptName, data[i].positionName, data[i].empName]
					if(username != data[i].username){ // 본인아이디에서는 결재선과 참조선에 이름이 나오지 않는 로직처리
						$("#empList").append('<input type="checkbox" name="empList" value=empData/>');
						/*$("#empList").append($('<img/>',{src:path+'/resources/images/approve/circle_people.png',width:'20px',height:'20px'}));*/
						$("#empList").append(data[i].deptName, '&nbsp;', data[i].positionName, '&nbsp;', data[i].empName, '&nbsp;', '<br>')
					}
				}
			}
		})
    });




/*$(document).ready(function () {
	$(document).on('click', '#addApLineBtn', function () {
		if ($('input:checkbox[name="peopleBox"]:checked').length == 0) { //결재선에 추가할 체크박스에 체크된개수가 0개이면
			alert("사원을 선택해주세요");
		} else { // 그외 체크된개수가 1개이상이면
			$('input:checkbox[name="peopleBox"]:checked').each(function() { // 체크된것들을 foreach문으로 비교
				var flag = false;
				const str = this.value.split(",");
	
				$('input:checkbox[name="appBox"]').each(function() {  // 결재선에 추가되있는 사람을 중복확인하기위한 로직
					const app = this.value.split(",");
					if (str[0] == app[0]) {
						flag = true; // 추가되있는 명단과, 추가할 사람의 사원번호가 동일하면 그 사람은 flag값을 true로
					}
				})
	
				if (flag == false) {
					if ($('input:checkbox[name="appBox"]').length >= 2) { //추가할 명단이 중복되지않았을때, 최대인원이 3명으로 제한
						alert("최대 2명까지만 결재신청 가능합니다");
						return false;
					} else { // 그외에는 추가함
						$("#line-box").append($('<div/>', { class: str[0] })); // 결재선 만들어질때, div로 묶고 만들어짐 클래스값 = 사원번호
						$("." + str[0]).append($('<input/>', { type: 'checkbox', name: 'appBox', value: str[0], width: '30px', margin: "10px" }));
						$("." + str[0]).append($('<img/>',{src:path+'/resources/images/approve/circle_people.png',width:'20px',height:'20px'}));
						$("." + str[0]).append(str[0] + " " + str[1] + " " + str[2] + " " + str[3], '<br>')
					}
	
				} else { // flag값이 true일 경우에는 추가하지않음
					alert("이미 등록된 사원입니다");
					return false;
				}
			})
			$("input:checkbox[name=peopleBox]").prop("checked", false); // 다 추가하고나서 선택창의 체크박스 초기화
		}
	})
})*/