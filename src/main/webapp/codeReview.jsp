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
		display: block;
	}
	
	.code-div > div {
		display: flex;
		margin-bottom: -15px;
	}
	
	#mark-btn {
		border: 1px solid #EE7785;
	}
	
	#wrap > #comment-div {
		width: 100%;
		height: fit-content;
	}
	
	#wrap button {
		background-color: lightgray;
		width: fit-content;
		margin-inline-start: auto;
		float: right;
	}
	
	#div-text {
		padding: 10px;
	}
	
	textarea {
		width: 100%;
		height: 90%
	}
	
	form {
		height: 100%;
	}
	
	#dynamicTbody td {
		border-bottom: 1px solid black;
	}
	
</style>
</head>

<body>
	<%@ include file="common/header.jsp"%>
	
	<script>
	$(function(){
		${markList}.forEach(function (codeNo) {
			let button = $('[value='+codeNo+']');
			if(button.val() == codeNo){
				button.css('backgroundColor', '#FAE6D4');
			}
		});
	});
	</script>

	<div id="wrap">
		<c:forEach items="${allCode}" var="code">
		<div class="code-div">
			<div>
				<h4 id="${code.code_no}">${code.member_name} 님의 풀이</h4>
				<c:set var="codeNumber" value="${code.code_no}"/>
				<button type="button" class="btn btn-outline-light text-dark" onclick="pressMark(${code.code_no})" value="${code.code_no}">❤️ ${code.mark_count}</button>
			</div>
			<pre>
				<code>${code.code_content}</code>
			</pre>
		</div>
			<div class="comment-div">
				<table style="border: 1px;" id="dynamicTable">
					<thead>
						<tr>
							<th>작성자</th>
							<th>댓글내용</th>
							<th>작성일자</th>
						</tr>
					</thead>
					<tbody id="dynamicTbody"></tbody>
				</table>
				<hr>
				<div id="div-text">
					<form name="commentInsertForm" method="post" enctype="multipart/form-data">
						<div>댓글</div>
						<div>
							<textarea id="comment-textarea" placeholder="댓글을 입력하세요"></textarea>
							<div>
								<button onclick="inputComment(${code.code_no})">등록</button>
							</div>
						</div>
					</form>
				</div>
				<br><br>
			</div>
		</c:forEach>
	</div>
	
	<%@ include file="common/footer.jsp"%>
	
	<script src="//cdn.jsdelivr.net/gh/highlightjs/cdn-release@11.7.0/build/highlight.min.js"></script>
	<script>hljs.highlightAll();</script>
</body>

<script>

	function inputComment(codeNo){
		/* var html ='';
		
		var comment = $("#comment-textarea").val();
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
		
		$("#comment-textarea").val(''); */
		
		$.ajax({
			url : "${path}/createcomments.do",
			method : "post",
			data : {
				memberNo : '${user.member_no}',
				codeNo : codeNo,
				cmtContent : $("#comment-textarea").val()
			},
			success : function(message){
				alert(message);
				location.reload();
			},
			error: function(){
				console.log(message);
			}
		});
	}
	
	
	function pressMark(codeNo){
		$.ajax({
			url : "${path}/markcode.do",
			method : "post",
			data : {
				memberNo : '${user.member_no}',
				codeNo : codeNo
			},
			success : function(message){
				//alert(message);
				if(message == 'already marked'){
					alert('이미 좋아요 표시한 코드입니다.');
				} else if(message == 'mark OK'){
					alert('좋아요!\n마이페이지 > 좋아요 표시한 코드에서 확인 가능합니다.');
				}
				location.reload();
			},
			error: function(){
				console.log(message);
			}
		});
	}

</script>
</html>