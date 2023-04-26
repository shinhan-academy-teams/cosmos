<!-- 
계정 찾기 화면
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>COSMOS</title>
<link rel="icon" type="image/x-icon" href="${path}/images/favicon.ico">
<style>
	html, body {
		height: 100%;
	}

	#nav-wrap{
		display: none;
	}
	
	#wrap {
		width: 720px;
		padding: 0px 48px;
		margin: 0 auto;
		vertical-align: middle;
		display: flex;
	}
	
	#wrap > div {
		width: 420px;
		margin: 128px auto 64px;
		text-align: center;
	}

	img[alt="vertical-logo"] {
		height: 72px;
	}

	#wrap > div > h2 {
		font-size: 27px;
		line-height: 2rem;
		margin-top: 24px;
	}
	
	#wrap > div > p {
		margin-top: 12px;
		margin-bottom: 36px;
		font-size: 14px;
		font-weight: 300;
	}
	
	.form-group {
		text-align: left;
		margin-top: 24px;
	}
	
	.form-control {
		width: 448px;
	}
	
	label {
		margin-bottom: 4px;
	}

	.email-state-msg {
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

	#form-id-div {
		visibility: hidden;
		opacity: 0;
		height: 0px;
		transition: height 1s cubic-bezier(0, 0.55, 0.45, 1), opacity 0.8s cubic-bezier(0.55, 0, 1, 0.45);
	}
	
	#find-id-btn {
		margin-top: 36px;
		width: 100%;
		height: 42px;
		background-color: rgba(238, 119, 133, 0.6);
		border: none;
	}
	
	#find-id-btn:hover {
		background-color: rgba(238, 119, 133, 1);
	}

	#form-bottom-div {
		margin-top: 24px;
	}
	
	#form-bottom-div a {
		font-size: 15px;
		font-weight: 300;
	}
	
	#form-bottom-div > span {
		padding: 0px 24px;
	}

</style>
</head>
<body>
	<%@ include file="common/header.jsp" %>
	
	<script>
		$(function(){
			$('#email').on('keyup', func_email_check); // 이메일 조건 체크
			$('#find-id-btn').on('click', func_findId); // 아이디 찾기 버튼 눌렀을 때
		});
	</script>
	
	<div id="wrap">
		<div>
			<a href="${path}">
				<img alt="vertical-logo" src="${path}/images/logo-vertical.png"/>
			</a>
			<h2>계정 찾기</h2>
			<p>회원 가입시 입력하신 이메일 주소를 입력해주세요.</p>
			<div>
				<form action="${path}/findid.do" method="post">
					<div class="form-group">
						<label for="email">이메일</label>
						<input type="email" class="form-control" id="email" name="email" required autofocus placeholder="이메일을 입력해주세요">
						<span id="email-value-valid" class="email-state-msg"><img alt="valid" src="${path}/images/icon-valid.png">Valid.</span>
						<span id="email-value-invalid" class="email-state-msg"><img alt="warning" src="${path}/images/icon-warning.png">올바른 이메일 형식으로 입력해주세요.</span>
					</div>
					<div id="form-id-div" class="form-group">
						<label>아이디</label>
						<input id="found-id" type="text" class="form-control" readonly>
					</div>
					<div id="btn-div">
						<button id="find-id-btn" type="button" class="btn btn-danger">아이디 찾기</button>
					</div>
				</form>
				<div id="form-bottom-div">
					<span><a id="findPwd-a" href="${path}/findpwd.do">비밀번호 초기화</a></span>
				</div>
			</div>
		</div>
	</div>

	<script>
		// 이메일 조건 체크
		const regexEmail = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		let emailIsOk = false;
		
		function func_email_check(e) {
			if(e.keyCode === 13){ // 이메일 입력하고 엔터로 아이디 찾기
				$('#find-id-btn').click();
			}

			let email = $(this).val(); // 입력된 email
			if(email.length == 0) { // 길이 0이면 두 알림 숨김.
				$('.email-state-msg').css('display', 'none');
				emailIsOk = false;
			} else {
				if(!regexEmail.test(email)) { // 이메일 조건 불충족시 valid 숨기고 invalid 표시.
					$('.email-state-msg').css('display', 'none');
					$('#email-value-invalid').html('<img alt="warning" src="${path}/images/icon-warning.png">올바른 이메일 형식으로 입력해주세요.');
					$('#email-value-invalid').css('display', 'inline-block');
					emailIsOk = false;
				} else { // 이메일 조건 충족시 invalid 숨기고 valid 표시.
					$('.email-state-msg').css('display', 'none');
					$('#email-value-valid').css('display', 'inline-block');
					emailIsOk = true;
				}
			}
		}
		
		// 아이디 찾기 버튼 눌렀을 때
		function func_findId() {
			$.ajax({
				url : "${path}/findid.do",
				method : "post",
				data : {'email' : $('#email').val()},
				success : function(responseData){
					if(responseData == 'none') {
						$('#form-id-div').css({'visibility': 'hidden', 'opacity':'0', 'height': '0px'});
						$('.email-state-msg').css('display', 'none');
						$('#email-value-invalid').html('<img alt="warning" src="${path}/images/icon-warning.png">해당 이메일 주소를 찾을 수 없습니다.');
						$('#email-value-invalid').css('display', 'inline-block');
					} else {
						$('#form-id-div').css({'visibility': 'visible', 'opacity':'1', 'height': '65.6px'});
						$('#found-id').val(responseData);
						
						let inputEmail = $('#email').val();
						let foundId = $('#found-id').val();
						let url = '${path}/findpwd.do?inputEmail=' + inputEmail + '&foundId=' + foundId;
						$('#findPwd-a').attr('href', url);
					}
				},
				error : function(message){
					console.log(message);					
				}
			});
		}

	</script>
</body>
</html>