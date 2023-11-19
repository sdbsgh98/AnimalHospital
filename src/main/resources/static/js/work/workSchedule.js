	
	$(function(){
		
		 function initializeFullCalendar(data){
		
			
			console.log(data);
		
			var calendarEl = document.getElementById('calendar');
			let nowDate = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().slice(0, 16);
			
			
			/*$('#closeBtn').on("click",function(){
								$("#workStart").val("");
								$("#workEnd").val("");
								});*/
			
	
			var calendar= new FullCalendar.Calendar(calendarEl, {
				height:'600px',
				expandRows:true,
				customButtons:{
					myCustomButton:{
						text:"일정 등록",
						click : function(){
							$('#addModal').modal("show");
							
							var deptNo = $("#deptNo").val();
							console.log(deptNo);
							
							//현재날짜를 min으로 설정
							let dateElement = document.getElementById('workStart');
							let dateElement2 = document.getElementById('workEnd');
							      					
	       					dateElement.value = nowDate;
	       					dateElement.setAttribute("min", nowDate);
	       					
							dateElement2.value = nowDate;
	       					dateElement2.setAttribute("min", nowDate);
	
							//등록버튼클릭시
							$('#addBtn').on("click", function(){
	
								var username = $("#username").val();
								var deptName = $("#deptName").val();
								var positionName = $("#positionName").val();
								var empName = $("#empName").val();
								var workStart = $("#workStart").val();
								var workEnd = $("#workEnd").val();
								
								if (workStart.substring(0, 10) !== workEnd.substring(0, 10)) {
							            alert("출근일정과 퇴근일정의 날짜가 동일하지 않습니다!!\n다시 확인하여주세요!!");
							            return;
						            } else if (workStart > workEnd) {
							            alert("퇴근일자에 출근일자보다 이전의 시간이 올 수 없습니다!\n다시 확인해주세요!!");
							            return;
							        }
					
								var param = {
									"username" : username,
									"deptName" : deptName,
									"positionName" : positionName,
									"empName" : empName,
							        "workStart" : workStart,
							        "workEnd" : workEnd,
							        "deptNo" : deptNo
							    };
								
								
								$.ajax({
									url:"/work/addWork",
									data:JSON.stringify(param),
									method:"POST",												
									contentType: "application/json",
									success: function (rst) {
										console.log(rst);
										if (rst == 0) {
											alert("이미 일정이 등록된 날짜입니다!\n다시 확인해주세요!!")
											return;
										} else {
											$("#addModal").modal("hide");
											$("#workStart").val("");
											$("#workEnd").val("");
						
											location.href = "/work/workList";
										}
									}
								})
	
							});				
						}
					}
				},
				headerToolbar: {
					left: 'prev,next,today',
					center: 'title',
					right: 'myCustomButton,dayGridMonth,listWeek'
				},
				initialView:'dayGridMonth',
				events: data,
				navLinks: true,
				navLinkDayClick:function(date,jsEvent){
					console.log(date);
					$("#addModal").modal("show");
				},
				editable: false,
				selectable: true,
				locale: 'en',
				dateClick: function() {  
					//달력안에 클릭하면 				 
	 			},
				
				
				//이벤트 클릭했을시 detail
				eventClick:function(info){		
					 console.log(info);
				
					 var workNo=info.event.id;
					 console.log(workNo);
					 var param={"workNo":workNo}				
	
					$.ajax({
						url:"/work/workDetail",
						data: JSON.stringify(param),
						method:"POST",
						contentType: "application/json",
						success : function(detail){
							
							console.log("detail 전송성공");
							console.log(detail);
							console.log(detail.empName);
							
							$("#detailModal").modal("show");
	
							$("#getWorkNo").val(detail.workNo);
							$("#getUsername").val(detail.username);
							$("#getDeptName").val(detail.deptName);
							$("#getPositionName").val(detail.positionName);
							$("#getEmpName").val(detail.empName);			
							$("#getWorkStart").val(detail.workStart);
							$("#getWorkEnd").val(detail.workEnd);
							
							 //수정버튼클릭시
							$("#modifyBtn").on("click", function(){	
								
								 var workDate =  $("#getWorkStart").val();
								 var daterst = workDate>=nowDate
						
							    console.log(daterst);
							    
	
								if(daterst==true){							
									$("#detailModal").modal("hide");
									$("#updateModal").modal("show");
									
									//현재날짜를 min으로 설정
									let dateElement = document.getElementById('getWorkStart');
									let dateElement2 = document.getElementById('getWorkEnd');
									      					
			       					dateElement.setAttribute("min", nowDate);
			       					dateElement2.setAttribute("min", nowDate);
									
									$("#workNo").val(detail.workNo);
									$("#upDeptName").val(detail.deptName);
									$("#upPositionName").val(detail.positionName);
									$("#upEmpName").val(detail.empName);			
									$("#upWorkStart").val(detail.workStart);
									$("#upWorkEnd").val(detail.workEnd);
	
								}
								
								
						   })		
												            													
						}
					 })
					 
					 //삭제버튼클릭시
					 $("#deleteBtn").on("click",function(){
						let workNo = $("#getWorkNo").val();
						let workStart = $('#getWorkStart').val();
						let workDate = workStart.substring(0, 10); 		
						
				 		let result = confirm("["+ workDate + "] 근무일정을 삭제하시겠습니까?");
						
						console.log(param);
						if(result === true) {
							$.ajax({
								url:"/work/workDelete",
								data:JSON.stringify({ "workNo": workNo }),
								method:"POST",
								contentType: "application/json",
								success : function(data){
									console.log("delete");
									
									$("#detailModal").modal("hide");
									
									location.href="/work/workList";
								},
					            error: function (xhr, status, error) {
					                console.error(xhr.responseText);
					            }								 
							})
							
						}
					 })	
					 
					 
					 //수정등록버튼클릭시
					 $("#updateBtn").on("click",function(){
						 		var workNo = $("#workNo").val();
						 		
						 		console.log(workNo);
								
								var workStart=$("#upWorkStart").val();
								var workEnd=$("#upWorkEnd").val();
								
								if (workStart.substring(0, 10) !== workEnd.substring(0, 10)) {
							            alert("출근일정과 퇴근일정의 날짜가 동일하지 않습니다!!\n다시 확인하여주세요!!");
							            return;
						            } else if (workStart > workEnd) {
							            alert("퇴근일자에 출근일자보다 이전의 시간이 올 수 없습니다!\n다시 확인해주세요!!");
							            return;
							        }
								
								
								var param = {"workNo" : workNo,
											"workStart" : workStart,
							        		"workEnd" : workEnd}
								
								console.log(param);
								$.ajax({
										url:"/work/workUpdate",
										data:JSON.stringify(param),
										method:"POST",
										contentType: "application/json",
										success : function(data){
											console.log("일정 수정이 완료되었습니다.")					
											location.href="/work/workList";
										}							 
							 	})		   
									
					 })		
	
				},
	
			eventAdd:function(obj){
				console.log(obj)
			},
			
	
		});
			
	    $('#workStart').on('input', function() {
	        var selectedDateTime = $('#workStart').val();
	        $('#workEnd').val(selectedDateTime);
	    });
	    
	    $('#upWorkStart').on('input', function() {
	        var selectedDateTime = $('#upWorkStart').val();
	        $('#upWorkEnd').val(selectedDateTime);
	    });
		    
			calendar.render();
		}
		
		 function fetchAndInitializeCalendar(deptNo) {
		        var request = $.ajax({
		            url: "/work/workList",
		            data: {
		                deptNo: deptNo
		            },
		            method: "POST"
		        });
		
		        request.done(function (data) {
		            console.log(data);
		            initializeFullCalendar(data);
		        });
		
		        request.fail(function (jqXHR, textStatus) {
		            alert("Request failed: " + textStatus);
		        });
		    }
		
		    // Initial fetch and initialize when the page loads
		    var deptNo = $("#deptNo").val();
		    fetchAndInitializeCalendar(deptNo);
		
		    // Event handler for select change
		    $("#deptNo").on("change", function () {
		        var deptNo = this.value;
		        console.log(deptNo);
		        fetchAndInitializeCalendar(deptNo);
		    });
		    
	
	    $('#workEnd').on('focusout', function() {
	        var workStart = $("#workStart").val();
	        var workEnd = $("#workEnd").val();
	
	        if (workStart.substring(0, 10) !== workEnd.substring(0, 10)) {
	            alert("출근일자과 퇴근일자의 날짜가 동일하지 않습니다!!\n다시 확인해주세요!!");
	        } else if (workStart > workEnd) {
	            alert("퇴근일자에 출근일자보다 이전의 시간은 올 수 없습니다!\n다시 확인해주세요!!");
	        }
	    });
	    
	    $('#upWorkEnd').on('focusout', function() {
	        var workStart = $("#upWorkStart").val();
	        var workEnd = $("#upWorkEnd").val();
	
	        if (workStart.substring(0, 10) !== workEnd.substring(0, 10)) {
	            alert("출근일정과 퇴근일정의 날짜가 동일하지 않습니다!!\n다시 확인해주세요!!");
	        } else if (workStart > workEnd) {
	            alert("퇴근일자에 출근일자보다 이전의 시간은 올 수 없습니다!\n다시 확인해주세요!!");
	        }
	    });
	    
	
	
		request.fail(function(jqXHR, textStatus){
			alert("Request failed: " + textStatus);
	
		});
	});
