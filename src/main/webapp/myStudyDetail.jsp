<!-- 
스터디 메인 화면
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
	#wrap {
		background-color: #FFFFFF;
		width: 100%;
		max-width: 1200px;
		margin: 0 auto;
		padding: 36px 24px 84px;
		height: auto;
		min-height: calc(100vh - 64px);
		display: flex;
		vertical-align: middle;
	}
	#rightInfo{
		margin-top : 53px;
		width: 150px;
		height: 410px;
		box-sizing : border-box;
		padding : 10px;
		display: inline-flex;
		flex-direction: column;
		position sticky;
		border: 2px solid #ddd;
		top : 74px;
		border-radius:4px;
		float: right;
	}
	
	#contents{
		margin: 0px auto auto 0px;
		flex-direction: column;
		width: auto;
		box-sizing : border-box;
		padding : 10px;
		display: inline-flex;
		flex-direction: column;
		
	}
	.header{
		margin: auto;
		width: 950px;
		padding : 10px;
		font-weight: 900;
	}
	.introduce{
		margin: auto;
		width: 950px;
		padding : 10px;
		display: inline-flex;
		box-sizing : border-box;
		border: 2px solid #ddd;
		border-radius:4px;
	}
	.lang{
		margin: auto;
		width: 950px;
		padding : 10px;
	}
	
</style>
</head>

<body id="top">
	<%@ include file="common/header.jsp"%>
	
	<div id="wrap">
		<%@ include file="createQuizModal.jsp" %>
	</div>
	
	<%@ include file="common/footer.jsp"%>
</body>
</html>