

$(function () {
	var deptNo = $("#deptNo").val();
		
			var request = $.ajax({
				url: "/deptSchedule",
				data: {				
					deptNo:deptNo
				},
				method: "POST"				
			})
			
		
			request.done(function (data) {
				var calendarEl = document.getElementById('calendar');
				var calendar = new FullCalendar.Calendar(calendarEl, {
	
					height: '400px',
					expandRows: true,
					customButtons: {
						myCustomButton: {
							
						}
					},
					headerToolbar: {
						left: 'title',				
						right: 'prev,next,listWeek,dayGridMonth'			
				
					},
					initialView: 'listWeek',
					events: data,
					navLinks: true,
					navLinkDayClick: function (date, jsEvent) {
				
					},
					editable: false,
					selectable: true,
					locale: 'en',
					dateClick: function () {
	
					},
	
	
					//이벤트 클릭했을시 detail
					eventClick: function (info) {
			
						
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
$("#treatmentcal").on("click", function(){
	var username = $("#username").val();
	
		var request = $.ajax({
			url: "/",
			data: {
				username:username
			},
			method: "POST"				
		})
		
	
		request.done(function (data) {
			var calendarEl = document.getElementById('calendar');
			var calendar = new FullCalendar.Calendar(calendarEl, {

				height: '400px',
				expandRows: true,
				customButtons: {
					myCustomButton: {
						
					}
				},
				headerToolbar: {
					left: 'title',				
					right: 'prev,next,listWeek,dayGridMonth'			
			
				},
				initialView: 'listWeek',
				events: data,
				navLinks: true,
				navLinkDayClick: function (date, jsEvent) {
			
				},
				editable: false,
				selectable: true,
				locale: 'en',
				dateClick: function () {

				},


				//이벤트 클릭했을시 detail
				eventClick: function (info) {
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
	
})


$("#deptcal").on("click", function () {

		var deptNo = $("#deptNo").val();
	
		var request = $.ajax({
			url: "/deptSchedule",
			data: {				
				deptNo:deptNo
			},
			method: "POST"				
		})
		
	
		request.done(function (data) {
			var calendarEl = document.getElementById('calendar');
			var calendar = new FullCalendar.Calendar(calendarEl, {

				height: '400px',
				expandRows: true,
				customButtons: {
					myCustomButton: {
						
					}
				},
				headerToolbar: {
					left: 'title',				
					right: 'prev,next,listWeek,dayGridMonth'			
			
				},
				initialView: 'listWeek',
				events: data,
				navLinks: true,
				navLinkDayClick: function (date, jsEvent) {
			
				},
				editable: false,
				selectable: true,
				locale: 'en',
				dateClick: function () {

				},


				//이벤트 클릭했을시 detail
				eventClick: function (info) {
		
					
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


	
	




	
