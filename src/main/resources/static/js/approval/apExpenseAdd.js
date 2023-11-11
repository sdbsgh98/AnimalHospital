let username = document.getElementById("username").value;				// 사번
let positionName = document.getElementById("positionName").value;
let deptName = document.getElementById("deptName").value;
let empName = document.getElementById("empName").value;



let apTitle = document.getElementById("apTitle");			// 전자결재 양식 제목
let apContents = document.getElementById("apContents");		// 전자결재 양식 내용

let addFrm = document.getElementById("addFrm");				// 작성폼
let addBtn = document.getElementById("addBtn");				// 작성폼 제출 버튼
let cancleBtn = document.getElementById("cancleBtn");		// 작성 취소 버튼


const addList = document.getElementById("addList");
const expensePlusBtn = document.getElementById("expensePlusBtn");
const expenseMinusBtn = document.getElementById("expenseMinusBtn");
// const df = document.getElementsByClassName("df"); 
const deletes = document.getElementsByClassName("deletes");



// 금액 콤마찍는 함수
 function inputNumberFormat(obj) {
     obj.value = comma(uncomma(obj.value));
 }

 function comma(str) {
     str = String(str);
     return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
 }

 function uncomma(str) {
     str = String(str);
     return str.replace(/[^\d]+/g, '');
 }
 
 
 

let max = 9;
let count = 0;

if(deletes != null) {
    count = deletes.length;
}
let idx = 1;


// expenseList에 항목 입력 폼 추가하기
$("#expensePlusBtn").click(function(){

    if(count>=max){
        alert("지출 항목은 최대 10개까지 추가할 수 있습니다.");
        return;
    }
    count++;    


	let f = '<div class="expense row g-3 mb-2" id="expense['+idx+']">'
    f = f + '<input type="text" class="form-control me-2" id="expenseName'+idx+'" name="expenseName" placeholder="항목" style="width:350px;">';
	f = f + '<input type="text" class="form-control me-2" id="expenseAmount'+idx+'" name="expenseAmount" placeholder="수량" style="width:100px;" oninput="this.value = this.value.replace(/[^0-9.]/g, \'\');"">';
	f = f + '<input type="text" class="form-control me-2" id="expensePrice'+idx+'" name="expensePrice" placeholder="금액" style="width:150px;" oninput="this.value = this.value.replace(/[^0-9.]/g, \'\');"">';
    f = f + '<input type="text" class="form-control me-2" id="expenseBigo'+idx+'" name="expenseBigo" placeholder="비고" style="width:200px;">';
  	f = f + '<button type="button" id="expenseMinusBtn" name="expenseMinusBtn" class="btn btn-primary df" style="width:50px; height:38.94px;"> X </button>';
	f = f + '</div>';

    idx++;

    $("#addList").append(f);

})


// expenseList에 항목 입력 폼 추가한거 지우기
$("#addList").on("click", ".df", function(){
    $(this).parent().remove();
    count--;
})




// 글 ADD
addBtn.addEventListener("click", function(){
	
	let expenseName = document.getElementsByName("expenseName");
	let expenseAmount = document.getElementsByName("expenseAmount");
	let expensePrice = document.getElementsByName("expensePrice");

    if(apTitle.value == ""){
        alert("제목을 입력해주세요.");
        apTitle.focus();
        return;
    }
	if(expenseName.value == "" || expenseName.value == null) {
		alert("지출항목의 이름을 확인해주세요.");
		return;
	}
	if(expenseAmount.value == "" || expenseAmount.value == null) {
		alert("지출항목의 이름을 확인해주세요.");
		return;
	}
	if(expensePrice.value == "" || expensePrice.value == null) {
		alert("지출항목의 이름을 확인해주세요.");
		return;
	}
    if($("#firstLineUsername").val() == "") {
		alert("결재자 선택은 필수입니다.");
		return;
	}
	if($("#secondLineUsername").val() == "") {
		$("#secondLineUsername").val() = "";
	}
    
    // 폼에 입력한 데이터를 서버로 전송
    addFrm.submit();
    
});


// 취소 버튼
cancleBtn.addEventListener("click", function(){
	/*location.href = "/approval/draftList/" + username;*/
	location.href = "/approval/formatList";
})
