<!-- 
스터디 그룹 소개 및 가입 화면
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
	
	#rightInfo {
		margin-top : 56px;
		width: 150px;
		height: 475px;
		box-sizing : border-box;
		padding : 5px;
		display: inline-flex;
		flex-direction: column;
		position sticky;
		border: 2px solid #ddd;
		top : 74px;
		border-radius:4px;
		float: right;
		font-size: 18px;
	}
	
	#rightInfo > p {
		margin: auto;
		font-size: 16px;
	}
	
	#rightInfo > hr {
	    margin: 0.5rem 0;
   		color: solid #ddd;
		border-top: 2px solid;
	}
	
	#contents {
		margin: 0px auto auto 0px;
		flex-direction: column;
		width: auto;
		box-sizing : border-box;
		padding : 10px;
		display: inline-flex;
		flex-direction: column;
	}
	
	.header {
		margin: auto;
		width: 950px;
		padding : 10px;
		font-size: 18px;
		font-weight: bold;
	}
	
	.introduce {
		margin: auto;
		width: 950px;
		height: 362px;
		padding : 10px;
		display: inline-flex;
		box-sizing : border-box;
		border: 2px solid #ddd;
		border-radius:4px;
	}
	
	.introduce-2 {
		margin: auto;
		width: 950px;
		padding : 10px;
		display: inline-flex;
		box-sizing : border-box;
		border: 2px solid #ddd;
		border-radius:4px;
	}
	
	#btnStudyjoin {
		margin: auto
		width: 110px;
		height: 37.6px;
		border: 0.8px solid rgb(206, 212, 218);
		background-color: rgba(238, 119, 133, 0.6);
		color: #FFFFFF !important;
		font-size: 15px;
		font-weight: 500;
		border-radius: 8px;
	}
	
	#btnStudyjoin:hover {
		background-color: rgba(238, 119, 133, 1);
	}
	
	.null-info {
		color : gray;
	}
	
</style>
</head>

<body>
	<%@ include file="common/header.jsp"%>
	<div id="wrap">
		<div id="contents">
			<span class="header">그룹 소개</span>
			<div class="introduce">
				<c:if test="${groupInfo.sg_info eq null }">
				<p class="null-info">"소개글이 없습니다"</p>
				</c:if>
				<c:if test="${groupInfo.sg_info ne null }">
				<p>${groupInfo.sg_info }</p>
				</c:if>
			</div>
			<span class="header">사용언어</span>
			<div class="introduce-2">
				<p>${groupInfo.sg_lang }</p>
			</div>
			
		</div>
		<div id="rightInfo">
			<div class="header">그룹 이름</div>
			<p>${groupInfo.sg_name }</p>
			<hr>
			<div class="header">그룹 장</div>
			<p>${groupInfo.manager_name }</p>
			<hr>
			<div class="header">그룹 생성 날짜</div>
			<p>${groupInfo.sg_created }</p>
			<hr>
			<div class="header">현재참여 인원</div>
			<P>${groupInfo.sg_cur }/${groupInfo.sg_max }</P>
			<hr>
			<button id="btnStudyjoin">가입</button>
		</div>
	</div>
	<%@ include file="common/footer.jsp"%>
</body>

<script>
	
	check();
	
	function check(){
		if(${groupInfo.sg_cur} == ${groupInfo.sg_max}){
			$('#btnStudyjoin').attr('disabled', 'disabled');
			$('#btnStudyjoin').css({'cursor':'not-allowed', 'background-color':'gray', 'pointer-events':'auto' });
			$('#btnStudyjoin').text('모집 마감');
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
					location.href = '${path}/mystudy.do';
				},
				error:function(){
					console.log(message)
				}
			});
		}
	});
</script>

</html>