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

	#form-id-div {
		visibility: hidden;
		opacity: 0;
		height: 0px;
		transition: 2s;
	}
	
	#find-id-btn {
		margin-top: 48px;
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
<body id="top">
	<%@ include file="common/header.jsp" %>
	<div id="wrap">
		<div>
			<a href="${path}">
				<img alt="vertical-logo" src="${path}/images/logo-vertical.png"/>
			</a>
			<h2>계정 찾기</h2>
			<p>회원 가입시 입력하신 이메일 주소를 입력해주세요.</p>
			<div>
				<form>
					<div class="form-group">
						<label for="email">이메일</label>
						<input type="email" class="form-control" id="email" name="email" required placeholder="이메일을 입력해주세요">
					</div>
					<div id="form-id-div" class="form-group">
						<label>아이디</label>
						<input type="text" class="form-control" value="이메일로 select 해온 아이디 출력">
					</div>
					<div id="btn-div">
						<button id="find-id-btn" type="button" class="btn btn-danger">아이디 찾기</button>
					</div>
				</form>
				<div id="form-bottom-div">
					<span><a href="${path}/find-pw.jsp">비밀번호 초기화</a></span>
				</div>
			</div>
		</div>
	</div>

	<script>
		// 아이디 찾기
		let regexEmail = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		$('#find-id-btn').click(func_id_find); // 아이디 찾기 버튼 클릭 시
		function func_id_find() {
			if(!$('#email').val()) {
				console.log('입력없음');
			} else {
				console.log($('#email').val());
				$('#form-id-div').css({'visibility': 'visible', 'opacity':'1', 'height': 'auto'});
			}
		}
		// 백에서 이메일로 아이디를 select해오면 그 결과를 value로 고정해두기

	</script>
</body>
</html>