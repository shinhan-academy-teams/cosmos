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
	
	#nav-wrap {
		position: static !important;
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
	
	#wrap > div.vision {
		margin-bottom: 48px;
	}
	
	#quiz-info-div {
		background-color: #F9FAFB;
		width: 100%;
		height: auto;
		margin: 24px 0;
		padding: 24px;
		border-radius: 8px;
		text-align: center;
	}
	
	#quiz-title-div {
		width: 100%;
		margin: 4px 0 12px;
	}
	
	.code-div > div.code-title-div {
	    display: flex;
	    margin-bottom: 4px;
	    align-items: flex-end;
	}
	
	img[alt="mark"] {
		height: 20px;
		vertical-align: sub;
	}
	
	#wrap .code-title-div button {
		background-color: #FFFFFF;
		border: 2px solid #E6E6E6;
		width: fit-content;
		margin-inline-start: auto;
	}
	
	#wrap .code-title-div button:hover {
		border: 2px solid red;
	}

	#wrap > .comment-div {
		width: 100%;
		margin-top: -12px;
	}
	
	table.dynamicTable {
		width: 100%;
		margin-bottom: 12px;
	}

	.dynamicTbody > tr > th {
		color: black;
		font-weight: 300;
		font-size: 15px;
		vertical-align: middle;
	    height: 45px;
	}
	
	img[alt=person] {
		height: 32px;
	}
	
	.dynamicTbody > tr > th:nth-child(1) {
		width: 50px;
	}

	.dynamicTbody > tr > th:nth-child(2) {
		width: 80%;
	}

	.dynamicTbody > tr > th:nth-child(3),
	.dynamicTbody > tr > th:nth-child(4) {
		text-align: right;
		color: gray;
		font-weight: 100;
		font-size: 14px;
	}
	
	.cmt-input-div {
		display: flex;
	    justify-content: space-between;
	    align-items: center;
	}
	
	.cmt-input-div > input {
		width: 93%;
	}
	
	.cmt-input-div > button {
		width: 6%;
	}
	
	.cmt-input-div > button:hover {
		border: 1px solid rgb(206, 212, 218);
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
					button.find('img').attr('src', 'images/icon-heart-marked.png');
				}
			});
			
			let cmtData = eval("(" + '${cmtMap}' + ")");
			
			for(let key in cmtData) {
			    let valueList = cmtData[key];
		    	let random = Math.floor(Math.random() * 10);
			    valueList.forEach(function(item, index, array) {
			    	let num = (index + random) % 10;
			    	
			    	let thInComment = '<tr>';
			    	thInComment += '<th><img alt="person" src="images/comment/person-'+ num +'.png"></th>';
			    	thInComment += '<th>' + item.cmt_content + '</th>';
			    	thInComment += '<th>' + item.member_name + '</th>';
			    	thInComment += '<th>' + item.cmt_date + '</th>';
			    	thInComment += '</tr>';
			    	
			    	let idElement = $('#' + key).next().next().find('tbody');
			    	
			    	idElement.append(thInComment);
			    });
			}
			
		});
	
	</script>

	<div id="wrap">
		<div id="quiz-info-div">
			<div id="quiz-title-div">
				<h2>${quizTitle}</h2>
			</div>
			<div id="quiz-url-div">
				<a href="${quizUrl}" target="_blank">${quizUrl}</a>
			</div>
		</div>
		<c:forEach items="${allCode}" var="code">
			<div id="${code.code_no}" class="vision"></div>
			<div class="code-div">
				<div class="code-title-div">
					<h5>${code.member_name} 님의 ${code.code_lang} 풀이</h5>
<%-- 					<button type="button" class="btn btn-outline-light text-dark" onclick="pressMark(${code.code_no})" value="${code.code_no}">❤️ ${code.mark_count}</button>--%>
						<button type="button" class="btn btn-outline-light text-dark" onclick="pressMark(${code.code_no})" value="${code.code_no}">
							<img alt="mark" src="${path}/images/icon-heart-none.png"> ${code.mark_count}
						</button>
				</div>
				<pre><code>${code.code_content}</code></pre>
			</div>
			<div class="comment-div">
				<table class="dynamicTable">
					<tbody class="dynamicTbody"></tbody>
				</table>
				<div class="cmt-input-div">
					<input name="${code.code_no}" class="comment-textarea form-control" placeholder="댓글을 입력하세요" required></input>
					<button class="btn btn-outline-light text-dark" onclick="inputComment(${code.code_no})">등록</button>
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
	const urlParams = new URL(location.href).searchParams;
	const sgNo = urlParams.get('studyno');
	const quizNo = urlParams.get('quizno');
	
	
	$('input').on('keyup', function(e){ // 엔터로 댓글 등록함.
		let codeNo = $(this).attr("name");
		if(e.keyCode === 13){
			inputComment(codeNo);
		}
	});
	
	function inputComment(codeNo){
		let inputElement = $('#' + codeNo).next().next().find('input');
		$.ajax({
			url : "${path}/createcomments.do",
			method : "post",
			data : {
				memberNo : '${user.member_no}',
				codeNo : codeNo,
				cmtContent : inputElement.val(),
				sgNo : sgNo,
				quizNo : quizNo
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
				if(message == 'already marked'){
					alert('이미 좋아요 표시한 코드입니다.');
				} else if(message == 'mark OK'){
					alert('좋아요 완료!\n마이페이지 > 좋아요 표시한 코드에서 확인 가능합니다.');
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