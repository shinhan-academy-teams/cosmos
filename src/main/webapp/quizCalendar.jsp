<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.5/index.global.min.js"></script>
    <script>
    var allQuiz ='${allQuiz}';
    var data = eval("(" + allQuiz + ")");
    let arr;
    let href;
    let quiz_no;
    const urlParams = new URL(location.href).searchParams;

    const sgNo = urlParams.get('studyno');
    
      document.addEventListener("DOMContentLoaded", function () {
        var calendarEl = document.getElementById("calendar");

        var calendar = new FullCalendar.Calendar(calendarEl, {
          timeZone: "UTC",
          initialView: "dayGridWeek",
          headerToolbar: {
            left: "prev,next",
            center: "title",
            right: "dayGridWeek,dayGridDay",
          },
          editable: false,
          events: data,
          eventClick: function(info) {
        	    arr = info.event.url.split('*');
        	    
        	    href = arr[0];
         	    quiz_no = arr[1];

         		console.log(href);
        	    console.log(quiz_no);
        	    
        	    
        	    info.el.style.borderColor = 'red';
        	  }
        });
        calendar.render();
      });
      
      function createcode() {
  		$.ajax({
  			url : "${path}/createcode.do",
  			method : "post",
  			data : {
  				quizNo : quiz_no,
  				memberNo : '${user.member_no}',
  				sgNo : sgNo,
  				codeContent : $('#content').val()
  			},
  			success : function(message) {
  				alert(message);
  				location.reload();
  			},
  			error : function() {
  				console.log(message);
  			}
  		});

      };
      
    
    $(function(){
    	$('.fc-daygrid-event-harness > a').removeAttr('href');
    });
    
    
    </script>
    
    <style>
    	#calendar {
    		margin-top: 24px;
    		height: 300px;
    	}
    	
    	.fc .fc-button-primary {
        background-color: #df9696 !important;
        border-color: #ffffff !important;
        color: #ffffff !important;
    	}

      .fc .fc-button-primary:not(:disabled).fc-button-active,
      .fc .fc-button-primary:not(:disabled):active  {
        background-color: #a14f4f !important;
    	}

      .fc .fc-daygrid-day.fc-day-today {
        background-color: #FAE6D4;
      }

      .fc a.fc-col-header-cell-cushion {
        text-decoration: none;
        color: black;
      }

    </style>

  <body>
    <div id="calendar"></div>
    
  </body>
