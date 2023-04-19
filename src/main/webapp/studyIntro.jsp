<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
		min-height: calc(99vh - 60px);
		display: flex;
		vertical-align: middle;
	}
	#rightInfo{
		margin-top : 53px;
		width: 150px;
		height: 410px;
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
</style>
</head>

<body id="top">
	<%@ include file="common/header.jsp"%>
	<div id="wrap">
		<div id="contents">
			<span class="header">그룹 소개</span>
			<div class="introduce">
				<p>sfdahflhslhkdfssdffsdfsdsdffsㅁㄴ여ㅣㅁ노허암ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ이ㅗㅕㅋㅇ펴ㅗㅋ티ㅕㅠㅕ뫄나ㅗ나ㅘㅗ파ㅗㅓㅍㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊ파이ㅘ몰어나미홍너ㅏㅎ모나ㅓㄹㅇㅁㄴ잏ㅇㄴㅁㅎ리ㅏㅁ농라ㅓㄴㅇㅎㅁ니홈ㄴ려앟ㄴㅇ모험ㄴ이롬날호어함ㅇ놓ㄴㅁㄹㅇㅁㄴㄹㄴㅁㅇㄴㅁㅇㄴㅇ마ㅓㅗㅇ너ㅏㅁㄴ어ㅏㄻㄴ이로ㅕㄴㅁ이러ㅏㄴㅁ유러낭미로머나렁ㄴ마ㅣ호넝마퓨ㅜㅍ,ㅋㅌ츄ㅓㅏㅁ륨녇어dsfdahflhslhkdfssdffsdfsdsdffsㅁㄴ여ㅣㅁ노허암ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ이ㅗㅕㅋㅇ펴ㅗㅋ티ㅕㅠㅕ뫄나ㅗ나ㅘㅗ파ㅗㅓㅍㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊ파이ㅘ몰어나미홍너ㅏㅎ모나ㅓㄹㅇㅁㄴ잏ㅇㄴㅁㅎ리ㅏㅁ농라ㅓㄴㅇㅎㅁ니홈ㄴ려앟ㄴㅇ모험ㄴ이롬날호어함ㅇ놓ㄴㅁㄹㅇㅁㄴㄹㄴㅁㅇㄴㅁㅇㄴㅇ마ㅓㅗㅇ너ㅏㅁㄴ어ㅏㄻㄴ이로ㅕㄴㅁ이러ㅏㄴㅁ유러낭미로머나렁ㄴ마ㅣ호넝마퓨ㅜㅍ,ㅋㅌ츄ㅓㅏㅁ륨녇어dsfdahflhslhkdfssdffsdfsdsdffsㅁㄴ여ㅣㅁ노허암ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ이ㅗㅕㅋㅇ펴ㅗㅋ티ㅕㅠㅕ뫄나ㅗ나ㅘㅗ파ㅗㅓㅍㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊ파이ㅘ몰어나미홍너ㅏㅎ모나ㅓㄹㅇㅁㄴ잏ㅇㄴㅁㅎ리ㅏㅁ농라ㅓㄴㅇㅎㅁ니홈ㄴ려앟ㄴㅇ모험ㄴ이롬날호어함ㅇ놓ㄴㅁㄹㅇㅁㄴㄹㄴㅁㅇㄴㅁㅇㄴㅇ마ㅓㅗㅇ너ㅏㅁㄴ어ㅏㄻㄴ이로ㅕㄴㅁ이러ㅏㄴㅁ유러낭미로머나렁ㄴ마ㅣ호넝마퓨ㅜㅍ,ㅋㅌ츄ㅓㅏㅁ륨녇어dsfdahflhslhkdfssdffsdfsd라ㅓㄴㅇㅎㅁ니홈ㄴ려앟ㄴㅇ모험ㄴ이롬날호어함ㅇ놓ㄴㅁㄹㅇㅁㄴㄹㄴㅁㅇㄴㅁㅇㄴㅇ마ㅓㅗㅇ너ㅏㅁㄴ어ㅏㄻㄴ이로ㅕㄴㅁ이러ㅏㄴㅁ유러낭미로머나렁ㄴ마ㅣ호넝마퓨ㅜㅍ,ㅋㅌ츄ㅓㅏㅁ륨녇어d</p>
			</div>
			<span class="header">멤버</span>
			<div class="introduce">
				<p>멤버정보 나타나는 칸</p>
			</div>
			<hr>
			<div class="lang">사용언어</div>
			<hr>
			<p>dfd</p>
			<p>dfd</p>
			<p>dfd</p>
			<p>dfd</p>
			<p>dfd</p>
		</div>
<!-- 로그인 안한 상태 
	 1. 가입하기 click시 alret 알람 로그인 페이지로 넘어가기  o 
	 
	 로그인 한상태 
	 1. 가입하기 click시 alert 가입완료되었습니다. 알림 후 (홈화면으로 이동) 
	 2. 내그룹 화면에 들어가면 가입한 스터디 목록 나타남
	 3. 이미 가입한 그룹처리 할 방법 생각해보기 
-->
		<div id="rightInfo">
			<p>그룹 이름</p>
			<p>${grouplist.sg_name }</p>
			<hr>
			<p>그룹 장</p>
			<p>${grouplist.sg_manager }</p>
			<hr>
			<p>그룹 생성 날짜</p>
			<p>${grouplist.sg_created }</p>
			<hr>
			<p>현재참여 인원</p>
			<hr>
			<button id="btnStudyjoin">가입</button>
			
		</div>
	</div>
	<%@ include file="common/footer.jsp"%>
</body>

<script>
	$(function(){
		$("#btnStudyjoin").on("click",function(){
			$.ajax({
				url:"",
				success:function(responseData){
					alert("로그인이 필요합니다.");
					location.href="${path}/sign-in.jsp
				},
				error:function(){
					alert(message);
					console.log(message)
				}
			});
		});
	});
</script>

</html>