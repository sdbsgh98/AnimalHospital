let username = document.getElementById("username").value;				// 사번

let apTitle = document.getElementById("apTitle");			// 전자결재 양식 제목
let apContents = document.getElementById("apContents");		// 전자결재 양식 내용

let addFrm = document.getElementById("addFrm");				// 작성폼
let addBtn = document.getElementById("addBtn");				// 작성폼 제출 버튼


$(document).ready(function() {
    // 'dayoffKind' 라디오 버튼 변경 시
    $('input[name="dayoffKind"]').change(function() {
        let selectedValue = $(this).val();
        $('#dateFields').empty(); // 이전 필드 제거
        
        let currentDate = new Date(); // 현재 날짜 가져오기


       if (selectedValue === '반차') {
            // 반차 선택 시
            $('#dateFields').append('<label class="me-2" for="dayoffStartDate">날짜</label>');
            $('#dateFields').append('<input type="text" class="form-control me-2" id="dayoffStartDate" name="dayoffStartDate" style="width:200px;">');
            $('#dayoffStartDate').datepicker({
                dateFormat: 'yy/mm/dd', // 날짜 형식 설정
                minDate: currentDate // 현재 날짜 이전을 선택하지 못하도록 설정
            });

            $('#dateFields').append('<label for="dayoffTime"></label>');
            $('#dateFields').append('<select class="form-select" id="dayoffTime" name="dayoffTime" style="width:100px;"><option value="오전">오전</option><option value="오후">오후</option></select>');
        } else if (selectedValue === '연차') {
            // 연차 선택 시
            $('#dateFields').append('<label for="dayoffStartDate" style="width:100px;">시작</label>');
            $('#dateFields').append('<input type="text" class="form-control me-2" id="dayoffStartDate" name="dayoffStartDate">');
            $('#dayoffStartDate').datepicker({
                dateFormat: 'yy/mm/dd', // 날짜 형식 설정
                minDate: currentDate // 현재 날짜 이전을 선택하지 못하도록 설정
            });
			
            $('#dateFields').append('<label for="dayoffEndDate" style="width:100px;">종료</label>');
            $('#dateFields').append('<input type="text" class="form-control me-2" id="dayoffEndDate" name="dayoffEndDate">');
            $('#dayoffEndDate').datepicker({
                dateFormat: 'yy/mm/dd', // 날짜 형식 설정
                minDate: currentDate, // 현재 날짜 이전을 선택하지 못하도록 설정
                beforeShow: function(input) {
                    let dayoffStartDate = $('#dayoffStartDate').datepicker('getDate');
                    if (dayoffStartDate) {
                        return { minDate: dayoffStartDate };
                    }
                }
            });
        } else if (selectedValue === '병가') {
            // 병가 선택 시
            $('#dateFields').append('<label for="dayoffStartDate" style="width:100px;">시작</label>');
            $('#dateFields').append('<input type="text" class="form-control me-2" id="dayoffStartDate" name="dayoffStartDate">');
            $('#dayoffStartDate').datepicker({
                dateFormat: 'yy/mm/dd', // 날짜 형식 설정
                minDate: currentDate // 현재 날짜 이전을 선택하지 못하도록 설정
            });

            $('#dateFields').append('<label for="dayoffEndDate" style="width:100px;">종료</label>');
            $('#dateFields').append('<input type="text" class="form-control me-2" id="dayoffEndDate" name="dayoffEndDate">');
            $('#dayoffEndDate').datepicker({
                dateFormat: 'yy/mm/dd', // 날짜 형식 설정
                minDate: currentDate, // 현재 날짜 이전을 선택하지 못하도록 설정
                beforeShow: function(input) {
                    let dayoffStartDate = $('#dayoffStartDate').datepicker('getDate');
                    if (dayoffStartDate) {
                        return { minDate: dayoffStartDate };
                    }
                }
            });
        } else if (selectedValue === '경조사') {
            // 경조사 선택 시
            $('#dateFields').append('<label for="dayoffStartDate" style="width:100px;">시작</label>');
            $('#dateFields').append('<input type="text" class="form-control me-2" id="dayoffStartDate" name="dayoffStartDate">');
            $('#dayoffStartDate').datepicker({
                dateFormat: 'yy/mm/dd', // 날짜 형식 설정
                minDate: currentDate // 현재 날짜 이전을 선택하지 못하도록 설정
            });

            $('#dateFields').append('<label for="dayoffEndDate" style="width:100px;">종료</label>');
            $('#dateFields').append('<input type="text" class="form-control me-2" id="dayoffEndDate" name="dayoffEndDate">');
            $('#dayoffEndDate').datepicker({
                dateFormat: 'yy/mm/dd', // 날짜 형식 설정
                minDate: currentDate, // 현재 날짜 이전을 선택하지 못하도록 설정
                beforeShow: function(input) {
                    let dayoffStartDate = $('#dayoffStartDate').datepicker('getDate');
                    if (dayoffStartDate) {
                        return { minDate: dayoffStartDate };
                    }
                }
            });
        } else if (selectedValue === '기타') {
            // 기타 선택 시
            $('#dateFields').append('<label for="dayoffStartDate" style="width:100px;">시작</label>');
            $('#dateFields').append('<input type="text" class="form-control me-2" id="dayoffStartDate" name="dayoffStartDate">');
            $('#dayoffStartDate').datepicker({
                dateFormat: 'yy/mm/dd', // 날짜 형식 설정
                minDate: currentDate // 현재 날짜 이전을 선택하지 못하도록 설정
            });

            $('#dateFields').append('<label for="dayoffEndDate" style="width:100px;">종료</label>');
            $('#dateFields').append('<input type="text" class="form-control me-2" id="dayoffEndDate" name="dayoffEndDate">');
            $('#dayoffEndDate').datepicker({
                dateFormat: 'yy/mm/dd', // 날짜 형식 설정
                minDate: currentDate, // 현재 날짜 이전을 선택하지 못하도록 설정
                beforeShow: function(input) {
                    let dayoffStartDate = $('#dayoffStartDate').datepicker('getDate');
                    if (dayoffStartDate) {
                        return { minDate: dayoffStartDate };
                    }
                }
            });
        }
    });
});



  function isRadioChecked() {
    var dayoffKind = document.getElementById('dayoffKind');

    var radioButtons = dayoffKind.querySelectorAll('input[type="radio"]');

    for (var i = 0; i < radioButtons.length; i++) {
      if (radioButtons[i].checked) {
        return true; // 체크된 라디오 버튼이 하나 이상 있음
      }
    }
    return false; // 체크된 라디오 버튼이 없음
  }



// 글 ADD
function addSubmitBtn() {
    if(apTitle.value == "") {
        alert("제목을 입력해주세요.");
        apTitle.focus();
        return;
    }
    if(apContents.value == "") {
        alert("내용을 입력해주세요.");
        apContents.focus();
        return;
    }
    if(!isRadioChecked()) {
		alert("휴가 구분을 선택해주세요.")
	    dayoffKind.focus();
    	return;
	}
    if(dayoffStartDate.value == "") {
	    alert("날짜를 선택해주세요.");
	    dayoffStartDate.focus();
	    return;
    }
    if($("#firstLineUsername").val() == "") {
		alert("결재자 선택은 필수입니다.");
		return;
	}
    
    // 폼에 입력한 데이터를 서버로 전송
    addFrm.submit();
}


function updateSubmitBtn() {
	let apTitle = document.getElementById("apTitle");			// 전자결재 양식 제목
	
    if(apTitle.value == "") {
        alert("제목을 입력해주세요.");
        apTitle.focus();
        return;
    }
    if(apContents.value == "") {
        alert("내용을 입력해주세요.");
        apContents.focus();
        return;
    }
    if(!isRadioChecked()) {
		alert("휴가 구분을 선택해주세요.")
	    dayoffKind.focus();
    	return;
	}
    if(dayoffStartDate.value == "") {
	    alert("날짜를 선택해주세요.");
	    dayoffStartDate.focus();
	    return;
    }
    if($("#firstLineUsername").val() == "") {
		alert("결재자 선택은 필수입니다.");
		return;
	}
    
    let updateFrm = document.getElementById("updateFrm");
    
    // 폼에 입력한 데이터를 서버로 전송
    updateFrm.submit();
}


// 취소 버튼
function cancleBtn() {
	location.href = "/approval/draftList/"+username;
}



// 반차
function halfDay() {
    $('#dateFields').empty(); // 이전 필드 제거
    let currentDate = new Date(); // 현재 날짜 가져오기
    
	$('#dateFields').append('<label for="dayoffStartDate">날짜:</label>');
    $('#dateFields').append('<input type="text" id="dayoffStartDate" name="dayoffStartDate">');
    $('#dayoffStartDate').datepicker({
        dateFormat: 'yy/mm/dd', // 날짜 형식 설정
        minDate: currentDate // 현재 날짜 이전을 선택하지 못하도록 설정
    });

    $('#dateFields').append('<label for="dayoffTime">시간:</label>');
    $('#dateFields').append('<select id="dayoffTime" name="dayoffTime"><option value="오전">오전</option><option value="오후">오후</option></select>');
    
    let startDate = $("#startDate").val();
    let dayoffTime = $("#dayoffTime").val();
    let offTime = $("#offTime").val();
    
    $('#dayoffStartDate').val(startDate);
	$('#dayoffTime').val(offTime);

}

// 연차
function fullDay() {
    $('#dateFields').empty(); // 이전 필드 제거
    let currentDate = new Date(); // 현재 날짜 가져오기
    
    $('#dateFields').append('<label for="dayoffStartDate">시작 날짜:</label>');
    $('#dateFields').append('<input type="text" id="dayoffStartDate" name="dayoffStartDate">');
    $('#dayoffStartDate').datepicker({
        dateFormat: 'yy/mm/dd', // 날짜 형식 설정
        minDate: currentDate // 현재 날짜 이전을 선택하지 못하도록 설정
    });

    $('#dateFields').append('<label for="dayoffEndDate">종료 날짜:</label>');
    $('#dateFields').append('<input type="text" id="dayoffEndDate" name="dayoffEndDate">');
    $('#dayoffEndDate').datepicker({
        dateFormat: 'yy/mm/dd', // 날짜 형식 설정
        minDate: currentDate, // 현재 날짜 이전을 선택하지 못하도록 설정
        beforeShow: function(input) {
            let dayoffStartDate = $('#dayoffStartDate').datepicker('getDate');
            if (dayoffStartDate) {
                return { minDate: dayoffStartDate };
            }
        }
    })
    let startDate = $("#startDate").val();
    let endDate = $("#endDate").val();
    
    $('#dayoffStartDate').val(startDate);
    $('#dayoffEndDate').val(endDate);
}

// 병가
function sickDay() {
    $('#dateFields').empty(); // 이전 필드 제거
    let currentDate = new Date(); // 현재 날짜 가져오기
    
    // 병가 선택 시
    $('#dateFields').append('<label for="dayoffStartDate">시작 날짜:</label>');
    $('#dateFields').append('<input type="text" id="dayoffStartDate" name="dayoffStartDate">');
    $('#dayoffStartDate').datepicker({
        dateFormat: 'yy/mm/dd', // 날짜 형식 설정
        minDate: currentDate // 현재 날짜 이전을 선택하지 못하도록 설정
    });

    $('#dateFields').append('<label for="dayoffEndDate">종료 날짜:</label>');
    $('#dateFields').append('<input type="text" id="dayoffEndDate" name="dayoffEndDate">');
    $('#dayoffEndDate').datepicker({
        dateFormat: 'yy/mm/dd', // 날짜 형식 설정
        minDate: currentDate, // 현재 날짜 이전을 선택하지 못하도록 설정
        beforeShow: function(input) {
            let dayoffStartDate = $('#dayoffStartDate').datepicker('getDate');
            if (dayoffStartDate) {
                return { minDate: dayoffStartDate };
            }
        }
    })
    let startDate = $("#startDate").val();
    let endDate = $("#endDate").val();
    
    $('#dayoffStartDate').val(startDate);
    $('#dayoffEndDate').val(endDate);
}

function familyDay() {
    $('#dateFields').empty(); // 이전 필드 제거
    let currentDate = new Date(); // 현재 날짜 가져오기
    
    // 경조사 선택 시
    $('#dateFields').append('<label for="dayoffStartDate">시작 날짜:</label>');
    $('#dateFields').append('<input type="text" id="dayoffStartDate" name="dayoffStartDate">');
    $('#dayoffStartDate').datepicker({
        dateFormat: 'yy/mm/dd', // 날짜 형식 설정
        minDate: currentDate // 현재 날짜 이전을 선택하지 못하도록 설정
    });

    $('#dateFields').append('<label for="dayoffEndDate">종료 날짜:</label>');
    $('#dateFields').append('<input type="text" id="dayoffEndDate" name="dayoffEndDate">');
    $('#dayoffEndDate').datepicker({
        dateFormat: 'yy/mm/dd', // 날짜 형식 설정
        minDate: currentDate, // 현재 날짜 이전을 선택하지 못하도록 설정
        beforeShow: function(input) {
            let dayoffStartDate = $('#dayoffStartDate').datepicker('getDate');
            if (dayoffStartDate) {
                return { minDate: dayoffStartDate };
            }
        }
    })
    let startDate = $("#startDate").val();
    let endDate = $("#endDate").val();
    
    $('#dayoffStartDate').val(startDate);
    $('#dayoffEndDate').val(endDate);
}

// 기타
function etcDay() {
    $('#dateFields').empty(); // 이전 필드 제거
    let currentDate = new Date(); // 현재 날짜 가져오기
    
    $('#dateFields').append('<label for="dayoffStartDate">시작 날짜:</label>');
    $('#dateFields').append('<input type="text" id="dayoffStartDate" name="dayoffStartDate">');
    $('#dayoffStartDate').datepicker({
        dateFormat: 'yy/mm/dd', // 날짜 형식 설정
        minDate: currentDate // 현재 날짜 이전을 선택하지 못하도록 설정
    });

    $('#dateFields').append('<label for="dayoffEndDate">종료 날짜:</label>');
    $('#dateFields').append('<input type="text" id="dayoffEndDate" name="dayoffEndDate">');
    $('#dayoffEndDate').datepicker({
        dateFormat: 'yy/mm/dd', // 날짜 형식 설정
        minDate: currentDate, // 현재 날짜 이전을 선택하지 못하도록 설정
        beforeShow: function(input) {
            let dayoffStartDate = $('#dayoffStartDate').datepicker('getDate');
            if (dayoffStartDate) {
                return { minDate: dayoffStartDate };
            }
        }
    })
    let startDate = $("#startDate").val();
    let endDate = $("#endDate").val();
    
    $('#dayoffStartDate').val(startDate);
    $('#dayoffEndDate').val(endDate);
}