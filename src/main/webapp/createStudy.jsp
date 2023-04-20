<!-- 
스터디 그룹 생성 화면
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
		vertical-align: middle;
	}
	.table>:not(caption)>*>* {
    padding: 0.5rem 0.5rem;
    background-color: var(--bs-table-bg);
    border-bottom-color: white;
    box-shadow: inset 0 0 0 9999px var(--bs-table-accent-bg);
	}
	
	#td-right{
		padding-left: 70%;
	}
	
	
</style>
</head>

<body>
	<%@ include file="common/header.jsp"%>

	<div id="wrap">
			<table class="table table-boardered">
				<tr>
					<th>스터디 이름</th>
					<td><input type="text" class="form-control" id="studyName"></td>
				</tr>
				<tr>
					<th>그룹장</th>
					<td><input type="text" class="form-control"
						name="sg_manager" value="${user.member_name }" readonly></td>
				</tr>

				<tr>
					<th>최대인원</th>
					<td>
						<input type="number" id="maxPeople">
						
					</td>
				</tr>
				<tr>
					<th>사용언어</th>
					<td><select id="lang" class="form-control">
							<option value="Java">Java</option>
							<option value="Python">Python</option>
							<option value="JavaScript">JavaScript</option>
							<option value="C">C</option>
							<option value="C++">C++</option>
							<option value="C#">C#</option>
					</select></td>
				</tr>
				
				<tr>
					<th>그룹소개</th>
					<td><textarea rows="5" cols="40" id="info"
							class="form-control" placeholder="1000자 이내로 작성해주세요"></textarea></td>
				</tr>

				<tr>
					<td id="td-right" colspan="2"><button id="create" class="btn btn-primary">생성</button> 
					<button id="cancle" class="btn btn-danger">취소</button></td>
				</tr>

			</table>
	</div>
	<%@ include file="common/footer.jsp"%>
</body>
<script>	
	$("#create").on("click",function(){
		if("${user}"===''){
			alert("로그인이 필요합니다.");
			location.href="${path}/creategroup.do"
		} else {
			$.ajax({
				url:"${path}/creategroup.do",
				type:"post",
				data:{
					studyName:$('#studyName').val(),
					memberNo:'${user.member_no}',
					maxPeople:$('#maxPeople').val(),
					lang:$('#lang').val(),
					info:$('#info').val()
				},
				success:function(message){
					alert(message);
					location.href="${path}/studygroup.do"
				},
				error:function(){
					console.log(message)
				}
			});
		}
	});
	
	$("#cancle").on("click",function(){
	});
</script>
</html>