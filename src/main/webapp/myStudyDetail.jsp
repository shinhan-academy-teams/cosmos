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
		display: grid;
    	vertical-align: middle;
	}
	
</style>
</head>

<body id="top">
	<%@ include file="common/header.jsp"%>
	
	<div id="wrap">
		<%@ include file="createQuizModal.jsp" %>
		<%@ include file="quizCalendar.jsp" %>
	</div>
	
	<%@ include file="common/footer.jsp"%>
</body>
</html>