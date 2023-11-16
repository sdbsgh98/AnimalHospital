

$(function(){
			
		var request = $.ajax({				
		url:'/work/addWork',
	    method:"POST",			
		dataType:"json"
		});		

			
	request.done(function(data){
	
		
		console.log(data);
	
		var calendarEl = document.getElementById('calendar');
		let nowDate = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().slice(0, 16);
		
		
		$('#closeBtn').on("click",function(){
                let workDate = $("#workDate").val();
                let workTime = $("#workTime").val();
                let homeTime = $("#homeTime").val();
		});
		
		
		var calendar= new FullCalendar.Calendar(calendarEl, {
			height:'600px',
			expandRows:true,
			customButtons:{
				myCustomButton:{
					text:"근무일정 추가",
					click : function(){
						$('#addModal').modal("show");
						
						//현재날짜를 min으로 설정
						let dateElement = document.getElementById('workDate');
						      					
       					dateElement.value = nowDate;
       					dateElement.setAttribute("min", nowDate);
       						
						//등록버튼클릭시
						$('#addCalendar').on("click", function(){

                        	let username = $("#username").val();
                        	let deptName = $("#deptName").val();
                        	let positionName = $("#positionName").val();
                        	let empName = $("#empName").val();
                            let workDate = $("#workDate").val();
                            let workTime = $("#workTime").val();
                            let homeTime = $("#homeTime").val();
							
						
			
							var param = {
                            		"username" : username,
                            		"deptName" : deptName,
                            		"positionName" : positionName,
                            		"empName" : empName,
                                    "workDate" : workDate,
                                    "workTime" : workTime,
                                    "homeTime" : homeTime
                                };
							
							
							$.ajax({
								url:'/work/addWork',
								data:JSON.stringify(param),
								method:"POST",												
								contentType: "application/json",
								success : function(data){
									alert("일정 추가 성공!");
									location.href="/workSchedule/workList";							
								}
							})

						});				
					}
				}
			},
			headerToolbar: {
				left: 'prev,next,today,myCustomButton',
				center: 'title',
				right: 'dayGridMonth,timeGridWeek'
			},
			initialView:'dayGridMonth',
			events: data,
			navLinks: true,
			navLinkDayClick:function(date,jsEvent){
				console.log(date);
				$("#addModal").modal("show");
				console.log('coords',jsEvent.pageX,jsEvent.pageY);
			},
			editable: false,
			selectable: true,
			locale: 'ko',
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
						
						$("#detailModal").modal("show");
						$("#workNo").val(detail.workNo);
						$("#getDeptName").val(detail.deptName);
						$("#getPositionName").val(detail.positionName);
						$("#getEmpName").val(detail.empName);
						$("#getWorkDate").val(detail.workDate);						
						$("#getWorkTime").val(detail.workTime);
						$("#getHomeTime").val(detail.homeTime);
						
						
						 //수정버튼클릭시
						$("#modifyBtn").on("click", function(){	
							 var workDate =  $("#getWorkDate").val();
						
							 var daterst = workDate>=nowDate
					
						    console.log(daterst);
							
							if(daterst==true){							
								$("#detailModal").modal("hide");
								$("#updateModal").modal("show");
								
								$("#upWorkDate").val(detail.workDate);
								$("#upWorkTime").val(detail.workTime);
								$("#upHomeTime").val(detail.homeTime);
							}
							
					   })				
											            													
					}
				 })
				 
				 //삭제버튼클릭시
				 $("#deleteBtn").on("click",function(){
							console.log(param);
							$.ajax({
								url:"/surgery/scheduleDelete",
								data:JSON.stringify(param),
								method:"POST",
								contentType: "application/json",
								success : function(data){
									console.log("delete");
									
									$("#detailModal").modal("hide");
									
									location.href="/surgery/schedule";
								}								 
							})
				 })	
				 
				 
				 //수정등록버튼클릭시
				 $("#updateBtn").on("click",function(){
					 		var upname = $("#upname").val();
							
					 		var surgeryNo = $("#surgeryNo").val();				 
							var customerNo = $("#getcustomerNo").val();
																		
							var username= $("#upusername").val();							
							var surgeryStart = $("#upstartdate").val();
							var surgeryEnd=$("#upenddate").val();
							var surgeryRoom=$("#upsurno").val();
							var surgeryName=$("#upsurname").val();
							
							
							var param = {"surgeryNo":surgeryNo, "customerNo":customerNo, "userName":username, "surgeryStart":surgeryStart,
										 "surgeryEnd":surgeryEnd, "surgeryRoom":surgeryRoom, "surgeryName":surgeryName}
							
							console.log(param);
							$.ajax({
										url:"/surgery/scheduleUpdate",
										data:JSON.stringify(param),
										method:"POST",
										contentType: "application/json",
										success : function(data){
											console.log("surgery update성공")					
											location.href="/surgery/schedule";
										}							 
						 	})		   
								
				 })				

			},

		eventAdd:function(obj){
			console.log(obj)
		},
		

		});
		calendar.render();
		});
	
	request.fail(function(jqXHR, textStatus){
		alert("Request failed: " + textStatus);

	});
	
});