let username = document.getElementById("username").value;				// 사번

let apTitle = document.getElementById("apTitle");			// 전자결재 양식 제목
let apContents = document.getElementById("apContents");		// 전자결재 양식 내용

let addFrm = document.getElementById("addFrm");				// 작성폼
let addBtn = document.getElementById("addBtn");				// 작성폼 제출 버튼
let cancleBtn = document.getElementById("cancleBtn");		// 작성 취소 버튼

let firstLineUsername = document.getElementById("firstLineUsername");
let secondLineUsername = document.getElementById("secondLineUsername");



// 글 ADD
addBtn.addEventListener("click", function(){

    if(apTitle.value == ""){
        alert("제목을 입력해주세요.");
        apTitle.focus();
        return;
    }
    if(apContents.value == ""){
        alert("내용을 입력해주세요.");
        apContents.focus();
        return;
    }
    if(firstLineUsername.value == "") {
		alert("결재자 선택은 필수입니다.");
		return;
	}
      
    // 폼에 입력한 데이터를 서버로 전송
    addFrm.submit();
    
});


// 취소 버튼
cancleBtn.addEventListener("click", function(){
	location.href = "/approval/formatList";
})


