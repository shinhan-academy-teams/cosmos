<!-- 
문제 풀이 코드 입력 화면
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
	#insertCode {
		background-color: #F9FAFB;
		width: 100%;
		height: auto;
		margin: 24px 0;
		padding: 24px;
		border-radius: 12px;
		display: none;
	}
	
	#quizTitle {
		width: 100%;
		margin: 4px 0 12px;
		text-align: center;
	}
	
	#quizTitle + div {
	    display: flex;
	    align-items: baseline;
	    justify-content: space-between;
	}
	
	#quizTitle + div {
		margin-bottom: 12px;
	}
	
	#lang {
		width: 180px;
	}
	
	#insertCode textarea {
		width: 100%;
		height: 400px;
		resize: none;
	}
	
	#create-code-btn-div {
		margin: 18px 0 0 auto;
	    width: max-content;
	}
	
	#insertCode button {
		margin-left: 8px;
		width: fit-content;
	}
	
</style>
<script>
	//코드 제출 여부에 따른 버튼 활성화
	function isSubmit(message){
		if(message == '작성한 코드 없음'){
			$('#submit-other').attr('disabled', 'disabled');
			$('#submit-other').css({'cursor':'not-allowed', 'background-color':'gray','border':'gray' ,'pointer-events':'auto' });
		} else {
			$('#submit-other').removeAttr('disabled');
			$('#submit-other').css({'cursor':'pointer', 'background-color':'#dc3545', 'pointer-events':'auto' });
			$('#submit-other').hover(function(){
				$(this).css('background-color','#bb2d3b');
			}, function() {
				$(this).css('background-color','#dc3545');
			});
		}
	}
</script>
<div id="insertCode">
	<div id="quizTitle"></div>
	<div>
		<div id="quizURL"></div>
		<select id="lang" class="form-select" aria-label="lang-select">
			<option value="Java">Java</option>
			<option value="Python">Python</option>
			<option value="JavaScript">JavaScript</option>
			<option value="C">C</option>
			<option value="C++">C++</option>
			<option value="C#">C#</option>
		</select>
	</div>
	<textarea id="content" class="form-control" placeholder="나의 풀이를 입력하세요"></textarea>
	<div id="create-code-btn-div">
		<button id="submit-other" class="btn btn-danger" onclick="allCode()">다른 사람의 풀이</button>
		<button id="submit" class="btn btn-danger" onclick="createcode()">제출</button>
	</div>
</div>

