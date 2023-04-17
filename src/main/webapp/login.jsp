<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cosmos: 로그인</title>
	<link rel="icon" type="image/x-icon" href="${path}/images/favicon.ico">
</head>
<style>
	html, body {
		height: 100%;
	}

	#wrap {
		background-color: #ffffff;
		width: 100%;
		max-width: 1200px;
		margin: 0 auto;
		padding: 36px 24px 84px;
		height: auto;
		min-height: calc(99vh - 60px);
		display: flex;
		vertical-align: middle;
	}

	#nav-wrap{
		display: none;
	}
	
	#wrap > div {
		margin: 156px auto 0px;
		text-align: center;
	}

	img[alt="vertical-logo"] {
		height: 72px;
	}

	#wrap > div > h2 {
		font-size: 24px;
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
	
	button[type="submit"] {
		margin-top: 48px;
		width: 100%;	
	}
	
	label {
		margin-bottom: 4px;
	}
	
	#form-botton-div {
		margin-top: 24px;
	}
	
	#form-botton-div a {
		font-size: 14px;
		font-weight: 300;
	}
	
	#form-botton-div > span {
		padding: 0px 24px;
	}
	
	div.separator {
		display: inline-block;
		width: 1px;
		height: 16px;
		vertical-align: middle;
		background-color: #d2d2d7;
	}
	
</style>
<body id="top">
	<%@ include file="common/header.jsp" %>
	<div id="wrap">
		<div>
			<a href="${path}">
				<img alt="vertical-logo" src="${path}/images/logo-vertical.png"/>
			</a>
			<h2>COSMOS에 오신것을 환영합니다.</h2>
			<p>COSMOS는 알고리즘 그룹 스터디 플랫폼입니다.</p>
			<div>
				<form action="">
					<div class="form-group">
						<label for="id">아이디</label>
						<input type="text" class="form-control" id="id" name="id" autofocus>
					</div>
					<div class="form-group">
						<label for="pw">비밀번호</label>
						<input type="password" class="form-control" id="pw" name="pw">
						</div>
					<div>
						<button type="submit" class="btn btn-primary">로그인</button>
					</div>
				</form>
				<div id="form-botton-div">
					<span><a href="#">계정 찾기</a></span>
					<div aria-hidden="true" class="separator"></div>
					<span><a href="#">회원가입</a></span>
				</div>
			</div>
		</div>
	</div>
</body>
</html>