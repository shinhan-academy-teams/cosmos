<!-- 
문제 풀이 코드 및 댓글 화면
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<<<<<<< HEAD
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>COSMOS</title>
<link rel="icon" type="image/x-icon" href="${path}/images/favicon.ico">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.13.1/styles/vs2015.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/highlight.min.js"></script>
  <script>hljs.initHighlightingOnLoad();</script>
=======

>>>>>>> KKangBro
<style>
	
	#insertCode{
		background-color: white;
		width : 100%;
		height: 600px;
		margin-top: 36px;
		border: 2px solid #ddd;
		border-radius: 4px;
	}
	
	#insertCode textarea {
		width: 100%;
		height: 50vh;
	}
	
	#insertCode button{
		width: fit-content;
		margin-inline-start: auto;
		float:right;
	}
<<<<<<< HEAD
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
=======
>>>>>>> KKangBro
	
	
</style>

<<<<<<< HEAD
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
		<pre><code id="content" class="hljs javascript">
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
	
	function inputCode(){
		let content = document.getElementById("content");
		console.log(content.value);
	 
	}

	function inputComment(){
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
=======

<body>
		<div id="insertCode">
			<h5>코드 입력창</h5>
			<form action="" method="post" enctype="multipart/form-data">
				<textarea name="content"></textarea>
				<button type="submit">작성</button>
	       	</form>
		</div>
		
</body>
>>>>>>> KKangBro

