<!-- 
사용자 마이페이지 화면
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
		justify-content: flex-start;
	}

	/* ------------------------------------------------------- */

	sidebar {
		max-height: 100vh;
		overflow-x: auto;
		overflow-y: hidden;
		width: 25%;
	}

	sidebar > div {
		width: 100%;
	}

	#sidebar-title {
		color: black !important;
		padding-left: 12px;
	}

	.btn-toggle::before {
		margin-right: 10px;
		line-height: 0;
		content: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='rgba%280,0,0,.5%29' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M5 14l6-6-6-6'/%3e%3c/svg%3e");
		transition: transform .35s ease;
		transform-origin: .5em 50%;
	}

	.btn-toggle[aria-expanded="true"]::before {
		transform: rotate(90deg);
	}

	.btn-toggle-nav a {
		width: 150px;
    padding: 0.8rem 0 0.8rem 1.5rem;
		margin-top: 1rem;
		margin-left: 1.5rem;
		color: black;
		font-size: 14px;
	}
	.btn-toggle-nav a:hover,
	.btn-toggle-nav a:focus {
		background-color: rgba(0, 0, 0, 0.04);
		color: black;
		cursor: pointer;
	}

	/* ------------------------------------------------------- */

	contents {
		width: 100%;
		margin-left: 24px;
		margin-bottom: 24px;
	}

	#my-page, #delete-account {
		height: 500px;
	}

	.my-page-content > div {
		width: 100%;
    height: 100%;
    margin-top: 28px;
    padding: 24px 24px 0;
    background-color: #F9FAFB;
    border-radius: 24px;
    display: flex;
    justify-content: center;
    align-items: flex-start;
	}

	.my-page-content {
		display: none;
	}

	/* ------------------------------------------------------- */

	form {
		width: 50%;
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
	
	#new-pw1-value-valid, #new-pw1-value-invalid,
	#new-pw2-value-valid, #new-pw2-value-invalid {
		display: none;
	}

	img[alt="valid"] {
		height: 18px;
		margin: -3px 7px auto 3px;
	}

	img[alt="warning"] {
		height: 24px;
		margin: -3px 4px 0px 0px;
	}

	.form-group > span {
		color: gray;
		font-size: 13px;
		font-weight: 100;
		height: 24px;
	}

	#submit-btn, #delete-acount-btn {
		margin-top: 48px;
		width: 100%;
		height: 42px;
		background-color: gray;
		border: none;
	}

	#delete-acount-btn {
		background-color: rgb(238, 119, 133);
	}

	#delete-acount-btn:hover {
		background-color: rgb(255, 0, 0);
	}
</style>

</head>
<body>
	<%@ include file="common/header.jsp" %>

	<script>
		$(function(){
			myCodeList();
		})
	</script>

	<div id="wrap">

		<sidebar class="d-flex flex-nowrap">
			<div class="flex-shrink-0 p-3">
				<a id="sidebar-title" href="${path}/myPage.jsp" class="d-flex align-items-center pb-3 mb-3 link-body-emphasis text-decoration-none border-bottom">
					<span class="fs-5 fw-semibold">마이페이지</span>
				</a>
				<ul class="list-unstyled ps-0">
					<li class="mb-1">
						<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="true"> 나의 활동</button>
						<div class="collapse show" id="home-collapse">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
								<li>
									<a onclick="myCodeList()" class="link-body-emphasis d-inline-flex text-decoration-none rounded">내 코드 모아보기</a>
								</li>
								<li>
									<a onclick="myMarkCodeList()" class="link-body-emphasis d-inline-flex text-decoration-none rounded">찜한 코드</a>
								</li>
							</ul>
						</div>
					</li>
					<li class="border-top my-3"></li>
					<li class="mb-1">
						<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="false"> 내 정보 관리</button>
						<div class="collapse" id="account-collapse">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
								<li><a onclick="modifyAccount()" class="link-dark d-inline-flex text-decoration-none rounded">비밀번호 수정</a></li>
								<li><a onclick="deleteAccount()" class="link-dark d-inline-flex text-decoration-none rounded">회원 탈퇴</a></li>
							</ul>
						</div>
					</li>
				</ul>
			</div>
		</sidebar>

		<contents>
			<div id="right-contents">
				<div id="my-code-list" class="my-page-content">
					<h3>myCodeList</h3>
					<div>
						<div>
							Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque tristique sem et scelerisque euismod. Quisque cursus, purus a viverra iaculis, nunc mauris laoreet est, non blandit velit nisi vel metus. Sed purus odio, dapibus id felis a, viverra cursus quam. Quisque pulvinar erat diam, eget tincidunt lacus varius eget. Phasellus vitae vulputate tellus. Aliquam vulputate mi vitae justo semper pharetra. Suspendisse potenti. Phasellus nec congue turpis. Vestibulum suscipit felis scelerisque, vehicula mi eleifend, pharetra est. Etiam viverra, elit sed ultrices tincidunt, neque justo condimentum odio, ut rhoncus turpis ipsum ultrices arcu. Maecenas tincidunt purus a quam pretium, vitae consequat sem feugiat. Mauris vitae eros malesuada, pretium massa ut, posuere lectus. Praesent gravida accumsan ex, ut pulvinar dui venenatis et. Praesent elementum, lacus vel interdum sagittis, nisl enim finibus dui, et pretium nisi odio eu quam.
							<br><br>
							Suspendisse sit amet mauris mi. Praesent augue odio, consectetur aliquet libero vel, cursus ornare nisl. In in diam sit amet magna semper condimentum. Mauris eros sem, volutpat vel orci vel, euismod congue magna. Pellentesque nec augue vel dui vestibulum bibendum vitae in nisi. In hac habitasse platea dictumst. In dapibus ex leo, eget pulvinar enim dignissim et. Ut ut lacus sed sapien porta varius eu posuere velit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Morbi laoreet ornare odio at suscipit. Cras aliquam eu nibh ut posuere. In mollis sit amet dolor vel pharetra.
						</div>
					</div>
				</div>
				<div id="my-mark-code-list" class="my-page-content">
					<h3>myMarkCodeList</h3>
					<div>
						<div>
							Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Suspendisse interdum consectetur libero id faucibus nisl tincidunt. Luctus accumsan tortor posuere ac ut consequat semper. Ornare arcu odio ut sem nulla pharetra diam. Sollicitudin aliquam ultrices sagittis orci a scelerisque purus semper eget. Pharetra et ultrices neque ornare aenean. Consequat id porta nibh venenatis cras sed felis eget velit. Quam pellentesque nec nam aliquam sem et tortor. Placerat orci nulla pellentesque dignissim enim sit amet. Eget dolor morbi non arcu risus. Justo eget magna fermentum iaculis. Pretium vulputate sapien nec sagittis. Fringilla ut morbi tincidunt augue interdum velit euismod in pellentesque.
							<br><br>
							Ut lectus arcu bibendum at varius. Elementum pulvinar etiam non quam lacus. Viverra maecenas accumsan lacus vel facilisis volutpat est. Viverra tellus in hac habitasse platea. Eu feugiat pretium nibh ipsum consequat nisl vel pretium lectus. Eleifend donec pretium vulputate sapien nec sagittis aliquam malesuada. Lectus urna duis convallis convallis tellus id interdum velit. Donec pretium vulputate sapien nec. Mus mauris vitae ultricies leo. In vitae turpis massa sed elementum tempus egestas sed sed. In fermentum et sollicitudin ac orci phasellus.
						</div>
					</div>
				</div>
				<div id="my-page" class="my-page-content">
					<h3>비밀번호 수정</h3>
					<div>
						<form action="${path}/updatePwd.do" method="post">
							<div class="form-group">
								<label for="current-pw">현재 비밀번호</label>
								<input type="password" class="form-control" id="current-pw" name="current-pw" required placeholder="현재 비밀번호를 입력해주세요">
							</div>
							<div class="form-group">
								<label for="new-pw1">새로운 비밀번호</label>
								<input type="password" class="form-control" id="new-pw1" name="new-pw1" required placeholder="최소 6자 이상 (영문, 숫자 필수)">
								<span id="new-pw1-value-valid"><img alt="valid" src="${path}/images/icon-valid.png">Valid.</span>
								<span id="new-pw1-value-invalid"><img alt="warning" src="${path}/images/icon-warning.png">영문, 숫자를 포함하여 최소 6자 이상 입력해주세요.</span>
							</div>
							<div class="form-group">
								<label for="new-pw2">새로운 비밀번호 확인</label>
								<input type="password" class="form-control" id="new-pw2" name="new-pw2" required placeholder="동일한 비밀번호를 입력해주세요">
								<span id="new-pw2-value-valid"><img alt="valid" src="${path}/images/icon-valid.png">Valid.</span>
								<span id="new-pw2-value-invalid"><img alt="warning" src="${path}/images/icon-warning.png">Text</span>
							</div>
							<div>
								<button id="submit-btn" type="submit" class="btn btn-danger" style="pointer-events: auto; cursor: not-allowed;" disabled="disabled">조건을 충족해주세요</button>
							</div>
						</form>
					</div>
				</div>
				<div id="delete-account" class="my-page-content">
					<h3>회원 탈퇴</h3>
					<div>
						<form action="${path}/" method="post">
							<div class="form-group">
								<label for="pw-comfirm">비밀번호</label>
								<input type="password" class="form-control" id="pw-comfirm" name="pw-comfirm" required placeholder="비밀번호를 입력해주세요">
							</div>
							<div>
								<button id="delete-acount-btn" type="submit" class="btn btn-danger">회원 탈퇴</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</contents>

	</div>
	<%@ include file="common/footer.jsp" %>
	<script>
		function myCodeList(){
			$('.form-control').val('');
			$('.my-page-content').css('display', 'none');
			$('#my-code-list').css('display', 'block');
		}

		function myMarkCodeList(){
			$('.form-control').val('');
			$('.my-page-content').css('display', 'none');
			$('#my-mark-code-list').css('display', 'block');
		}

		function modifyAccount(){
			$('.form-control').val('');
			$('.my-page-content').css('display', 'none');
			$('#my-page').css('display', 'block');
		}
		function deleteAccount(){
			$('.form-control').val('');
			$('.my-page-content').css('display', 'none');
			$('#delete-account').css('display', 'block');
		}

		let regexNumber = /[0-9]/; // 정규표현식 숫자
		let regexAlphabet = /[a-zA-Z]/; // 정규표현식 문자

		// 비밀번호 처리
		let pw1IsOk = false;
		$('#new-pw1').keyup(func_pw1_check); // 비밀번호-1 조건 체크
		function func_pw1_check() { // 아이디 조건 체크 메서드
			let pw1 = $(this).val(); // 입력된 pw1

			if(pw1.length == 0) { // 길이 0이면 두 알림 숨김.
				$('#new-pw1-value-valid').css('display', 'none');
				$('#new-pw1-value-invalid').css('display', 'none');
				pw1IsOk = false;
			} else {
				if(pw1.length < 6 || !regexNumber.test(pw1) || !regexAlphabet.test(pw1)) { // 길이가 6미만이거나 영문, 숫자 포함하지 않으면 valid 숨기고 invalid 표시.
					$('#new-pw1-value-valid').css('display', 'none');
					$('#new-pw1-value-invalid').css('display', 'inline-block');
					pw1IsOk = false;
				} else { // 비밀번호 조건 통과시 invalid 숨기고 valid 표시.
					$('#new-pw1-value-invalid').css('display', 'none');
					$('#new-pw1-value-valid').css('display', 'inline-block');
					pw1IsOk = true;
				}
			}
		}

		let pw2IsOk = false;
		$('#new-pw1').keyup(func_pw2_check);
		$('#new-pw2').keyup(func_pw2_check);
		function func_pw2_check() { // 비밀번호-2 조건 체크
			let pw2 = $('#new-pw2').val(); // 입력된 pw2

			if(pw2.length == 0) { // 길이 0이면 두 알림 숨김.
				$('#new-pw2-value-valid').css('display', 'none');
				$('#new-pw2-value-invalid').css('display', 'none');
				pw2IsOk = false;
			} else {
				if(pw1IsOk){ // 비밀번호-1 조건 통과 시
					if($('#new-pw1').val() === pw2){ // pw1과 pw2가 같으면
						$('#new-pw2-value-invalid').css('display', 'none');
						$('#new-pw2-value-valid').css('display', 'inline-block');
						pw2IsOk = true;
					} else { // pw1과 pw2가 다르면
						$('#new-pw2-value-valid').css('display', 'none');
						$('#new-pw2-value-invalid').html('<img alt="warning" src="${path}/images/icon-warning.png">동일한 비밀번호를 입력해주세요.');
						$('#new-pw2-value-invalid').css('display', 'inline-block');
						pw2IsOk = false;
					}
				} else { // 비밀번호-1 조건 불충족시
					$('#new-pw2-value-valid').css('display', 'none');
					$('#new-pw2-value-invalid').html('<img alt="warning" src="${path}/images/icon-warning.png">조건에 맞춰 비밀번호를 다시 입력해주세요.');
					$('#new-pw2-value-invalid').css('display', 'inline-block');
					pw2IsOk = false;
				}
			}
		}

		setInterval(check, 500, pw2IsOk);
		function check(){
			if(pw2IsOk){
				$('#submit-btn').removeAttr('disabled');
				$('#submit-btn').css({'cursor':'pointer', 'background-color':'rgba(238, 119, 133, 0.6)', 'pointer-events':'auto' });
				$('#submit-btn').text('수정');
				$('#submit-btn').hover(function(){
					$(this).css('background-color','rgba(238, 119, 133, 1)');
				});
			} else {
				$('#submit-btn').attr('disabled', 'disabled');
				$('#submit-btn').css({'cursor':'not-allowed', 'background-color':'gray', 'pointer-events':'auto' });
				$('#submit-btn').text('조건을 충족해주세요');
			}
		}

	</script>
</body>
</html>