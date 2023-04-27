<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<title>zandi</title>
<style>
.zandi {
	border-spacing: 4px;
	border-collapse: separate;
}

.zandi_tbody td {
	border-radius: 7px;
	font-size: 10px;
	width: 15px;
	height: 15px;
	background-color : #EBEDF0;
}

.tooltip .tooltiptext {
  visibility: hidden;
  width: 120px;
  background-color: black;
  color: #fff;
  text-align: center;
  border-radius: 6px;
  padding: 5px 0;

  position: absolute;
  z-index: 1;
}

.tooltip:hover .tooltiptext {
  visibility: visible;
}


.tooltip .tooltip-bottom {
  width: 120px;
  top: 150%;
  left: 50%;
  margin-left: -60px;
}


.tooltip .tooltip-bottom::after {
  bottom: 100%;
  left: 50%;
  margin-left: -5px;
  border-color: transparent transparent black transparent;
}

.zandi th {
	border: 1px solid #DC3545;
	background-color : #DC3545;
	color : #ffffff;
	
}


</style>
</head>
<body>
	<div id="cal"></div>
	<script>
		let myDate = ${myDate};  //session에 저장한 코드 올린 날짜들
		let data = eval("("+myDate+")");
		
		let now = new Date();
		let curYear = now.getFullYear(); //현재 년도
		let curMonth = now.getMonth(); //(현재 월)-1 
		
		let lastDayOfMon = [ 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];
		getLastDayOfMonth();
		
		//윤년 판단
		function getLastDayOfMonth() {

			let mon2;

			if ((curYear % 4 == 0) && (curYear % 100 != 0))
				mon2 = true;
			else if (curYear % 400 == 0)
				mon2 = true;
			else
				mon2 = false;

			lastDayOfMon[1] = (mon2) ? 29 : 28;

		}
		
		//이벤트
		document.addEventListener("DOMContentLoaded", function () {
			let text = "<table class='zandi'>"
			text += "<thead>";
			text += "<tr>";
			text += "<th colspan='5'>Jan</th>";
			text += "<th colspan='5'>Feb</th>";
			text += "<th colspan='5'>Mar</th>";
			text += "<th colspan='5'>Apr</th>";
			text += "<th colspan='5'>May</th>";
			text += "<th colspan='5'>Jun</th>";
			text += "<th colspan='5'>Jul</th>";
			text += "<th colspan='5'>Aug</th>";
			text += "<th colspan='5'>Sep</th>";
			text += "<th colspan='5'>Oct</th>";
			text += "<th colspan='5'>Nov</th>";
			text += "<th colspan='5'>Dec</th>";
			text += "</tr>";
			text += "</thead>";
			text += "<tbody class='zandi_tbody'>";
	
			//행 7개(일주일)
			for (let i = 1; i < 8; i++) {
				text += "<tr>";
				//12달
				for (var k = 0; k < 12; k++) {
					//한달 5주
					for (let j = 0; j < 5; j++) {
						let num = eval(i + (j * 7)); //html의 td는 오른쪽으로 출력이 되므로 7을 계속 더한 값
						if (num <= lastDayOfMon[k]) { //말일만큼 출력
							text += "<td class='tooltip' data-month = "+(k+1)+"-"+num+"><span class='tooltiptext'>"
									+ "2023-"
									+ (k + 1)
									+ "-"
									+ num + "<span></td>";
									//ex)2023-4-27형태로 만듬
									//툴팁 넣음
									//data-month : 4-27형태
									
							
						} else {
							text += "<td>" + "</td>";
						}
					}
	
				}
				text += "</tr>";
				
			}
	
			text += "</tbody>";
			text += "</table>";
			document.getElementById("cal").innerHTML = text;
				
			for (let i = 0; i < myDate.length; i++) {  //받아온 코드 올린 날짜들만큼 for문 돌림
			    var date = new Date(myDate[i]);
			    var mon = date.getMonth();
			    var day = date.getDate();
			    var codeDate = mon+1+"-"+day;  //날짜를 4-27형태로 바꿈
			    
			    $(".tooltip").each(function(index, item){
					if(codeDate ==$(item).attr("data-month") ){//날짜에 해당하는 td
						$(this).css("backgroundColor","#D8A1AB");  //색깔
					}
				});
			}
			
			
		});
		
		$(function(){
			
		});
	</script>
</body>
</html>