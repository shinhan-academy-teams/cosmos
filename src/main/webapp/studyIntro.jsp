<!-- 
스터디 그룹 소개 및 가입 화면
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
	#rightInfo{
		margin-top : 53px;
		width: 150px;
		height: 426px;
		box-sizing : border-box;
		padding : 10px;
		display: inline-flex;
		flex-direction: column;
		position sticky;
		border: 2px solid #ddd;
		top : 74px;
		border-radius:4px;
		float: right;
	}
	
	#contents{
		margin: 0px auto auto 0px;
		flex-direction: column;
		width: auto;
		box-sizing : border-box;
		padding : 10px;
		display: inline-flex;
		flex-direction: column;
		
	}
	.header{
		margin: auto;
		width: 950px;
		padding : 10px;
		font-weight: 900;
	}
	.introduce{
		margin: auto;
		width: 950px;
		padding : 10px;
		display: inline-flex;
		box-sizing : border-box;
		border: 2px solid #ddd;
		border-radius:4px;
	}
	.lang{
		margin: auto;
		width: 950px;
		padding : 10px;
	}
	button {
		width: 110px;
		height: 37.6px;
		border: 0.8px solid rgb(206, 212, 218);
		background-color: rgba(238, 119, 133, 0.6);
		color: #FFFFFF !important;
		font-size: 15px;
		font-weight: 500;
	}
	
	button:hover {
		background-color: rgba(238, 119, 133, 1);
	}
</style>
</head>

<body>
	<%@ include file="common/header.jsp"%>
	<div id="wrap">
		<div id="contents">
			<span class="header">그룹 소개</span>
			<div class="introduce">
				<p>${groupInfo.sg_info }</p>
			</div>
			<span class="header">멤버</span>
			<div class="introduce">
				<p>구현 예정</p>
			</div>
			<hr>
			<div class="lang">사용언어</div>
			<p>${groupInfo.sg_lang }</p>
			<hr>
		</div>
		<div id="rightInfo">
			<p>그룹 이름</p>
			<p>${groupInfo.sg_name }</p>
			<hr>
			<p>그룹 장</p>
			<p>${groupInfo.manager_name }</p>
			<hr>
			<p>그룹 생성 날짜</p>
			<p>${groupInfo.sg_created }</p>
			<hr>
			<p>현재참여 인원</p>
			<P>${groupInfo.sg_cur }/${groupInfo.sg_max }</P>
			<button id="btnStudyjoin">가입</button>
			
		</div>
	</div>
	<%@ include file="common/footer.jsp"%>
</body>

<script>
	
	check();
	
	function check(){
		if(${groupInfo.sg_cur} == ${groupInfo.sg_max}){
			console.log('같음');
			$('#btnStudyjoin').attr('disabled', 'disabled');
			$('#btnStudyjoin').css({'cursor':'not-allowed', 'background-color':'gray', 'pointer-events':'auto' });
			$('#btnStudyjoin').text('모집 마감');
			
		} else {
			console.log('다름');
		}
	}
	
	
	$("#btnStudyjoin").on("click",function(){
		if("${user}"===''){
			alert("로그인이 필요합니다.");
			location.href="${path}/joinstudy.do"
		} else {
			$.ajax({
				url:"${path}/joinstudy.do",
				data:{
					memberNo:'${user.member_no}',
					studyNo:'${groupInfo.sg_no}'
				},
				success:function(message){
					alert(message);
					location.reload();
				},
				error:function(){
					console.log(message)
				}
			});
		}
	});
</script>

</html>