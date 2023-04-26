<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set value="${pageContext.request.contextPath}" scope="application" var="path"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">


<div id="nav-wrap">
	<nav class="navbar navbar-expand-sm navbar-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="${path}">
				<img alt="logo" src="${path}/images/logo-horizontal.png"/>
			</a>
			<div class="collapse navbar-collapse" id="mynavbar">
				<ul class="navbar-nav me-auto">
					<li class="nav-item"><a class="nav-link" href="${path}/studygroup.do">전체 스터디</a></li>
					<li class="nav-item"><a class="nav-link" href="${path}/mystudy.do">내 스터디</a></li>
					<li class="nav-item"><a class="nav-link" href="${path}/creategroup.do">스터디 만들기</a></li>
				</ul>
				<form class="d-flex" action="${path}/search.do">
					<div class="input-group">
						<select name="searchOption" aria-label="searchOption">
							<option value="study_all">전체</option>
							<option value="study_name">스터디명</option>
							<option value="study_manager">스터디장</option>
						</select>
						<input type="search" name="search" class="form-control" placeholder="Search">
						<button id="search-btn" aria-label="search-btn" class="btn" type="submit"></button>
					</div>
				</form>
				<div id="sign-div">
					<c:if test="${empty user}">
						<button id="sign-in" type="button" class="btn btn-outline-light text-dark" onclick="signIn()">로그인</button>
						<button id="sign-up" type="button" class="btn btn-outline-light text-dark" onclick="signUp()">회원가입</button>
					</c:if>
					<c:if test="${not empty user}">
						<div class="dropdown">
							<button type="button" id="dropbtn">
								<div>${user.member_name} 님, 반갑습니다!</div>
							</button>
							<div class="dropdown-content">
								<button id="my-page-btn" type="button" class="btn btn-outline-light text-dark" onclick="myPage()">마이페이지</button>
								<button id="sign-out-btn" type="button" class="btn btn-outline-light text-dark" onclick="signOut()">로그아웃</button>
							</div>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</nav>
</div>

<script>
	function signIn() {
		location.href = '${path}/signin.do';
	}

	function signUp() {
		location.href = '${path}/signup.do';
	}

	function myPage() {
		location.href = '${path}/mypage.do';
	}

	function signOut() {
		alert('정상적으로 로그아웃 되었습니다.');
		location.href = '${path}/signout.do';
	}

</script>

<style>
	* {
		font-family: 'Noto Sans KR', sans-serif;
	}
	
	#nav-wrap {
		background-color: #FAE6D4;
		position: sticky;
		top: 0;
		z-index: 10000;
	}

	nav {
		margin: 0 auto;
		height: 64px;
		width: 100%;
		max-width: 1200px;
		vertical-align: middle;
	}

	a[class="navbar-brand"] {
		padding-top: 4px;
	}

	img[alt="logo"] {
		height: 32px;
	}

	.nav-item {
		padding: 8px 12px;
	}

	.nav-item > .nav-link:hover {
		font-weight: 500;
		color: black;
	}

	form.d-flex {
		width: 368.8px !important;
	}

	select[name="searchOption"] {
		display: block;
		width: 96px;
		padding: 0px 0px 1px 8px;
		margin-right: -14px;
		border: 0.8px solid rgb(206, 212, 218);
		border-top-left-radius: 24px;
		border-bottom-left-radius: 24px;
	}
	
	.form-control:focus,
	.form-select:focus,
	select[name="searchOption"]:focus {
		color: black;
		border: 1px solid #EE7785;
		box-shadow: 0 0 0 0 transparent;
	}
	
	#search-btn {
		width: 48px;
		background-color: rgba(238, 119, 133, 0.6);
		border: 0.8px solid rgb(206, 212, 218);
		background-image: url(/cosmos/images/icon-search.svg);
		background-repeat: no-repeat;
		background-position: 40% center;
		background-size: 40%;
		border-top-right-radius: 24px;
		border-bottom-right-radius: 24px;
	}
	
	#search-btn:hover {
		background-color: rgba(238, 119, 133, 1);
	}
	
	#sign-div {
		background-color: #FAE6D4;
		margin-left: 12px;
		width: 192px;
		display: flex;
		justify-content: flex-end;
	}

	#sign-div > button {
		width: 84px;
		height: 37.6px;
		margin-left: 12px;
		border: 0.8px solid rgb(206, 212, 218);
		background-color: rgba(238, 119, 133, 0.6);
		color: #FFFFFF !important;
		font-size: 15px;
		font-weight: 500;
	}
	
	#sign-div > button:hover {
		background-color: rgba(238, 119, 133, 1);
	}

	.dropdown {
		position: relative;
		display: inline-block;
	}

	#dropbtn {
		background-color: rgba(238, 119, 133, 0.6);
		border: 0.8px solid rgb(206, 212, 218);
		color: white;
		padding: 0px 12px;
		height: 40px;
		font-size: 16px;
		border-radius: 8px;
	}
	
	#dropbtn > div {
		width: 151.07px;
		overflow: hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
	}

	.dropdown-content {
		display: none;
		position: absolute;
		right: 0;
		border-radius: 8px;
		background-color: #f1f1f1;
		min-width: 128px;
		box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
		z-index: 1;
	}

	.dropdown-content button.btn {
		display: block;
		padding: 8px 12px;
		width: 100%;
		border: none;
		color: black;
	}

	.dropdown:hover #dropbtn {
		cursor: default;
		background-color: rgba(238, 119, 133, 1);
	}

	.dropdown:hover #dropbtn > div {
		overflow: auto;
		text-overflow: initial;
	}
	
	.dropdown:hover .dropdown-content {
		display: block;
	}

	.dropdown-content button.btn:hover {
		background-color: #ddd;
	}

</style>