<!-- 
문제 풀이 코드 및 댓글 화면
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>COSMOS</title>
<link rel="icon" type="image/x-icon" href="${path}/images/favicon.ico">
<link rel="stylesheet" href="//cdn.jsdelivr.net/gh/highlightjs/cdn-release@11.7.0/build/styles/github-dark-dimmed.min.css">
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
		height: 600px;
		border: 2px solid #ddd;
		border-radius: 4px;
	}
	#wrap button{
		width: fit-content;
		margin-inline-start: auto;
		float:right;
	}
	#div-text{
		padding: 10px;
	}
	textarea{
		width: 100%;
		height: 90%
	}
	form{
		height : 100%;
	}
	#dynamicTbody td {
		border-bottom: 1px solid black;
	}
	
	
</style>
</head>

<body>
	<%@ include file="../common/header.jsp"%>
	
	<button onClick="history.go(-1)">목록으로</button>
	<div id="wrap">

		<div id="insertCode">
			<pre>
				<code>${myCode.code_content}</code>					
			</pre>
		</div>

		
	</div>
	<%@ include file="../common/footer.jsp"%>
	
	<script src="//cdn.jsdelivr.net/gh/highlightjs/cdn-release@11.7.0/build/highlight.min.js"></script>
	<script>hljs.highlightAll();</script>
	
</body>

<script>
	function inputComment(){
		var html ='';
		
		var comment = $("#comment").val();
		var today = new Date();
		var year = today.getFullYear();
		var month = ('0' + (today.getMonth() + 1)).slice(-2);
		var day = ('0' + today.getDate()).slice(-2);
		var dateString = year + '-' + month + '-' + day;
		
		html += '<tr>';
		html += '<td>' + '${user.member_name}' + '</td>';
		html += '<td>' + comment + '</td>';
		html += '<td>' + dateString + '</td>';
		html += '</tr>';

		$("#dynamicTable").append(html);
		
		$("#comment").val('');

	}
</script>
</html>