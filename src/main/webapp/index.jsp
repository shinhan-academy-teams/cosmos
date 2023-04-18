<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COSMOS</title>
<link rel="icon" type="image/x-icon" href="${path}/images/favicon.ico">
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
		background-color: #FFFFFF;
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
		display: inline-block;
		text-align: center;
		margin: auto 0px;
		margin-left: -90px;
	}
	
	#home-content * {
		font-family: 'GmarketSansMedium';
	}
	
	#content1-span{
		font-size: 1.8em;
	}
	
	.initial-span {
		color: #EE7785;
		font-weight: 700;
	}
	
	#content2-span {
		display: inline-block;
		padding: 6px 0px 12px;
		font-size: 1.4em;
	}
	
	#content3-span {
		font-size: 2.1em;
		font-weight: 700;
	}
	
	#home-content > button {
		background-color: #EE7785;
		border: none;
		width: 200px;
		height: 60px;
		margin-top: 24px;
		border-radius: 27px;
		font-size: 18px;
		padding-top: 10px;
	}
	
	#home-content > button:hover {
		background-color: #dc3545;
	}
	
</style>
</head>

<body id="top">
	<%@ include file="common/header.jsp" %>
	<div id="wrap">
		<img alt="home" src="${path}/images/img-home.png">
		<div id="home-content">
			<span id="content1-span">
				<span class="initial-span">코</span>딩 <span class="initial-span">스</span>터디 <span class="initial-span">모</span>여서 <span class="initial-span">스</span>타트!<br>
			</span>
			<span id="content2-span">나에게 맞는 스터디를 찾아<br>코드 리뷰도 편하게</span><br>
			<span id="content3-span">코스모스를 지금 시작하세요!</span><br>
			<button type="button" class="btn btn-danger">스터디 찾으러 가기</button>
		</div>
	</div>
	<%@ include file="common/footer.jsp" %>
</body>
</html>