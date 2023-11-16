

$(function(){
			

		var calendarEl = document.getElementById('calendar');
		var calendar= new FullCalendar.Calendar(calendarEl, {
			
			height:'600px',
			expandRows:true,
			customButtons:{
			
			},
			headerToolbar: {
				left: 'prev,next,today,myCustomButton',
				center: 'title',
				right: 'dayGridMonth'
			},
			initialView:'dayGridMonth',
			events: data,
			navLinks: true,
			navLinkDayClick:function(date,jsEvent){
				console.log(date);			
						
			},
			editable: false,
			selectable: true,
			locale: 'ko',
			dateClick: function() {
				   				
 			},
			
			
			eventClick:function(info){		
				
			},

		eventAdd:function(obj){
			console.log(obj)
		},
		

		});	

		calendar.render();
});
	
	




	
