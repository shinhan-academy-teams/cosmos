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
		margin: 128px auto 0px;
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
	
	#form-bottom-div {
		margin-top: 24px;
	}
	
	button[type="submit"] {
		margin-top: 48px;
		width: 100%;
		height: 42px;
		background-color: rgba(238, 119, 133, 0.6);
		border: none;
	}
	
	button[type="submit"]:hover {
		background-color: rgba(238, 119, 133, 1);
	}
	
	#form-bottom-div a {
		font-size: 15px;
		font-weight: 300;
	}
	
	#form-bottom-div > span {
		padding: 0px 24px;
	}
	
	div.separator {
		display: inline-block;
		width: 1px;
		height: 16px;
		vertical-align: middle;
		background-color: #D2D2D7;
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
			<h2>COSMOS에 오신 것을 환영합니다.</h2>
			<p>COSMOS는 알고리즘 그룹 스터디 플랫폼입니다.</p>
			<div>
				<form action="" > <!-- https://www.w3schools.com/bootstrap5/bootstrap_form_validation.php -->
					<div class="form-group">
						<label for="id">아이디</label>
						<input type="text" class="form-control" id="id" name="id" required placeholder="4~15자 이내로 입력해주세요">
					</div>
					<div class="form-group">
						<label for="pw">비밀번호</label>
						<input type="password" class="form-control" id="pw" name="pw" required placeholder="최소 6자 이상(영문, 숫자 필수)">
					</div>
					<div class="form-group">
						<label for="pw-check">비밀번호 확인</label>
						<input type="password" class="form-control" id="pw-check" name="pw-check" required placeholder="동일한 비밀번호를 입력해주세요">
					</div>
					<div class="form-group">
						<label for="email">이메일</label>
						<input type="email" class="form-control" id="email" name="email" required placeholder="cosmos@gmail.com">
					</div>
					<div class="form-group">
						<label for="username">실명</label>
						<input type="text" class="form-control" id="username" name="username" required placeholder="홍길동">
					</div>
					<!-- <div class="form-group">
						<label for="nickname">닉네임</label>
						<input type="text" class="form-control" id="nickname" name="nickname" required placeholder="영문, 한글, 숫자를 20자 이하로 입력해주세요">
					</div> -->
					<div>
						<button type="submit" class="btn btn-danger">회원가입</button>
					</div>
				</form>
				<!-- <div id="form-bottom-div">
					<span><a href="#">계정찾기</a></span>
					<div aria-hidden="true" class="separator"></div>
					<span><a href="#">회원가입</a></span>
				</div> -->
			</div>
		</div>
	</div>
</body>
</html>