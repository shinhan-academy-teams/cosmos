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
	
	
</style>
</head>

<body>
	<%@ include file="common/header.jsp"%>

	<div id="wrap">
		<div>Code List</div>
		<div id="insertCode">코드 입력창
				<form action="" method="post" enctype="multipart/form-data">
	            <textarea name="content"></textarea>
	            <button type="submit">작성</button>
	        	</form>
		</div>
		<hr>

		<div id="insertCode">코드 업로드된 창</div>

		<table style="border: 1px;" id="dynamicTable">
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
	function inputComment(){
		var ic = new Array();
		var html ='';
		
		
		var comment = $("#comment").val();
		var today = new Date();
		
		html += '<tr>';
		html += '<td>' + '${user.member_name}' + '</td>';
		html += '<td>' + comment + '</td>';
		html += '<td>' + '${today}' + '</td>';
		html += '</tr>';

		$("#dynamicTable").append(html);
		
		
		$("#comment").val('');

	}
</script>
</html>