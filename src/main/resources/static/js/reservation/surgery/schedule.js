

$(function(){
			
		var request = $.ajax({				
		url:"/surgery/schedule",
	    method:"POST",			
		dataType:"json"
		});		

			
	request.done(function(data){
	
		
		console.log(data);
	
		var calendarEl = document.getElementById('calendar');
		let nowDate = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().slice(0, 16);
		
		
	
		
		var calendar= new FullCalendar.Calendar(calendarEl, {
			height:'600px',
			expandRows:true,
			customButtons:{
				myCustomButton:{
					text:"수술실 예약",
					click : function(){
						$('#addModal').modal("show");
						
						//현재날짜를 min으로 설정
						let dateElement = document.getElementById('surgeryStart');
						let dateElement2 = document.getElementById('surgeryEnd');
						      					
       					dateElement.value = nowDate;
       					dateElement.setAttribute("min", nowDate);
       					
       					$("#surgeryStart").on("change",function(){
							dateElement2.value = $("#surgeryStart").val();
       						dateElement2.setAttribute("min", $("#surgeryStart").val());
       						dateElement2.setAttribute("max", $("#surgeryStart").val());
						})
					
       					
       					//고객검색버튼 눌렀을때
						$("#customerSearch").on("click", function(){
							var animalName=$("#animalName").val();				
							
							$.ajax({
								url:"/surgery/customerList",
								data:{
									animalName:animalName
								},
								method: "POST",
								success : function(data){
									if(data.length==0){
										$("#animalName").val("");
										alert("일치하는 고객정보가 없습니다!다시 입력해주세요")										
									}else{									
										$("#listModal").modal("show");
										console.log(data);
										$("#customer").empty();
										
										//조회된 결과
										for(let i =0; i <data.length; i++){										
											let animal = data[i].animalName;
											let name = data[i].name;
											let no = data[i].customerNo;
											
										    let inputElement = $('<input>', { type: 'radio', name: 'cusCheck', value:no});
										
										    $("#customer").append($('<br>'))
	                  						$("#customer").append(inputElement);
	                  						$("#customer").append(name);                 					          				
                  						}								
									}
									
								 //보호자선택하고 등록 눌렀을때
								  $('#submit').click(function() {
									var customerNo =  $("input[type=radio][name=cusCheck]:checked").val();
									console.log(customerNo);
       								
       								$("#customerNo").val(customerNo);
       								$("#listModal").modal("hide");
       							  })
																								
								}
							
							})						
						})
       			
								
					}
				}
			},
			headerToolbar: {
				left: 'prev,next,today,myCustomButton',
				center: 'title',
				right: 'dayGridMonth,timeGridWeek'
			},
			initialView:'timeGridWeek',
			events: data,
			navLinks: true,
			navLinkDayClick:function(date,jsEvent){
				console.log(date);
				$("#addModal").modal("show");
				console.log('coords',jsEvent.pageX,jsEvent.pageY);
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
			
				 var surgeryNo=info.event.id;
				 console.log(surgeryNo);
				 var param={"surgeryNo":surgeryNo}				

				$.ajax({
					url:"/surgery/scheduleDetail",
					data: JSON.stringify(param),
					method:"POST",
					contentType: "application/json",
					success : function(detail){
						
						console.log("detail 전송성공");
						console.log(detail);
						console.log(detail.animalName);
						
						$("#detailModal").modal("show");
						$("#surgeryNo").val(detail.surgeryNo);
						$("#getanimalName").val(detail.animalName);
						$("#getcustomerName").val(detail.name);
						$("#getempname").val(detail.empName);
						$("#getcustomerNo").val(detail.customerNo);						
						$("#getsurno").val(detail.surgeryRoom);
						$("#getsurname").val(detail.surgeryName);
						$("#getstartdate").val(detail.surgeryStart);
						$("#getenddate").val(detail.surgeryEnd);
						
						
						 //수정버튼클릭시
						$("#modifyBtn").on("click", function(){	
							 var treatdate =  $("#getstartdate").val();
						
							 var daterst = treatdate>=nowDate
					
						    console.log(daterst);
							
							if(daterst==true){							
								$("#detailModal").modal("hide");
								$("#updateModal").modal("show");
								
								$("#upname").val(detail.animalName);
								$("#upsurno").val(detail.surgeryRoom);
								$("#upsurname").val(detail.surgeryName);
								$("#upusername").val(detail.userName);
								
								$("#upstartdate").val(detail.surgeryStart);
								$("#upenddate").val(detail.surgeryEnd);
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
		
			//등록버튼클릭시
						$('#addBtn').on("click", function(){

							var customerNo = $("#customerNo").val();
							var userName = $("#username").val();
							var surgeryRoom = $("#surgeryRoom").val();
							var surgeryName = $("#surgeryName").val();
							var surgeryStart = $("#surgeryStart").val();
							var surgeryEnd = $("#surgeryEnd").val();
							
						
			
							var param = {"customerNo":customerNo, "userName":userName, "surgeryRoom":surgeryRoom,
											"surgeryName":surgeryName, "surgeryStart":surgeryStart, "surgeryEnd":surgeryEnd};
							
							
							$.ajax({
								url:"/surgery/scheduleAdd",
								data:JSON.stringify(param),
								method:"POST",												
								contentType: "application/json",
								success : function(data){
									console.log(data);
									console.log("수술예약!!!");
									location.href="/surgery/schedule";							
								}
							})

						});	
		
			$('#closeBtn').on("click",function(){
							$("#customerNo").val("");
							$("#animalName").val("");
							$("#username").val("");
							$("#surgeryRoom").val("");
							$("#surgeryName").val("");
							$("#surgeryStart").val("");
							$("#surgeryEnd").val("");
					
		    });
		
		
		
		
		
		calendar.render();
		});
	
	request.fail(function(jqXHR, textStatus){
		alert("Request failed: " + textStatus);

	});
	
});