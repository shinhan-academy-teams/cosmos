<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8" />
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.5/index.global.min.js"></script>
    <script>
    var allQuiz ='${allQuiz}';
    var arr = eval("(" + allQuiz + ")");
    console.log(arr);
    for(let i=0;i<allQuiz.length;i++){
 
    }
    
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
          events: [{ title: "A+B", 
        	  start: "2023-04-21", 
        	  end: "2023-04-21",
        	  url: "https://www.acmicpc.net/problem/1000"}],
        });

        calendar.render();
      });
    </script>
    
    <style>
    	#calendar {
    		margin-top: 24px;
    		height: 30%;
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
  </head>
  <body>
    <div id="calendar"></div>
  </body>
</html>