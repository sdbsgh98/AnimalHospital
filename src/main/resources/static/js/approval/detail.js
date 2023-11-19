let username = document.getElementById("username").value;				// 로그인유저 사번
let writeUsername = document.getElementById("writeUsername").value;		// 기안 작성자 사번

let apNo = document.getElementById("apNo").value;

let apTitle = document.getElementById("apTitle");			// 전자결재 양식 제목
let apContents = document.getElementById("apContents");		// 전자결재 양식 내용
let approveBtn = document.getElementById("approveBtn");		// 결재 버튼


function deleteBtn() {
	let result = confirm("정말로 삭제하시겠습니까?");
		
    if(result) {
		let frm = document.getElementById("frm");
	    frm.method = "post";
	    frm.action = "delete";		
	    frm.submit();
	}
}

function updateBtn() {
	let frm = document.getElementById("frm");
    frm.method = "get";
    frm.action = "update";		
    frm.submit();
}


function cancleBtn() {
	location.href = "/approval/draftList/"+username;
}

function updateSubmitBtn() {
	let apTitle = document.getElementById("apTitle");			// 전자결재 양식 제목
	let apContents = document.getElementById("apContents");		// 전자결재 양식 내용
	let firstLineUsername = document.getElementById("firstLineUsername");
	
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
    
    let updateFrm = document.getElementById("updateFrm");
    
    // 폼에 입력한 데이터를 서버로 전송
    updateFrm.submit();
}






if(username === writeUsername) {
	// 기안자의 목록버튼	
	draftListBtn.addEventListener("click", function(){
		location.href = "/approval/draftList/"+username;
	})	
}


// 로그인한 사람과 작성자가 같지 않으면
if (username !== writeUsername) {
	
	let approverListBtn = document.getElementById("approverListBtn");
	let rejectBtn = document.getElementById("rejectBtn");
	let rejectSubmitBtn = document.getElementById("rejectSubmitBtn");
	
	
	// 결재자의 목록버튼	
	approverListBtn.addEventListener("click", function(){
		location.href = "/approval/approverList/"+username;
	})
	
	rejectBtn.addEventListener("click", function(){
		$("#staticBackdrop").modal("show"); // modal 나타내기
	
		rejectSubmitBtn.addEventListener("click", function(){
			
			let apRejection = $("#apRejection").val();

			if (apRejection == null || apRejection == ""){
			    alert("반려 사유를 입력해주세요.");
			} else { // 정상적인 입력 시
				let data = {
					"apRejection" : apRejection,
					"apNo" : apNo,
					"username" : username
				}
				
				 $.ajax({
			        url:'/approval/reject',
			        data:data,
			        method:'POST',
			        success:function(data){
			            alert("반려 처리가 완료되었습니다.");
			            location.href="/approval/approverList/" + username;
			        },
			        error:function(xhr, status, error){
			            alert('저장 중 에러가 발생했습니다. 다시 시도해 주세요.');
			        }
			    });
			    
			    $("#staticBackdrop").modal("hide");
	        	/*apRejection.val("");
	        	let toApTitle = $("#toApTitle").val("");*/
			}
		})
	})
	
	approveBtn.addEventListener("click", function(){
		
		let result = confirm("해당 기안을 결재처리 하시겠습니까?");
		
		if(result === true) {
		    $.ajax({
				url : "/approval/approve",
				type : "post",
				data : {
					apNo : apNo,
					username : username
				},
				success : function(data){
		            alert("결재처리가 완료되었습니다.");
		            location.href="/approval/approverList/" + username;
		            
		        },
		        error:function(xhr, status, error){
		            alert('처리 중 에러가 발생했습니다.\n다시 시도해 주세요.');
		        }
			})
		} else if (result === false) {
			location.href="/approval/detail?apNo=" + apNo;
		}
	})	
	
	
}





