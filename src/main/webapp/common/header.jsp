<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set value="${pageContext.request.contextPath}" scope="application" var="path"/>

<meta charset="UTF-8">
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
				<img alt="logo" src="${path}/images/logo-full.png"/>
			</a>
			<div class="collapse navbar-collapse" id="mynavbar">
				<ul class="navbar-nav me-auto">
					<li class="nav-item"><a class="nav-link" href="javascript:void(0)">menu 1 </a></li>
					<li class="nav-item"><a class="nav-link" href="javascript:void(0)">menu 2 </a></li>
					<li class="nav-item"><a class="nav-link" href="javascript:void(0)">menu 3 </a></li>
				</ul>
				<form class="d-flex">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Search">
						<button id="search-btn" class="btn" type="submit"></button>
					</div>
				</form>
				<div id="sign-div">
					<button id="signin" type="button" class="btn btn-outline-light text-dark">Sign in</button>
					<button id="signup" type="button" class="btn btn-outline-light text-dark">Sign up</button>
				</div>
			</div>
		</div>
	</nav>
</div>

<script>
	document.getElementById('signin').addEventListener('click', function(){
		location.href = '${path}/login.jsp';
	});
</script>

<style>
	* {
		font-family: 'Noto Sans KR', sans-serif;
	}
	
	#nav-wrap {
		background-color: #FAE6D4;
		position: sticky;
		top: 0;
	}

	nav {
		position: relative;
		margin: 0 auto;
		display: flex;
		align-items: center;
		padding: 0 16px;
		height: 64px;
		width: 100%;
		max-width: 1200px;
		z-index: 10000;
		vertical-align: center;
	}

	a[class="navbar-brand"] {
		padding-top: 4px;
	}

	img[alt="logo"] {
		height: 30px;
	}
	
	#search-btn {
		width: 48px;
		padding: 10px 0px;
		background-color: rgba(238, 119, 133, 0.6);
		border: 0.8px solid rgb(206, 212, 218);
		background-image: url('${path}/images/search_logo.svg');
		background-repeat: no-repeat;
		background-position: center;
		background-size: 50%;
	}
	
	#search-btn:hover {
		background-color: rgba(238, 119, 133, 1);
	}
	
	#sign-div {
		margin-left: 24px;
	}
	
	.btn-outline-light {
		margin-left: 12px;
		border: 1.2px solid lightgray;
	}
	
</style>
