let username = document.getElementById("username").value;				// 로그인유저 사번
let writeUsername = document.getElementById("writeUsername").value;		// 기안 작성자 사번

let apNo = document.getElementById("apNo").value;

let apTitle = document.getElementById("apTitle");			// 전자결재 양식 제목
let apContents = document.getElementById("apContents");		// 전자결재 양식 내용



// 로그인 사원번호와 작성자가 같으면
if (username === writeUsername) {
	
	let draftListBtn = document.getElementById("draftListBtn");	
	let deleteBtn = document.getElementById("deleteBtn");		
	let updateBtn = document.getElementById("updateBtn");	
	
	// 기안자의 삭제버튼
	deleteBtn.addEventListener("click", function(){
	
	    let result = confirm("정말로 삭제하시겠습니까?");
	
	    if(result) {
		    frm.method = "post";
		    frm.action = "delete";		
		    frm.submit();
		}
	})
	
	
	// 기안자의 목록버튼	
	draftListBtn.addEventListener("click", function(){
		location.href = "/approval/draftList/"+username;
	})
	
	// 기안자의 수정버튼
	updateBtn.addEventListener("click", function(){
		location.href = "/approval/update?apNo="+apNo;
	})
	

// 로그인한 사람과 작성자가 같지 않으면
} else if (username !== writeUsername) {
	
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
					"apNo" : apNo
				}
				
				 $.ajax({
			        url:'/approval/reject',
			        data:data,
			        method:'POST',
			        success:function(data){
			            alert("반려 처리가 완료되었습니다.");
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
}