<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	#wrap {
		background-color: #FFFFFF;
		width: 100%;
		max-width: 1200px;
		margin: 0 auto;
		padding: 36px 24px 84px;
		height: auto;
		min-height: calc(99vh - 60px);
		display: flex;
		flex-direction: column;
		vertical-align: middle;
	}
	#wrap > div{
		background-color: red;
		width : 100%;
		height : fit-content;
	}
	.code-border{
		border: 1xp solid black;
	}
	#wrap > #insertCode{
		background-color: white;
		width : 100%;
		height: 500px;
		border: 2px solid #ddd;
		border-radius: 4px;
	}
	#wrap > button{
		width: fit-content;
		margin-inline-start: auto;
	}
	
	
	
</style>
</head>

<body>
	<%@ include file="common/header.jsp"%>

	<div id="wrap">
		<div>Code List</div>
		<div id="insertCode">코드 입력창</div>
		<button>저장</button>
		<hr>
		
		<div id="insertCode">코드 업로드된 창</div>
		<div>댓글</div>
			
	</div>
	
	<%@ include file="common/footer.jsp"%>
</body>
</html>