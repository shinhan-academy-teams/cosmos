<!-- 
문제 풀이 코드 입력 화면
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
	#insertCode, #dailyQuiz{
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

<div>
<span id="dailyQuiz"></span>
</div>
<div id="insertCode">
	<h5>코드 입력창</h5>	
		<select id="lang" class="form-control">
		<option value="Java">Java</option>
		<option value="Python">Python</option>
		<option value="JavaScript">JavaScript</option>
		<option value="C">C</option>
		<option value="C++">C++</option>
		<option value="C#">C#</option>
		</select>
		<textarea id="content"></textarea>
		<button id="submit" onclick="createcode()">작성</button>
</div>

