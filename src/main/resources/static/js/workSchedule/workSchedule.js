 let username = document.getElementById("username");
 
    document.addEventListener('DOMContentLoaded', function () {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
            timeZone: 'UTC',
            initialView: 'dayGridMonth', // 홈페이지에서 다른 형태의 view를 확인할  수 있다.
            events:[ // 일정 데이터 추가 , DB의 event를 가져오려면 JSON 형식으로 변환해 events에 넣어주면된다.
                {
                    title:'일정',
                    start:'2023-11-06 00:00:00',
                    end:'2023-11-07 24:00:00' 
                    // color 값을 추가해 색상도 변경 가능 자세한 내용은 하단의 사이트 참조
                }, 
            ], 
            eventClick: function(info) {
                	info.jsEvent.preventDefault();
                   
                	var event = info.event;
    	            selectedEvent = event; // 선택한 일정 변수에 저장 : 상세보기/수정
    	            openEventModal(event); // 상세보기
            },
            
            headerToolbar: {
                center: 'addEventButton' // headerToolbar에 버튼을 추가
            }, customButtons: {
				인사행정: {
					
				},
				내과 : {

				},
				외과 : {
					
				},
				영상과 : {
					
				},
				간호과 : {
					
				},
                addEventButton: { // 추가한 버튼 설정
                    text : "일정 추가",  // 버튼 내용
                    click : function(){ // 버튼 클릭 시 이벤트 추가
                        $("#exampleModal").modal("show"); // modal 나타내기

                        $("#addCalendar").on("click",function(){  // modal의 추가 버튼 클릭 시
                        	let username = $("#username").val();
                        	let deptName = $("#deptName").val();
                        	let positionName = $("#positionName").val();
                        	let empName = $("#empName").val();
                            let workDate = $("#workDate").val();
                            let workTime = $("#workTime").val();
                            let homeTime = $("#homeTime").val();
                            
                            //내용 입력 여부 확인
                            if(workDate == null || workDate == ""){
                                alert("근무날짜를 입력해주세요.");
                            }else if(workTime == "" || homeTime ==""){
                                alert("근무시간을 입력해주세요.");
                            }else{ // 정상적인 입력 시
                            	let data = {
                            		"username" : username,
                            		"deptName" : deptName,
                            		"positionName" : positionName,
                            		"empName" : empName,
                                    "workDate" : workDate,
                                    "workTime" : workTime,
                                    "homeTime" : homeTime
                                }//전송할 객체 생성

							    $.ajax({
							        url:'/work/addWork',
							        data:JSON.stringify(data),
							        method:'POST',
							        contentType:'application/json',
							        success:function(data){
							            alert("일정 추가 성공");
							        },
							        error:function(xhr, status, error){
							            alert('저장 중 에러가 발생했습니다. 다시 시도해 주세요.');
							        }
							    });
							    
							    $("#exampleModal").modal("hide");
	                        	let username = $("#username").val("");
	                        	let deptName = $("#deptName").val("");
	                        	let positionName = $("#positionName").val("");
	                        	let empName = $("#empName").val("");
	                            let workDate = $("#workDate").val("");
	                            let workTime = $("#workTime").val("");
	                            let homeTime = $("#homeTime").val("");
                            }
                        });
                    }
                }
            },
            editable: true, // false로 변경 시 draggable 작동 x
        });
        
		function openEventModal(event) {
		    // 일정 상세 정보를 가져오는 Ajax 요청
		    let workNo = document.getElementById("workNo");
		    
		    $.ajax({
		        type: 'POST',
		        url: './workDetail',
		        data: {
		        	workNo: event.workNo
		        },
		        success: function(response) {
		            $('#scheduleOneModal').modal('show');
		            $('#username').text(response.username);
		            $('#deptName').text(response.deptName);
		            $('#positionName').text(response.positionName);
		            $('#empName').text(response.empName);
		            $('#workDate').text(response.workDate);
		            $('#workTime').text(response.workTime);
		            $('#homeTime').text(response.homeTime);
		            
		         	// response 객체에서 일정 정보를 읽어와서 selectedEvent 객체 생성
		            var selectedEvent = {
		        		"username" : username,
		        		"deptName" : deptName,
		        		"positionName" : positionName,
		        		"empName" : empName,
		                "workDate" : workDate,
		                "workTime" : workTime,
		                "homeTime" : homeTime
		            };
		         	console.log(selectedEvent);
		         	
		         	// 작성자가 일치하지 않으면 수정/삭제 버튼을 숨김
		         	if(username !== selectedEvent.username) {
		                $('#deleteBtn').hide();
		                $('#updateBtn').hide();
		            } else {
		            	$('#deleteBtn').show();
		                $('#updateBtn').show();
		            }
		         	
			     	// 수정 버튼 클릭
			        $('#updateBtn').off('click').on('click', function() {
					    updateWorkSchedule(selectedEvent);
					});
			     	
		         	// 일정상세에서 '삭제' 버튼 클릭 -> '확인' 클릭시 삭제 
		            $('#deleteBtn').on('click', function() {
		            	Swal.fire({
		                    title: '경고',
		                    text: "일정을 삭제하시겠습니까?",
		                    showCancelButton: true,
		                    confirmButtonColor: '#3085d6',
		                    cancelButtonColor: '#d33',
		                    confirmButtonText: '삭제',
		                    cancelButtonText: '취소'
		                }).then((result) => {
		                    if (result.isConfirmed) {
		                    	deleteSchedule(selectedEvent.workNo);
		                	}
		                });
		            });
			        
		        },
		        error: function() {
		            console.error('상세 조회 실패');
		        }
		    });
		}
		
		/* 수정 함수 */
		function updateWorkSchedule(){
			
			$('#detailModal').modal('hide');
			$("#updateModal").modal("show");
			
			$("#updateCalendar").on("click", function(){
				
		        let workDate = $("#workDate").val();
		        let workTime = $("#workTime").val();
		        let homeTime = $("#homeTime").val();
		        let workNo = $("#workNo").val();
		        
				$.ajax({
					url:"/work/updateWork",
					method:"post",
					data:{
		                "workDate" : workDate,
		                "workTime" : workTime,
		                "homeTime" : homeTime,
		                "workNo" : workNo
					},
					dataType:"JSON",
					success:function(data){
						console.log("수정성공",data);
						$("#updateModal").modal("hide");
						location.href="/workSchedule/workList";
					},
					error:function(){
						alert("전송오류입니다");
					}
				});
			});
		}
		
		function deleteSchedule(workNo) {
			$.ajax({
		        type: 'POST',
		        url: '${pageContext.request.contextPath}/work/deleteWork',
		        data: {
		            workNo : workNo
		        },
		        success: function(response) {
		            if (response.success) {
		            	$('#scheduleOneModal').modal('hide');
		                calendar.refetchEvents();
		                Swal.fire({
		                    icon: 'success',
		                    title: '삭제 성공',
		                    text: '일정이 삭제되었습니다.'
		                });
		            } else {
		                console.error('삭제실패');
		            }
		        },
		        error: function() {
		            console.error('삭제실패');
		        }
			});
		}
		
        calendar.render();
    });
    
/*function getCalendarDataInDB(){
    var arr = [{title: 'evt1', start:'ssssss'}, {title: 'evt2', start:'123123123'}];
    
    //배열 초기화
    var viewData = {};
    //data[키] = 밸류
    viewData["id"] = $("#currId").text().trim();
    viewData["title"] = $("#title").val();
    viewData["content"] = $("#content").val();
    
    $.ajax({
        contentType:'application/json',
        dataType:'json',
        url:'work/addWork',
        type:'post',
        async: false,
        data:JSON.stringify(viewData),
        success:function(resp){
            //alert(resp.f.id + ' ggg');     
            $.each(resp, function(index, item){
                console.log(index + ' : ' + item);
                $.each(item, function(iii, ttt){
                    console.log('inner loop => ' + iii + ' : ' + ttt);
                });
            });
            arr = resp;
        },
        error:function(){
            alert('저장 중 에러가 발생했습니다. 다시 시도해 주세요.');
        }
    });
    
    return arr;
}*/


