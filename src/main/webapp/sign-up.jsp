<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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

	img[alt="logo-vertical"] {
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

	#id-value-valid, #id-value-invalid,
	#pw1-value-valid, #pw1-value-invalid,
	#pw2-value-valid, #pw2-value-invalid {
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
	
	#submit-btn {
		margin-top: 48px;
		width: 100%;
		height: 42px;
		background-color: gray;
		border: none;
	}
	
	#submit-btn:hover {
		background-color: rgba(238, 119, 133, 1);
	}
	
</style>
</head>
<body id="top">
	<%@ include file="common/header.jsp" %>
	<div id="wrap">
		<div>
			<a href="${path}">
				<img alt="logo-vertical" src="${path}/images/logo-vertical.png"/>
			</a>
			<h2>COSMOS에 오신 것을 환영합니다.</h2>
			<p>COSMOS는 알고리즘 그룹 스터디 플랫폼입니다.</p>
			<div>
				<form action="${path}/signup.do" method="post"> <!-- https://www.w3schools.com/bootstrap5/bootstrap_form_validation.php -->
					<div class="form-group">
						<label for="id">아이디</label>
						<input type="text" class="form-control" id="id" name="id" required placeholder="4~15자 이내로 입력해주세요">
						<span id="id-value-valid"><img alt="valid" src="${path}/images/icon-valid.png">Valid.</span>
						<span id="id-value-invalid"><img alt="warning" src="${path}/images/icon-warning.png">4~15자 이내로 입력해주세요.</span>
					</div>
					<div class="form-group">
						<label for="pw1">비밀번호</label>
						<input type="password" class="form-control" id="pw1" name="pw1" required placeholder="최소 6자 이상(영문, 숫자 필수)">
						<span id="pw1-value-valid"><img alt="valid" src="${path}/images/icon-valid.png">Valid.</span>
						<span id="pw1-value-invalid"><img alt="warning" src="${path}/images/icon-warning.png">영문, 숫자를 포함하여 최소 6자 이상 입력해주세요.</span>
					</div>
					<div class="form-group">
						<label for="pw2">비밀번호 확인</label>
						<input type="password" class="form-control" id="pw2" name="pw2" required placeholder="동일한 비밀번호를 입력해주세요">
						<span id="pw2-value-valid"><img alt="valid" src="${path}/images/icon-valid.png">Valid.</span>
						<span id="pw2-value-invalid"><img alt="warning" src="${path}/images/icon-warning.png">Text</span>
					</div>
					<div class="form-group">
						<label for="email">이메일</label>
						<input type="email" class="form-control" id="email" name="email" required placeholder="cosmos@gmail.com">
					</div>
					<div class="form-group">
						<label for="username">실명</label>
						<input type="text" class="form-control" id="username" name="username" required placeholder="홍길동">
					</div>
					<div>
						<button id="submit-btn" disabled="disabled" type="submit" class="btn btn-danger">조건을 충족해주세요</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	
	<script>
		// 중복 체크하고나서 메세지 알림창
		$(function(){
			let dupCheckResult = "${dupCheckResult}";
			if(dupCheckResult){
				alert('아이디 혹은 이메일이 이미 존재합니다.');
				dupCheckResult = null;
			}
		})
		
		// 아이디 처리
		let idIsOk = false;
		$('#id').keyup(func_id_check); // 아이디 input창에 입력이 생길 때
		function func_id_check() { // 아이디 조건 체크 메서드
			let length = $(this).val().length; // 입력된 id 길이

			if(length == 0) { // 길이 0이면 두 알림 숨김.
				$('#id-value-valid').css('display', 'none');
				$('#id-value-invalid').css('display', 'none');
				idIsOk = false;
			} else {
				if(length < 4 || length > 15) { // 길이가 4미만이거나 15초과이면 valid 숨기고 invalid 표시.
					$('#id-value-valid').css('display', 'none');
					$('#id-value-invalid').css('display', 'inline-block');
					idIsOk = false;
				} else { // 길이가 4이상이고 15이하이면 invalid 숨기고 valid 표시.
					$('#id-value-invalid').css('display', 'none');
					$('#id-value-valid').css('display', 'inline-block');
					idIsOk = true;
				}
			}
		}

		// 비밀번호 처리
		let regexNumber = /[0-9]/; // 정규표현식 숫자
		let regexAlphabet = /[a-zA-Z]/; // 정규표현식 문자
		let pw1IsOk = false;
		$('#pw1').keyup(func_pw1_check); // 비밀번호-1 조건 체크
		function func_pw1_check() { // 아이디 조건 체크 메서드
			let pw1 = $(this).val(); // 입력된 pw1

			if(pw1.length == 0) { // 길이 0이면 두 알림 숨김.
				$('#pw1-value-valid').css('display', 'none');
				$('#pw1-value-invalid').css('display', 'none');
				pw1IsOk = false;
			} else {
				if(pw1.length < 6 || !regexNumber.test(pw1) || !regexAlphabet.test(pw1)) { // 길이가 6미만이거나 영문, 숫자 포함하지 않으면 valid 숨기고 invalid 표시.
					$('#pw1-value-valid').css('display', 'none');
					$('#pw1-value-invalid').css('display', 'inline-block');
					pw1IsOk = false;
				} else { // 비밀번호 조건 통과시 invalid 숨기고 valid 표시.
					$('#pw1-value-invalid').css('display', 'none');
					$('#pw1-value-valid').css('display', 'inline-block');
					pw1IsOk = true;
				}
			}
		}

		let pw2IsOk = false;
		$('#pw1').keyup(func_pw2_check);
		$('#pw2').keyup(func_pw2_check);
		function func_pw2_check() { // 비밀번호-2 조건 체크
			let pw2 = $('#pw2').val(); // 입력된 pw2

			if(pw2.length == 0) { // 길이 0이면 두 알림 숨김.
				$('#pw2-value-valid').css('display', 'none');
				$('#pw2-value-invalid').css('display', 'none');
				pw2IsOk = false;
			} else {
				if(pw1IsOk){ // 비밀번호-1 조건 통과 시
					if($('#pw1').val() === pw2){ // pw1과 pw2가 같으면
						$('#pw2-value-invalid').css('display', 'none');
						$('#pw2-value-valid').css('display', 'inline-block');
						pw2IsOk = true;
					} else { // pw1과 pw2가 다르면
						$('#pw2-value-valid').css('display', 'none');
						$('#pw2-value-invalid').html('<img alt="warning" src="${path}/images/icon-warning.png">동일한 비밀번호를 입력해주세요.');
						$('#pw2-value-invalid').css('display', 'inline-block');
						pw2IsOk = false;
					}
				} else { // 비밀번호-1 조건 불충족시
					$('#pw2-value-valid').css('display', 'none');
					$('#pw2-value-invalid').html('<img alt="warning" src="${path}/images/icon-warning.png">조건에 맞춰 비밀번호를 다시 입력해주세요.');
					$('#pw2-value-invalid').css('display', 'inline-block');
					pw2IsOk = false;
				}
			}
		}
		
		setInterval(check, 500, idIsOk, pw2IsOk);
		function check(){
			if(idIsOk && pw2IsOk && $('#email').val() && $('#username').val()){
				$('#submit-btn').removeAttr('disabled');
				$('#submit-btn').css('background-color', 'rgba(238, 119, 133, 0.6)');
				$('#submit-btn').text('회원가입');
			} else {
				$('#submit-btn').attr('disabled', 'disabled');
				$('#submit-btn').css('background-color', 'gray');
				$('#submit-btn').text('조건을 충족해주세요');
			}
		}

	</script>
	
	<c:set var="dupCheckResult" value="" scope="session"/>
</body>
</html>