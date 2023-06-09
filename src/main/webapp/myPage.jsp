<!-- 
사용자 마이페이지 화면
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>COSMOS</title>
<link rel="icon" type="image/x-icon" href="${path}/images/favicon.ico">
<style>
	html, body {
		height: 100%;
	}

	#wrap {
		background-color: #FFFFFF;
		width: 100%;
		max-width: 1200px;
		margin: 0 auto;
		padding: 36px 24px 84px;
		height: auto;
		min-height: calc(100vh - 64px);
		display: flex;
		justify-content: flex-start;
	}

	/* ------------------------------------------------------- */

	sidebar {
		max-height: 100vh;
		overflow-x: auto;
		overflow-y: hidden;
		width: 25%;
	}

	sidebar > div {
		width: 100%;
	}

	#sidebar-title {
		color: black ;
		padding-left: 12px;
	}
	
	#sidebar-title > span {
		letter-spacing: 0.17em;
	}

	.btn-toggle::before {
		margin-right: 10px;
		line-height: 0;
		content: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='rgba%280,0,0,.5%29' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M5 14l6-6-6-6'/%3e%3c/svg%3e");
		transition: transform .35s ease;
		transform-origin: .5em 50%;
	}

	.btn-toggle[aria-expanded="true"]::before {
		transform: rotate(90deg);
	}

	.btn-toggle-nav a {
		width: 150px;
		padding: 0.8rem 0 0.8rem 1rem;
		margin-top: 1rem;
		margin-left: 1.5rem;
		color: black;
		font-size: 14px;
	}
	
	.btn-toggle-nav a:hover,
	.btn-toggle-nav a:focus {
		background-color: rgba(0, 0, 0, 0.04);
		color: black;
		cursor: pointer;
	}

	/* ------------------------------------------------------- */

	contents {
		width: 100%;
		margin-left: 24px;
		margin-bottom: 24px;
	}

	#update-pw, #delete-account {
		height: 500px;
	}

	.my-page-content > div {
		width: 100%;
	    height: 100%;
	    margin-top: 28px;
	    padding: 24px;
	    background-color: #F9FAFB;
	    border-radius: 24px;
	    display: flex;
	    justify-content: center;
	    align-items: flex-start;
	}

	/* ------------------------------------------------------- */
	
	#inner {
		width: 100%;
		height: auto;
		margin-bottom: 36px;
	}

	thead.thead {
		background-color: #FAE6D4;
	}
	
	#my-code-list .container tr > td:nth-child(1),
	#my-code-list .container tr > th:nth-child(1) {
		width: 5%;
		text-align: center;
	}
	
	#my-code-list .container tr > th:nth-child(2),
	#my-code-list .container tr > th:nth-child(3) {
		width: 15%;
	}
	
	#my-code-list .container tr > th:nth-child(4) {
		width: 2%;
	}
	
	#my-code-list .container tr > td:nth-child(5),
	#my-code-list .container tr > th:nth-child(5) {
		width: 6%;
		text-align: center;
	}
	
	#my-mark-code-list .container tr > td:nth-child(1),
	#my-mark-code-list .container tr > th:nth-child(1) {
		width: 5%;
		text-align: center;
	}
	
	#my-mark-code-list .container tr > th:nth-child(2),
	#my-mark-code-list .container tr > th:nth-child(3) {
		width: 15%;
	}
	
	#my-mark-code-list .container tr > th:nth-child(4) {
		width: 1%;
	}
	
	#my-mark-code-list .container tr > th:nth-child(5) {
		width: 4%;
	}
	
	#my-mark-code-list .container tr > td:nth-child(6),
	#my-mark-code-list .container tr > th:nth-child(6) {
		width: 6%;
		text-align: center;
	}
	
	table.table tbody td {
		color: black ;
		font-size: 15px;
		font-weight: 300;
	}
	
	#right-contents a {
		color: inherit;
		text-decoration: none;
	}
	
	#right-contents a:hover {
		text-decoration: underline;
	}

	#update-pw form,
	#delete-account > div > div {
		width: 50%;
	}

	.form-group {
		text-align: left;
		margin-top: 24px;
	}
	
	.form-control {
		width: 448px;
	}

	.form-group label {
		margin-bottom: 4px;
	}
	
	.new-pw1-state-msg,
	.new-pw2-state-msg {
		display: none;
	}

	img[alt="valid"] {
		height: 18px;
		margin: -3px 7px auto 3px;
	}

	img[alt="warning"] {
		height: 24px;
		margin: -3px 4px 0px 0px;
	}

	.form-group > span {
		color: gray;
		font-size: 13px;
		font-weight: 100;
		height: 24px;
	}
	
	#submit-btn, #delete-acount-btn {
		margin-top: 48px;
		width: 100%;
		height: 42px;
		background-color: gray;
		border: none;
	}

	#delete-acount-btn {
		background-color: rgb(238, 119, 133);
	}

	#delete-acount-btn:hover {
		background-color: rgb(255, 0, 0);
	}
	
	/* ------------------------------------------------------- */

	.zandi {
		border-spacing: 4px ;
		border-collapse: separate ;
		height: 100px !important;
	}
	
	.zandi_tbody td {
		border-radius: 4px;
		width: 15px ;
		height: 15px ;
		background-color : #EBEDF0 ;
	}
	
	.zandi-tooltip .zandi-tooltiptext {
		 visibility: hidden ;
		 width: 120px ;
		 background-color: black! important;
		 color: #fff ;
		 text-align: center ;
		 border-radius: 6px ;
		 padding: 5px 0 ;
		 position: absolute ;
		 z-index: 1 ;
	}
	
	.zandi-tooltip:hover .zandi-tooltiptext {
		 visibility: visible ;
	}
	
	.zandi-tooltip .zandi-tooltip-bottom {
		 width: 120px ;
		 top: 150% ;
		 left: 50% ;
		 margin-left: -60px ;
	}
	
	.zandi-tooltip .zandi-tooltip-bottom::after {
		 bottom: 100% ;
		 left: 50% ;
		 margin-left: -5px;
		 border-color: transparent transparent black transparent ;
	}
	
	.zandi th {
		border: 1px solid #DC3545 ;
		background-color : #DC3545 ;
		color : #ffffff ;
	}
	
</style>

</head>
<body>

	<%@ include file="common/header.jsp" %>
	
	<div id="wrap">
		<sidebar class="d-flex flex-nowrap">
			<div class="flex-shrink-0 p-3">
				<a id="sidebar-title" href="${path}/mypage.do" class="d-flex align-items-center pb-3 mb-3 link-body-emphasis text-decoration-none border-bottom">
					<span class="fs-5 fw-semibold">마이페이지</span>
				</a>
				<ul class="list-unstyled ps-0">
					<li class="mb-1">
						<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="true"> 나의 활동</button>
						<div class="collapse show" id="home-collapse">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
								<li>
									<a onclick="myCodeList()" class="link-body-emphasis d-inline-flex text-decoration-none rounded">내 코드 모아보기</a>
								</li>
								<li>
									<a onclick="myMarkCodeList()" class="link-body-emphasis d-inline-flex text-decoration-none rounded">좋아요 표시한 코드</a>
								</li>
							</ul>
						</div>
					</li>
					<li class="border-top my-3"></li>
					<li class="mb-1">
						<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="false"> 내 정보 관리</button>
						<div class="collapse" id="account-collapse">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
								<li><a onclick="modifyAccount()" class="link-dark d-inline-flex text-decoration-none rounded">비밀번호 수정</a></li>
								<li><a onclick="deleteAccount()" class="link-dark d-inline-flex text-decoration-none rounded">회원 탈퇴</a></li>
							</ul>
						</div>
					</li>
				</ul>
			</div>
		</sidebar>

		<contents>
			<div id="right-contents">
				<div id="my-code-list" class="my-page-content">
					<div id="inner">
						<div id="cal"></div>
					</div>
					<h3>내 코드 모아보기</h3>
					<div>
						<div class="container mt-3">
							<table class="table table-striped table-hover">
								<thead class="thead">
									<tr>
										<th>코드 번호</th>
										<th>문제명</th>
										<th>스터디명</th>
										<th>언어</th>
										<th>제출 날짜</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${myCodes}" var="codelist">
										<tr>
											<td><a href="${path}/showcode.do?studyno=${codelist.sg_no}&quizno=${codelist.quiz_no}#${codelist.code_no}">${codelist.code_no}</a></td>
											<td><a href="${codelist.quiz_url}" target="_blank">${codelist.quiz_title}</a></td>
											<td><a href="${path}/studymain.do?studyno=${codelist.sg_no}">${codelist.sg_name}</a></td>
											<td>${codelist.code_lang}</td>
											<td>${codelist.code_date}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div id="my-mark-code-list" class="my-page-content">
					<h3>좋아요 표시한 코드</h3>
					<div>
						<div class="container mt-3">
							<table class="table table-striped table-hover">
								<thead class="thead">
									<tr>
										<th>코드 번호</th>
										<th>문제명</th>
										<th>스터디명</th>
										<th>언어</th>
										<th>작성자</th>
										<th>제출 날짜</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${markCodes}" var="codelist">
										<tr>
											<td><a href="${path}/showcode.do?studyno=${codelist.sg_no}&quizno=${codelist.quiz_no}#${codelist.code_no}">${codelist.code_no}</a></td>
											<td><a href="${codelist.quiz_url}" target="_blank">${codelist.quiz_title}</a></td>
											<td><a href="${path}/studymain.do?studyno=${codelist.sg_no}">${codelist.sg_name}</a></td>
											<td>${codelist.code_lang}</td>
											<td>${codelist.member_name}</td>
											<td>${codelist.code_date}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div id="update-pw" class="my-page-content">
					<h3>비밀번호 수정</h3>
					<div>
						<form action="${path}/updatepwd.do" method="post">
							<div class="form-group">
								<label for="current-pw">현재 비밀번호</label>
								<input type="password" class="form-control" id="current-pw" name="current-pw" required placeholder="현재 비밀번호를 입력해주세요">
							</div>
							<div class="form-group">
								<label for="new-pw1">새로운 비밀번호</label>
								<input type="password" class="form-control" id="new-pw1" name="new-pw1" required placeholder="최소 6자 이상 (영문, 숫자 필수)">
								<span id="new-pw1-value-valid" class="new-pw1-state-msg"><img alt="valid" src="${path}/images/icon-valid.png">Valid.</span>
								<span id="new-pw1-value-invalid" class="new-pw1-state-msg"><img alt="warning" src="${path}/images/icon-warning.png">영문, 숫자를 포함하여 최소 6자 이상 입력해주세요.</span>
							</div>
							<div class="form-group">
								<label for="new-pw2">새로운 비밀번호 확인</label>
								<input type="password" class="form-control" id="new-pw2" name="new-pw2" required placeholder="동일한 비밀번호를 입력해주세요">
								<span id="new-pw2-value-valid" class="new-pw2-state-msg"><img alt="valid" src="${path}/images/icon-valid.png">Valid.</span>
								<span id="new-pw2-value-invalid" class="new-pw2-state-msg"><img alt="warning" src="${path}/images/icon-warning.png">Text</span>
							</div>
							<div>
								<button id="submit-btn" type="submit" class="btn btn-danger" style="pointer-events: auto; cursor: not-allowed;" disabled="disabled">조건을 충족해주세요</button>
							</div>
						</form>
					</div>
				</div>
				<div id="delete-account" class="my-page-content">
					<h3>회원 탈퇴</h3>
					<div>
						<div>
							<div class="form-group">
								<label for="pw-comfirm">비밀번호</label>
								<input type="password" class="form-control" id="pw-comfirm" name="pw-comfirm" required placeholder="비밀번호를 입력해주세요">
							</div>
							<div>
								<button id="delete-acount-btn" type="submit" class="btn btn-danger">회원 탈퇴</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</contents>
	</div>
	
	<%@ include file="common/footer.jsp" %>

	<script>
		$(function(){
			myCodeList();
			
			$('#new-pw1').keyup(func_pw1_check);
			$('#new-pw1, #new-pw2').keyup(func_pw2_check);
			$('.form-control').keyup(check);
		});
	
		// 비밀번호 수정하고나서 메세지 알림창
		let message = "${message}";
		if(message){
			if(message == "current password is WRONG"){
				alert('현재 비밀번호가 올바르지 않습니다.');
			} else if(message == "password modified successfully"){
				alert('비밀번호가 정상적으로 수정되었습니다.');
			}
			message = null;
			$(function(){
				modifyAccount();
			});
		}

		function myCodeList(){
			$('.form-control').val('');
			$('.my-page-content').css('display', 'none');
			$('#my-code-list').css('display', 'block');
		}

		function myMarkCodeList(){
			$('.form-control').val('');
			$('.my-page-content').css('display', 'none');
			$('#my-mark-code-list').css('display', 'block');
		}

		function modifyAccount(){
			$('.form-control').val('');
			$('.my-page-content').css('display', 'none');
			$('#update-pw').css('display', 'block');
		}
		function deleteAccount(){
			$('.form-control').val('');
			$('.my-page-content').css('display', 'none');
			$('#delete-account').css('display', 'block');
		}

		const regexNumber = /[0-9]/; // 정규표현식 숫자
		const regexAlphabet = /[a-zA-Z]/; // 정규표현식 문자

		let pw1IsOk = false;
		function func_pw1_check() { // 비밀번호-1 조건 체크 메서드
			let pw1 = $(this).val(); // 입력된 pw1

			if(pw1.length == 0) { // 길이 0이면 두 알림 숨김.
				$('.new-pw1-state-msg').css('display', 'none');
				pw1IsOk = false;
			} else {
				if(pw1.length < 6 || !regexNumber.test(pw1) || !regexAlphabet.test(pw1)) { // 길이가 6미만이거나 영문, 숫자 포함하지 않으면 valid 숨기고 invalid 표시.
					$('.new-pw1-state-msg').css('display', 'none');
					$('#new-pw1-value-invalid').css('display', 'inline-block');
					pw1IsOk = false;
				} else { // 비밀번호 조건 통과시 invalid 숨기고 valid 표시.
					$('.new-pw1-state-msg').css('display', 'none');
					$('#new-pw1-value-valid').css('display', 'inline-block');
					pw1IsOk = true;
				}
			}
		}

		let pw2IsOk = false;
		function func_pw2_check() { // 비밀번호-2 조건 체크 메서드
			let pw2 = $('#new-pw2').val(); // 입력된 pw2

			if(pw2.length == 0) { // 길이 0이면 두 알림 숨김.
				$('.new-pw2-state-msg').css('display', 'none');
				pw2IsOk = false;
			} else {
				if(pw1IsOk){ // 비밀번호-1 조건 통과 시
					if($('#new-pw1').val() === pw2){ // pw1과 pw2가 같으면
						$('.new-pw2-state-msg').css('display', 'none');
						$('#new-pw2-value-valid').css('display', 'inline-block');
						pw2IsOk = true;
					} else { // pw1과 pw2가 다르면
						$('.new-pw2-state-msg').css('display', 'none');
						$('#new-pw2-value-invalid').html('<img alt="warning" src="${path}/images/icon-warning.png">동일한 비밀번호를 입력해주세요.');
						$('#new-pw2-value-invalid').css('display', 'inline-block');
						pw2IsOk = false;
					}
				} else { // 비밀번호-1 조건 불충족 시
					$('.new-pw2-state-msg').css('display', 'none');
					$('#new-pw2-value-invalid').html('<img alt="warning" src="${path}/images/icon-warning.png">조건에 맞춰 비밀번호를 다시 입력해주세요.');
					$('#new-pw2-value-invalid').css('display', 'inline-block');
					pw2IsOk = false;
				}
			}
		}

		function check(){ // 조건 충족 여부를 판단하는 메서드
			if(pw2IsOk && $('#current-pw').val()){
				$('#submit-btn').removeAttr('disabled');
				$('#submit-btn').css({'cursor':'pointer', 'background-color':'rgba(238, 119, 133, 0.6)', 'pointer-events':'auto'});
				$('#submit-btn').text('수정');
				$('#submit-btn').hover(function(){
					$(this).css('background-color','rgba(238, 119, 133, 1)');
				}, function() {
					$(this).css('background-color','rgba(238, 119, 133, 0.6)');
				});
			} else {
				$('#submit-btn').attr('disabled', 'disabled');
				$('#submit-btn').css({'cursor':'not-allowed', 'background-color':'gray', 'pointer-events':'auto'});
				$('#submit-btn').text('조건을 충족해주세요');
			}
		}
		
		$("#delete-acount-btn").on("click", function() {
			let check = confirm("회원을 탈퇴하시겠습니까?\n작성한 코드와 좋아요가 전부 삭제됩니다.");
			if(check){
				$.ajax({
					url : "${path}/deletemember.do",
					data : {
						memberNo : '${user.member_no}',
						memberId : '${user.member_id}',
						memberPwd : $('#pw-comfirm').val(),
					},
					success : function(message) {
						if(message=='1'){
							alert("탈퇴가 정상적으로 처리되었습니다.");
							location.href = "${path}";
						} else if(message=='-1'){
							alert("스터디장은 회원 탈퇴가 불가능합니다.");
						} else if(message=='-2'){
							alert("비밀번호를 확인해주세요.");
						} else {
							alert("회원 탈퇴 실패");
						}
						$(function(){
							deleteAccount();
						});
					},
					error : function(message) {
						console.log(message);
					}
				});
			}
		});

		/* ------------------------------------------------------- */

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
							text += "<td class='zandi-tooltip' data-month = "+(k+1)+"-"+num+"><span class='zandi-tooltiptext'>"
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
				
			for (let i = 0; i < myDate.length; i++) {  //받아온 코드 올린 날짜들만큼 for문 돌림
			    var date = new Date(myDate[i]);
			    var mon = date.getMonth();
			    var day = date.getDate();
			    var codeDate = mon+1+"-"+day;  //날짜를 4-27형태로 바꿈
			    
			    $(".zandi-tooltip").each(function(index, item){
					if(codeDate ==$(item).attr("data-month") ){//날짜에 해당하는 td
						$(this).attr("style","background-color: #D8A1AB !important;");  //색깔
					}
				});
			}
		});
	
	</script>

	<c:set var="message" value="" scope="session"/>
</body>
</html>