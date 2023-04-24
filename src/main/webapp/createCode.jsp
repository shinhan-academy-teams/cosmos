<!-- 
문제 풀이 코드 입력 화면
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
	
</style>



<div id="insertCode">
	<h5>코드 입력창</h5>
	<form action="${path}/createcode.do" method="post" enctype="multipart/form-data">
		<textarea name="content"></textarea>
		<button type="submit">작성</button>
	</form>
</div>

