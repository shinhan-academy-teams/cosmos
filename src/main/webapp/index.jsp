<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cosmos</title>
	<link rel="icon" type="image/x-icon" href="${path}/images/favicon.ico">
</head>
<style>
	@font-face {
	    font-family: 'GmarketSansMedium';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}

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
	
	
	
	img[alt="home"] {
		margin: auto 0px;
		height: 500px;
	}
	
	#home-content {
		font-family: 'GmarketSansMedium';
		display: inline-block;
		text-align: center;
		margin: auto 0px;
		margin-left: -80px;
		font-size: 2em;
	}
	
	.initial-span {
		font-family: 'GmarketSansMedium';
		color: rgb(238, 119, 133);
		font-weight: 600;
	}
	
	#content2-span {
		font-family: 'GmarketSansMedium';
		font-size: 0.6em;
	}
	
	#content3-span {
		font-family: 'GmarketSansMedium';
		font-weight: 600;
	}
	
	#home-content > button {
		background-color: #EE7785;
		border: none;
		width: 200px;
		height: 60px;
		margin-top: 24px;
		border-radius: 25px;
		font-size: 18px;
	}
	
	#home-content > button:hover {
		background-color: #dc3545;
	}
	
	
	
</style>
<body id="top">
	<%@ include file="common/header.jsp" %>
	<div id="wrap">
		<img alt="home" src="${path}/images/img_home.png">
		<div id="home-content">
			<span class="initial-span">코</span>딩 <span class="initial-span">스</span>터디 <span class="initial-span">모</span>여서 <span class="initial-span">스</span>타트!<br>
			<span id="content2-span">나에게 맞는 스터디를 찾아<br>코드드 리뷰도 편하게</span><br>
			<span id="content3-span">코스모스를 지금 시작하세요!</span><br>
			<button type="button" class="btn btn-danger">스터디 찾으러 가기</button>
		</div>
	</div>
	<%@ include file="common/footer.jsp" %>
</body>
</html>