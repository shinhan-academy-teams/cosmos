<!-- 
스터디 그룹 생성 화면
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		display: block;
	}
	
	.table>:not(caption) > * > * {
		border-bottom-color: white;
	}
	
	tbody > tr > td {
		vertical-align: middle;
	}

	tbody > tr:last-child > td {
		vertical-align: baseline;
	}
	
	#container {
		width: 80%;
		margin: 0 auto;
	}
	
	#create-study-btn-div {
		margin: -12px 7px;
		align-items: center;
	}
	
	#create-study-btn-div button {
		width: 80px;
		background-color: rgba(238, 119, 133, 0.6);
	    border: 0.8px solid rgb(206, 212, 218);
	    color: white;
		border-radius: 8px;
		font-size: 18px;
		float: right;
	}

	td > textarea {
		resize: none;
		height: 180px;
	}
	
</style>
</head>

<body>
	<%@ include file="common/header.jsp"%>

	<div id="wrap">
		<div id="container">
			<table class="table table-boardered">
				<tr>
					<td>스터디 이름</td>
					<td><input type="text" class="form-control" id="studyName"></td>
				</tr>
				<tr>
					<td>그룹장</td>
					<td><input type="text" class="form-control" name="sg_manager"
						value="${user.member_name}" readonly></td>
				</tr>
				<tr>
					<td>최대인원</td>
					<td><input class="form-control" type="number" id="maxPeople" max="20" min="1"></td>
				</tr>
				<tr>
					<td>사용 언어</td>
					<td>
						<select id="lang" class="form-select" aria-label="lang-list">
							<option value="Java">Java</option>
							<option value="Python">Python</option>
							<option value="JavaScript">JavaScript</option>
							<option value="C">C</option>
							<option value="C++">C++</option>
							<option value="C#">C#</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>그룹 소개</td>
					<td>
						<textarea rows="5" cols="40" id="info" class="form-control" placeholder="1000자 이내로 작성해주세요"></textarea>
					</td>
				</tr>
			</table>
			<div id="create-study-btn-div">
				<button id="create" >만들기</button>
			</div>
		</div>
	</div>
	<%@ include file="common/footer.jsp"%>
</body>
<script>
	let studyinfo;
	$("#info").on('keyup', function(){
		studyinfo = $("#info").val().replaceAll(/(\n|\r\n)/g, "<br>");
	});
	
	$("#create").on("click", function() {
		$.ajax({
			url : "${path}/creategroup.do",
			type : "post",
			data : {
				studyName : $('#studyName').val(),
				memberNo : '${user.member_no}',
				maxPeople : $('#maxPeople').val(),
				lang : $('#lang').val(),
				info : studyinfo
			},
			success : function(message) {
				alert(message);
				location.href = "${path}/studygroup.do"
			},
			error : function() {
				console.log(message)
			}
		});

	});

</script>
</html>