document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
		aspectRatio: 2,
		height: '400px',
        headerToolbar: {
            left: 'prev,next',
            center: 'title',
            right: 'today'
        },
        
         editable : true
        , eventLimit : true
        , events: [
            
            {
                title : 'libft 과제이해',
                start: '2021-01-26',
                backgroundColor: "rgb(0, 185, 186)",
                textColor : "#000000"
            },
            {
                title : 'libft 코딩',
                start: '2021-01-27',
                backgroundColor: "rgb(0, 185, 186)",
                textColor : "#000000"
            },
            {
                title : 'libft 평가',
                start: '2021-01-29',
                backgroundColor: "rgb(0, 185, 186)",
                textColor : "#000000"
            },
        ]
    });
        calendar.render();
});

	
	




	
