

$(function () {

	var deptNo =$("#deptNo").val();
	console.log(deptNo)
	
		var request = $.ajax({
			url: "/treatment/schedule",
			data: {
				deptNo:deptNo
			},
			method: "POST"				
		})
	
		request.done(function (data) {


			console.log(data);

			var calendarEl = document.getElementById('calendar');
			let nowDate = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().slice(0, 16);

			var calendar = new FullCalendar.Calendar(calendarEl, {

				height: '600px',
				expandRows: true,
				customButtons: {
					myCustomButton: {
						text: "진료예약",
						click: function () {
							$('#userdept').html('');
							$('#addModal').modal("show");

							var animalName = $("#animalName").val();
							console.log(animalName);

							var deptNo = $("#deptNo").val();
							console.log(deptNo);

							var todaydate = new Date();
							console.log(todaydate);

							//현재날짜를 min으로 설정
							let dateElement = document.getElementById('treatmentDate');
							dateElement.value = nowDate;
							dateElement.setAttribute("min", nowDate);


							$.ajax({
								url: "/treatment/empList",
								method: "POST",
								data: {
									deptNo: deptNo
								},
								success: function (data) {
									console.log(data);
									console.log("성공!!!!!!!")


									for (let i = 0; i < data.length; i++) {
										let username = data[i].username;
										let empName = data[i].empName;

										console.log(username);
										console.log(empName);

										var option = document.createElement("option");
										option.value = username;
										option.text = empName;

										$("#userdept").append(option);
									}
								}
							});


							$('#addclose').on("click", function () {
								$("#customerNo").val("");
								$("#animalName").val("");
								$("#username").val("");
								$("#name").val("");
								$("#treatmentDate").val("");
								$("#userdept").empty();
								$("#dept").val("");
							});




							//고객검색버튼 눌렀을때
							$("#customerSearch").on("click", function () {
								var animalName = $("#animalName").val();

								$.ajax({
									url: "/treatment/customerList",
									data: {
										animalName: animalName
									},
									method: "POST",
									success: function (data) {
										if (data.length == 0) {
											$("#animalName").val("");
											alert("일치하는 고객정보가 없습니다!다시 입력해주세요")
										} else {
											$("#listModal").modal("show");
											console.log(data);
											$("#customer").empty();

											//조회된 결과
											for (let i = 0; i < data.length; i++) {
												let animal = data[i].animalName;
												let name = data[i].name;
												let no = data[i].customerNo;

												let inputElement = $('<input>', { type: 'radio', name: 'cusCheck', value: no });

												$("#customer").append($('<br>'))
												$("#customer").append(inputElement);
												$("#customer").append(name);
											}
										}

										//보호자선택하고 등록 눌렀을때
										$('#submit').click(function () {
											var customerNo = $("input[type=radio][name=cusCheck]:checked").val();
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
					left: 'prev,next',
					center: 'title',
					right: 'myCustomButton,dayGridMonth'
				},
				initialView: 'dayGridMonth',
				events: data,
				navLinks: true,
				navLinkDayClick: function (date, jsEvent) {
					console.log(date);
					$("#addModal").modal("show");
				},
				editable: false,
				selectable: true,
				locale: 'en',
				dateClick: function () {

				},


				//이벤트 클릭했을시 detail
				eventClick: function (info) {
					console.log(info);

					var treatmentNo = info.event.id;

					console.log(treatmentNo);
					var param = { "treatmentNo": treatmentNo }


					$.ajax({
						url: "/treatment/scheduleDetail",
						data: JSON.stringify(param),
						method: "POST",
						contentType: "application/json",
						success: function (detail) {

							console.log("detail 전송성공");
							console.log(detail);
							console.log(detail.animalName);



							$("#detailModal").modal("show");
							$("#treatmentNo").val(detail.treatmentNo);
							$("#getanimalName").val(detail.animalName);
							$("#getcustomerName").val(detail.name);
							$("#getempname").val(detail.empName);
							$("#getcustomerNo").val(detail.customerNo);
							$("#getdate").val(detail.treatmentDate);
							$("#getusername").val(detail.username);

							//직원리스트
							$.ajax({
								url: "/treatment/empList",
								method: "POST",
								data: {
									deptNo: deptNo
								},
								success: function (data) {
									console.log("성공!!!")
									$("#updateusername").children('option').remove();
									for (let i = 0; i < data.length; i++) {
										let username = data[i].username;
										let empName = data[i].empName;

										var option = document.createElement("option");
										option.value = username;
										option.text = empName;

										$("#updateusername").append(option);
									}

								}

							});


							//수정버튼클릭시
							$("#modifyBtn").on("click", function () {
								var treatdate = $("#getdate").val();

								var daterst = (treatdate >= nowDate)

								console.log(daterst);
								if (daterst == true) {
									$("#detailModal").modal("hide");
									$("#updateModal").modal("show");
									console.log(detail.username);

									$("#updateName").val($("#getanimalName").val());
									$("#updateusername").val($("#getusername").val());
									$("#modifyDate").val($("#getdate").val());
									
									let modify = document.getElementById('modifyDate');
									modify.setAttribute("min",nowDate);
								}
							})

						}
					})

					
					//삭제버튼클릭시
					$("#deleteBtn").on("click", function () {
						
						console.log(param);
						$.ajax({
							url: "/treatment/scheduleDelete",
							data: JSON.stringify(param),
							method: "POST",
							contentType: "application/json",
							success: function (data) {
								console.log("delete");
									
								$("#detailModal").modal("hide");

								location.href = "/treatment/schedule";
							}
						})
						$("#deleteBtn").off("click");
					})
					
					




					//수정등록버튼클릭시
					$("#updateBtn").on("click", function () {

						var updateName = $("updateName").val();
						console.log(updateName);
						var treatmentNo = $("#treatmentNo").val();
						var customerNo = $("#getcustomerNo").val();

						var username = $("#updateusername").val();

						var treatmentDate = $("#modifyDate").val();
						
						
						
						
						
						

						var param = { "treatmentNo": treatmentNo, "customerNo": customerNo, "username": username, "treatmentDate": treatmentDate }

						console.log(param);
						$.ajax({
							url: "/treatment/scheduleUpdate",
							data: JSON.stringify(param),
							method: "POST",
							contentType: "application/json",
							success: function (data) {
								console.log("update성공")
								location.href = "/treatment/schedule";
							}
						})
					})

				},

				eventAdd: function (obj) {
					console.log(obj)
				},


			});

			calendar.render();
		});

		request.fail(function (jqXHR, textStatus) {
			alert("Request failed: " + textStatus);

		});

		
	//예약등록버튼클릭시
	$('#addBtn').on("click", function () {

		var customerNo = $("#customerNo").val();
		var username = $("#userdept").val();
		console.log(username);
		var treatmentDate = $("#treatmentDate").val();

		console.log(treatmentDate);

		var param = { "customerNo": customerNo, "username": username, "treatmentDate": treatmentDate };


		$.ajax({
			url: "/treatment/scheduleAdd",
			data: JSON.stringify(param),
			method: "POST",
			contentType: "application/json",
			success: function (rst) {
				console.log(rst);
				if (rst == 0) {
					alert("이미 예약된 날짜입니다!다시 선택해주세요")
					$("#treatmentDate").val("");
					$("#treatmentDate").focus();
				} else {
					$("#addModal").modal("hide");
					$("#customerNo").val("");
					$("#animalName").val("");
					$("#username").val("");
					$("#name").val("");
					$("#treatmentDate").val("");

					location.href = "/treatment/schedule";
				}
			}
		})

	  });
	});


	$("#deptNo").on("change", function () {
		var deptNo = this.value;
		
		console.log(deptNo);
		
		var request = $.ajax({
			url: "/treatment/schedule",
			data: {
				deptNo:deptNo
			},
			method: "POST"				
		})
		
	
		request.done(function (data) {


			console.log(data);

			var calendarEl = document.getElementById('calendar');
			let nowDate = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().slice(0, 16);

			var calendar = new FullCalendar.Calendar(calendarEl, {

				height: '600px',
				expandRows: true,
				customButtons: {
					myCustomButton: {
						text: "진료예약",
						click: function () {
							$('#userdept').html('');
							$('#addModal').modal("show");

							var animalName = $("#animalName").val();
							console.log(animalName);

							var deptNo = $("#deptNo").val();
							console.log(deptNo);

							var todaydate = new Date();
							console.log(todaydate);

							//현재날짜를 min으로 설정
							let dateElement = document.getElementById('treatmentDate');
							dateElement.value = nowDate;
							dateElement.setAttribute("min", nowDate);


							$.ajax({
								url: "/treatment/empList",
								method: "POST",
								data: {
									deptNo: deptNo
								},
								success: function (data) {
									console.log(data);
									console.log("성공!!!!!!!")


									for (let i = 0; i < data.length; i++) {
										let username = data[i].username;
										let empName = data[i].empName;

										console.log(username);
										console.log(empName);

										var option = document.createElement("option");
										option.value = username;
										option.text = empName;

										$("#userdept").append(option);
									}
								}
							});


							$('#addclose').on("click", function () {
								$("#customerNo").val("");
								$("#animalName").val("");
								$("#username").val("");
								$("#name").val("");
								$("#treatmentDate").val("");
								$("#userdept").empty();
								$("#dept").val("");
							});




							//고객검색버튼 눌렀을때
							$("#customerSearch").on("click", function () {
								var animalName = $("#animalName").val();

								$.ajax({
									url: "/treatment/customerList",
									data: {
										animalName: animalName
									},
									method: "POST",
									success: function (data) {
										if (data.length == 0) {
											$("#animalName").val("");
											alert("일치하는 고객정보가 없습니다!다시 입력해주세요")
										} else {
											$("#listModal").modal("show");
											console.log(data);
											$("#customer").empty();

											//조회된 결과
											for (let i = 0; i < data.length; i++) {
												let animal = data[i].animalName;
												let name = data[i].name;
												let no = data[i].customerNo;

												let inputElement = $('<input>', { type: 'radio', name: 'cusCheck', value: no });

												$("#customer").append($('<br>'))
												$("#customer").append(inputElement);
												$("#customer").append(name);
											}
										}

										//보호자선택하고 등록 눌렀을때
										$('#submit').click(function () {
											var customerNo = $("input[type=radio][name=cusCheck]:checked").val();
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
					left: 'prev,next',
					center: 'title',
					right: 'myCustomButton,dayGridMonth'
				},
				initialView: 'dayGridMonth',
				events: data,
				navLinks: true,
				navLinkDayClick: function (date, jsEvent) {
					console.log(date);
					$("#addModal").modal("show");
				},
				editable: false,
				selectable: true,
				locale: 'en',
				dateClick: function () {

				},


				//이벤트 클릭했을시 detail
				eventClick: function (info) {
					console.log(info);

					var treatmentNo = info.event.id;

					console.log(treatmentNo);
					var param = { "treatmentNo": treatmentNo }


					$.ajax({
						url: "/treatment/scheduleDetail",
						data: JSON.stringify(param),
						method: "POST",
						contentType: "application/json",
						success: function (detail) {

							console.log("detail 전송성공");
							console.log(detail);
							console.log(detail.animalName);



							$("#detailModal").modal("show");
							$("#treatmentNo").val(detail.treatmentNo);
							$("#getanimalName").val(detail.animalName);
							$("#getcustomerName").val(detail.name);
							$("#getempname").val(detail.empName);
							$("#getcustomerNo").val(detail.customerNo);
							$("#getdate").val(detail.treatmentDate);
							$("#getusername").val(detail.username);

							//직원리스트
							$.ajax({
								url: "/treatment/empList",
								method: "POST",
								data: {
									deptNo: deptNo
								},
								success: function (data) {
									console.log("성공!!!")
									$("#updateusername").children('option').remove();
									for (let i = 0; i < data.length; i++) {
										let username = data[i].username;
										let empName = data[i].empName;

										var option = document.createElement("option");
										option.value = username;
										option.text = empName;

										$("#updateusername").append(option);
									}

								}

							});


							//수정버튼클릭시
							$("#modifyBtn").on("click", function () {
								
								var treatdate = $("#getdate").val();

								var daterst = treatdate >= nowDate

								console.log(daterst);
								if (daterst == true) {
									$("#detailModal").modal("hide");
									$("#updateModal").modal("show");
									console.log(detail.username);

									$("#updateName").val($("#getanimalName").val());
									$("#updateusername").val($("#getusername").val());
									$("#modifyDate").val($("#getdate").val());
								}

							})

						}
					})


					//삭제버튼클릭시
					$("#deleteBtn").on("click", function () {
						console.log(param);
						$.ajax({
							url: "/treatment/scheduleDelete",
							data: JSON.stringify(param),
							method: "POST",
							contentType: "application/json",
							success: function (data) {
								console.log("delete");

								$("#detailModal").modal("hide");

								location.href = "/treatment/schedule";
							}
						})
					})





					//수정등록버튼클릭시
					$("#updateBtn").on("click", function () {

						var updateName = $("updateName").val();
						console.log(updateName);
						var treatmentNo = $("#treatmentNo").val();
						var customerNo = $("#getcustomerNo").val();

						var username = $("#updateusername").val();

						var treatmentDate = $("#modifyDate").val();

						var param = { "treatmentNo": treatmentNo, "customerNo": customerNo, "username": username, "treatmentDate": treatmentDate }

						console.log(param);
						$.ajax({
							url: "/treatment/scheduleUpdate",
							data: JSON.stringify(param),
							method: "POST",
							contentType: "application/json",
							success: function (data) {
								console.log("update성공")
								location.href = "/treatment/schedule";
							}
						})
					})

				},

				eventAdd: function (obj) {
					console.log(obj)
				},


			});

			calendar.render();
		});
		

		request.fail(function (jqXHR, textStatus) {
			alert("Request failed: " + textStatus);

		});



});



