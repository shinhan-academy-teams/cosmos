<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
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
		let myCodes = '${myCodes.code_date}';
		console.log(myCodes);
		
		let now = new Date();
		let curYear = now.getFullYear();
		let curMonth = now.getMonth(); //3(4)
		let lastDayOfMon = [ 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];
		getLastDayOfMonth();
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
	
			for (let i = 1; i < 8; i++) {
				text += "<tr>";
				for (var k = 0; k < 12; k++) {
	
					for (let j = 0; j < 5; j++) {
						let num = eval(i + (j * 7));
						if (num <= lastDayOfMon[k]) {
							/*title="+'2023-'+(k+1)+'-'+num+"*/
							text += "<td class='tooltip' data-month = "+k+"><span class='tooltiptext'>"
									+ "2023-"
									+ (k + 1)
									+ "-"
									+ num + "<span></td>";
	
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
		});
	</script>
</body>
</html>