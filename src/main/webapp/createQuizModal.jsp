<!-- 
데일리 문제 생성 모달창
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
	.container {
		width: 100%;
	    position: relative;
		z-index: 1000;
	}
	
	.modal-btn-box {
		width: 100%;
		text-align: center;
		
	}
	
	.modal-btn-box button {
		display: inline-block;
		width: 150px;
		height: 50px;
		background-color: rgba(238, 119, 133, 0.8);
   		border-radius: 8px;
   		color: white;
		border: 1px solid #e1e1e1;
	}
	.modal-btn-box button:hover {
		background-color: rgba(238, 119, 133, 1);
	}
	
	.popup-wrap {
		background-color: rgba(0, 0, 0, .3);
		justify-content: center;
		align-items: center;
		position: fixed;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
		display: none;
		padding: 15px;
	}
	
	.popup {
		width: 100%;
		max-width: 400px;
		background-color: #ffffff;
		border-radius: 10px;
		overflow: hidden;
		background-color: #ee7785;
		box-shadow: 5px 10px 10px 1px rgba(0, 0, 0, .3);
	}
	
	.popup-head {
		width: 100%;
		height: 50px;
		display: flex;
		align-items: center;
		justify-content: center;
	}
	
	.head-title {
		font-size: 38px;
		font-style: italic;
		font-weight: 700;
		letter-spacing: -3px;
		text-align: center;
		color : white;
	}
	
	.popup-body {
		width: 100%;
		background-color: #ffffff;
	}
	
	.body-content {
		width: 100%;
		padding: 10px;
	}
	
	.body-titlebox {
		text-align: center;
		width: 100%;
		height: 40px;
		margin-bottom: 10px;
	}
	
	.body-contentbox {
		word-break: break-word;
		overflow-y: auto;
		min-height: 100px;
		max-height: 200px;
	}
	
	.popup-foot {
		width: 100%;
		height: 50px;
	}
	
	.pop-btn {
		display: inline-flex;
		width: 50%;
		height: 100%;
		float: left;
		justify-content: center;
		align-items: center;
		color: #ffffff;
		cursor: pointer;
	}
	
	.pop-btn.confirm {
		background-color: #ee7785;
		border: none;
		border-right: 3px solid #ffff;
	}
	td{
		padding: 10px;
	}
	.td-input1 {
		width: 274px;
	}
	.td-input2 {
		width: 274px;
	}
</style>

<div class="container">
	<div class="modal-btn-box">
		<button type="button" id="modal-open">Create Daily Quiz</button>
	</div>

	<div class="popup-wrap" id="popup">
		<div class="popup">
			<div class="popup-head">
				<span class="head-title">Daily Quiz</span>
			</div>
			<form action="<%=request.getContextPath()%>/createQuiz.do?studyno=<%=request.getParameter("studyno") %>" method="post">
				<div class="popup-body">
					<div class="body-content">
						<div class="body-contentbox">
							<table>
								<tr>
									<td>문제 제목</td>
									<td><input class="td-input1 form-control" type="text" name="quizTitle" maxlength="16" required></td>
								</tr>
								<tr>
									<td>문제 링크</td>
									<td>
										<input class="td-input2 form-control" type="text" name="quizUrl" required>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div class="popup-foot">
					<input type="submit" class="pop-btn confirm" value="생성" > 
					<span class="pop-btn" id="close">창 닫기</span>
				</div>
			</form>
		</div>
	</div>
</div>


<script>
	$(function() {
		$("#modal-open").click(function() {
			$("#popup").css('display', 'flex').hide().fadeIn();
		});
		
		$("#close").click(function() {
			modalClose();
		});
		
		function modalClose() {
			$("#popup").fadeOut();
		}
	});
</script>

