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
		height: 100%;
		padding: 0px 48px;
		margin: 0 auto;
		vertical-align: middle;
		display: flex;
    	/* align-items: center; */
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
				<form action="">
					<div class="form-group">
						<label for="id">아이디</label>
						<input type="text" class="form-control" id="id" name="id" required autofocus>
					</div>
					<div class="form-group">
						<label for="pw">비밀번호</label>
						<input type="password" class="form-control" id="pw" name="pw" required>
						</div>
					<div>
						<button type="submit" class="btn btn-danger">로그인</button>
					</div>
				</form>
				<div id="form-bottom-div">
					<span><a href="#">계정찾기</a></span>
					<div aria-hidden="true" class="separator"></div>
					<span><a href="${path}/sign-up.jsp">회원가입</a></span>
				</div>
			</div>
		</div>
	</div>
</body>
</html>