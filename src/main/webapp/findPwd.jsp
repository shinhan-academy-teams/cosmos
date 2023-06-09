<!-- 
비밀번호 초기화 화면
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>COSMOS</title>
<link rel="icon" type="image/x-icon" href="${path}/images/favicon.ico">
<style>
	html, body {
		height: 100%;
	}

	#nav-wrap{
		display: none;
	}
	
	#wrap {
		width: 720px;
		padding: 0px 48px;
		margin: 0 auto;
		vertical-align: middle;
		display: flex;
	}
	
	#wrap > div {
		width: 420px;
		margin: 128px auto 64px;
		text-align: center;
	}

	img[alt="vertical-logo"] {
		height: 72px;
	}

	#wrap > div > h2 {
		font-size: 27px;
		line-height: 2rem;
		margin-top: 24px;
	}
	
	#wrap > div > p {
		margin-top: 12px;
		margin-bottom: 36px;
		font-size: 14px;
		font-weight: 300;
	}
	
	.form-group {
		text-align: left;
		margin-top: 24px;
	}
	
	.form-control {
		width: 448px;
	}
	
	label {
		margin-bottom: 4px;
	}
	
	#find-pw-btn {
		margin-top: 48px;
		width: 100%;
		height: 42px;
		background-color: rgba(238, 119, 133, 0.6);
		border: none;
	}
	
	#find-pw-btn:hover {
		background-color: rgba(238, 119, 133, 1);
	}

</style>
</head>
<body>
	<%@ include file="common/header.jsp" %>
	<div id="wrap">
		<div>
			<a href="${path}">
				<img alt="vertical-logo" src="${path}/images/logo-vertical.png"/>
			</a>
			<h2>계정 찾기</h2>
			<p>해당 이메일 주소로 임시 비밀번호가 발송됩니다.</p>
			<div>
				<form action="${path}/findpwd.do" method="post">
					<div id="form-id-div" class="form-group">
						<label for="id">아이디</label>
						<input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력해주세요" value="${parameterId}" required autofocus>
					</div>
					<div class="form-group">
						<label for="email">이메일</label>
						<input type="email" class="form-control" id="email" name="email" placeholder="이메일을 입력해주세요" value="${parameterEmail}" required>
					</div>
					<div id="form-name-div" class="form-group">
						<label for="username">실명</label>
						<input type="text" class="form-control" id="username" name="username" placeholder="실명을 입력해주세요" required>
					</div>
					<div id="btn-div">
						<button id="find-pw-btn" type="submit" class="btn btn-danger">비밀번호 초기화</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script>
		// 비밀번호 초기화 화면에서 오입력 시, 메세지 알림창
		let message = "${message}";
		if(message){
			if(message == "can NOT find user by id or WRONG input datas"){
				alert('입력한 정보를 다시 확인해주세요');
			}
			message = null;
		}
	</script>

	<c:set var="message" value="" scope="session"/>
</body>
</html>