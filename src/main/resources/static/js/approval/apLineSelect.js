// 첫번째 결재선
let firstApLineSelect = document.getElementById("firstApLineSelect");

// 두번째 결재선
let secondApLineSelect = document.getElementById("secondApLineSelect");

// 결재자 선택 후 추가
let addApLineBtn = document.getElementById("addApLineBtn");



/* 첫번째 결재선 설정 */
firstApLineSelect.addEventListener("click", function(){
	$("#staticBackdrop1").modal("show");
})

/* 두번째 결재선 설정 */
secondApLineSelect.addEventListener("click", function(){
	$("#staticBackdrop2").modal("show");
})


// 첫번째 결재선 추가
$(document).on('click', '.jstree-anchor', function () {
    let spanElement = $(this).find('span');
    
    let deptName = spanElement.text().trim();
    console.log(deptName);
    
    $.ajax({
		url : "/approval/apLineSelect",
		type : "post",
		data : {deptName : deptName},
		success : function(data) {
			$("#empBox").empty();
			
			let username = document.getElementById("username").value;
			
			for (let i = 0; i < data.length; i++) {
				var empData = [data[i].deptName, data[i].positionName, data[i].empName, data[i].username]
				if(username != data[i].username){ // 본인아이디에서는 결재선과 참조선에 이름이 나오지 않는 로직처리
					/*$("#empBox").append('<input type="checkbox" name="empCheck" value=empData/>');*/
					let inputElement = $('<input>', { type: 'radio', name: 'checkedEmp', value: empData});
					$("#empBox").append(inputElement);
					$("#empBox").append('&nbsp; <i class="fa-solid fa-user" style="color: #d6d6d6;"></i>');
					$("#empBox").append('&nbsp;', data[i].positionName, '&nbsp;', data[i].empName, '&nbsp;', '<br>')
				}
			}
		}
	})
})


// 두번째 결재선 추가
$(document).on('click', '.jstree-anchor', function () {
    let spanElement = $(this).find('span');
    
    let deptName = spanElement.text().trim();
    console.log(deptName);
    
    $.ajax({
		url : "/approval/apLineSelect",
		type : "post",
		data : {deptName : deptName},
		success : function(data) {
			$("#empBox2").empty();
			
			let username = document.getElementById("username").value;
			
			for (let i = 0; i < data.length; i++) {
				var empData = [data[i].deptName, data[i].positionName, data[i].empName, data[i].username]
				if(username != data[i].username){ // 본인아이디에서는 결재선과 참조선에 이름이 나오지 않는 로직처리
					/*$("#empBox").append('<input type="checkbox" name="empCheck" value=empData/>');*/
					let inputElement = $('<input>', { type: 'radio', name: 'checkedEmp', value: empData});
					$("#empBox2").append(inputElement);
					$("#empBox2").append('&nbsp; <i class="fa-solid fa-user" style="color: #d6d6d6;"></i>');
					$("#empBox2").append('&nbsp;', data[i].positionName, '&nbsp;', data[i].empName, '&nbsp;', '<br>')
				}
			}
		}
	})
})



function addApLine1() {

	// 선택된 라디오박스의 값을 가져오기 위한 변수
	let selectedRadio = $('input:radio[name="checkedEmp"]:checked');
	
	let firstApLineInfo = document.getElementById("firstApLineInfo");

	if(selectedRadio.length === 0){
		alert("결재자를 선택해주세요.");
		return;
	}
	
	let info = selectedRadio.val();
	console.log(info);
	
	let infoArr = info.split(",");
	console.log(infoArr);
	
	let deptName = infoArr[0];
	let positionName = infoArr[1];
	let empName = infoArr[2];
	let username = infoArr[3];
	
	let firstLineUsername = document.getElementById("firstLineUsername");
	firstLineUsername.value = username;
	
	let firstLineEmpName = document.getElementById("firstLineEmpName");
	firstLineEmpName.value = empName;
	
	console.log(deptName, positionName, empName, username);
	
	firstApLineInfo.value = positionName + "/" + empName;
	
	
	
	console.log(firstApLineInfo.value);
	
	$("#empBox").empty();
	$("#staticBackdrop1").modal("hide");
}


function addApLine2() {

	// 선택된 라디오박스의 값을 가져오기 위한 변수
	let selectedRadio = $('input:radio[name="checkedEmp"]:checked');
	
	let secondApLineInfo = document.getElementById("secondApLineInfo");

	if(selectedRadio.length === 0){
		alert("결재자를 선택해주세요.");
		return;
	}
	
	let info = selectedRadio.val();
	console.log(info);
	
	let infoArr = info.split(",");
	console.log(infoArr);
	
	let deptName = infoArr[0];
	let positionName = infoArr[1];
	let empName = infoArr[2];
	let username = infoArr[3];
	
	if($("#firstLineUsername").val() == username) {
		alert("이미 1차 결재선에 추가된 결재자입니다. \n 다시 선택해주세요.");
		return;
	} else {
		let secondLineUsername = document.getElementById("secondLineUsername");
		secondLineUsername.value = username;
		
		let secondLineEmpName = document.getElementById("secondLineEmpName");
		secondLineEmpName.value = empName;
	}
	
	console.log(deptName, positionName, empName, username);

	secondApLineInfo.value = positionName + "/" + empName;
	
	console.log(secondApLineInfo.value);
	
	$("#empBox2").empty();
	$("#staticBackdrop2").modal("hide");
}


