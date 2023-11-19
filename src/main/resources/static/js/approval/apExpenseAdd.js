let username = document.getElementById("username").value;				// 사번
let positionName = document.getElementById("positionName").value;
let deptName = document.getElementById("deptName").value;
let empName = document.getElementById("empName").value;



let apTitle = document.getElementById("apTitle");			// 전자결재 양식 제목
let apContents = document.getElementById("apContents");		// 전자결재 양식 내용

let addFrm = document.getElementById("addFrm");				// 작성폼
let addBtn = document.getElementById("addBtn");				// 작성폼 제출 버튼


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
    f = f + '<input type="text" class="form-control me-2" id="expenseName'+idx+'" name="expenseName" placeholder="항목" style="width:300px;">';
	f = f + '<input type="text" class="form-control me-2" id="expenseAmount'+idx+'" name="expenseAmount" placeholder="수량" style="width:80px;" oninput="this.value = this.value.replace(/[^0-9.]/g, \'\');"">';
	f = f + '<input type="text" class="form-control me-2" id="expensePrice'+idx+'" name="expensePrice" placeholder="금액" style="width:120px;" oninput="this.value = this.value.replace(/[^0-9.]/g, \'\');"">';
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
function addSubmitBtn() {
	
	let expenseName = document.getElementsByName("expenseName");
	let expenseAmount = document.getElementsByName("expenseAmount");
	let expensePrice = document.getElementsByName("expensePrice");

    if(apTitle.value == ""){
        alert("제목을 입력해주세요.");
        apTitle.focus();
        return;
    }
    if($("#firstLineUsername").val() == "") {
		alert("결재자 선택은 필수입니다.");
		return;
	}
    
    // 폼에 입력한 데이터를 서버로 전송
    addFrm.submit();
}


function cancleBtn() {
	location.href = "/approval/draftList/"+username;
}



// del 버튼 클릭하면 삭제하겠다
/*for(del of deletes){
    del.addEventListener("click", function(){
        let apNo = this.getAttribute("data-delete-num");
        let expenseName = this.getAttribute("data-delete-name");
        
        let check = confirm("정말로 항목을 삭제하시겠습니까?");

        if(check){
			
		    $.ajax({
				url : "/approval/expenseDel",
				type : "post",
				data : {
					apNo : apNo,
					expenseName : expenseName
				},
				success : function(data){
		            if(result.trim()=='1'){
                        $(this).parent().remove();
                        this.remove();
                        count--;
                    }
		            location.href="/approval/approverList/" + username;
		        },
		        error:function(xhr, status, error){
		            alert('처리 중 에러가 발생했습니다.\n다시 시도해 주세요.');
		        }
		     })   
        }
    })
}*/



for(del of deletes){
    del.addEventListener("click", function(){
        let apNo = document.getElementById("apNo").value;
        let expenseName = this.getAttribute("data-delete-name");
             
        let check = confirm("정말로 삭제하시겠습니까?");

        if(check){
        console.log("1");
            fetch("./expenseDel?apNo=" + apNo + "&expenseName=" + expenseName, {method:"get"})
                .then((result)=>{return result.text()}) // result.text를 반환받겠다
                .then((r)=>{
                    //  console.log("삭제 결과", r) 
                    if(r.trim()=='1'){
                        $(this).parent().remove();
                        // this.remove();
                        count--;
                    }
                })
        }
    })
}



function updateSubmitBtn() {
	let apTitle = document.getElementById("apTitle");			// 전자결재 양식 제목
	let firstLineUsername = document.getElementById("firstLineUsername");
	
    if(apTitle.value == ""){
        alert("제목을 입력해주세요.");
        apTitle.focus();
        return;
    }
    if(firstLineUsername.value == "") {
		alert("결재자 선택은 필수입니다.");
		return;
	}
    
    let updateFrm = document.getElementById("updateFrm");
    
    // 폼에 입력한 데이터를 서버로 전송
    updateFrm.submit();
}