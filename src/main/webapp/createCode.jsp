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
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.13.1/styles/vs2015.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/highlight.min.js"></script>
  <script>hljs.initHighlightingOnLoad();</script>
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
	#dynamicTbody td{
		border-bottom: 1px solid black;
	}
	
	
</style>
</head>

<body>
	<%@ include file="common/header.jsp"%>

	<div id="wrap">
		<div>Code List</div>
		<div id="insertCode">코드 입력창
				<!-- <form action="" method="post" enctype="multipart/form-data"> -->
	            <textarea id="content"></textarea>
	            <button onclick="inputCode()">작성</button>
	        	<!-- </form> -->
		</div>
		<hr>

		<div>코드 업로드된 창
		<pre><code id="result" class="language-javascript">
		function inputComment(){
		var ic = new Array();
		var html ='';
		
		var comment = $("#comment").val();
		</code></pre>
		</div>
		
		<table id="dynamicTable">
			<thead>
				<tr>
					<th>작성자</th>
					<th>댓글내용</th>
					<th>작성일자</th>
				</tr>
			</thead>
			<tbody id="dynamicTbody">
			</tbody>
		</table>
		<hr>

		<div id="div-text">
			<!-- <form name="commentInsertForm" method="post" enctype="multipart/form-data"> -->
				<div>댓글</div>
				<div>
					<textarea id="comment" placeholder="댓글입력해라"></textarea>
					<div>
						<button>취소</button>
						<button onclick="inputComment()">등록</button>
					</div>
				</div>
			<!-- </form> -->
		</div>
	</div>
	<%@ include file="common/footer.jsp"%>
</body>

<script>

	//tap키
	$("#content").keydown(function(e) {
	
	if(e.keyCode === 9) { // tab was pressed
	
	     // get caret position/selection
	     var start = this.selectionStart;
	     var end = this.selectionEnd;
	
	     var $this = $(this);
	     var value = $this.val();
	
	     // set textarea value to: text before caret + tab + text after caret
	     $this.val(value.substring(0, start)
	                    + "\t"
	                    + value.substring(end));
	
	     // put caret at right position again (add one for the tab)
	     this.selectionStart = this.selectionEnd = start + 1;
	
	     // prevent the focus lose
	     e.preventDefault();
	 }
	});
	
	window.onload=function(){
		document.getElementById("inputCode").onclick=inputCode;
	}
	
	function inputCode(){
		var codecontent = document.getElementById("content");
		var lines = codecontent.value.split("\n");
		
	//code enter html형식으로 뿌리기
	var resultString = "";
	for(var i=0;i<lines.length;i++){
		resultString += lines[i] + "<br />";
	}
	resultString = resultString.replaceAll("\t","&emsp;");
	//resultString += "</p>";
	
	//코드 올라가는부분에 출력
	 var   blk   = document.getElementById("result");
	 blk.innerHTML  =  resultString; 
	 
	}
	

	function inputComment(){
		var ic = new Array();
		var html ='';
		
		var comment = $("#comment").val();
		
		/* 현재날짜 */
		var today = new Date();
		var year = today.getFullYear();
		var month = ('0' + (today.getMonth() + 1)).slice(-2);
		var day = ('0' + today.getDate()).slice(-2);
		var dateString = year + '-' + month + '-' + day;
		
		html += '<tr>';
		html += '<td>' + '${user.member_name}' + '</td>';
		html += '<td>' + comment + '</td>';
		html += '<td>' + dateString + '</td>';
		html += '<hr>'
		html += '</tr>';

		$("#dynamicTable").append(html);

	}
</script>
</html>