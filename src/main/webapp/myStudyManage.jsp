<!-- 
내 스터디 목록 화면
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
		display: block;
	}
	#wrap div{
		width : 100%;
		font-size: 18px;
		font-weight: 600;
	}
	table {
		margin-bottom: 80px;
		font-size: 18px;
    	margin-top: 21px;
		width: 100%;
		height: fit-content;
		text-align: center;
	}

	th, td {
		height: 45px !important;
	}
	.td-button{
		width: 60px;
	} 
	
	thead > tr {
		border-top: 1px solid black;
		border-bottom: 1px solid black;
	}
	
	th {
		background-color: white;
		color: black;
		border-top: 1px solid black;
		border-bottom: 1px solid black;
		
	}
	
	tr:nth-child(even) {
		background-color: white;
	}
	
	tr:nth-child(odd) {
		background-color: #f1f1f1;
	}
	
	img[alt="star"] {
   		height: 43px;
		width: auto;
	}
	
	#tbody a{
		color : #0076C0;
		text-decoration: underline;
	}
	img[alt="hit"] {
   		height: 43px;
		width: auto;
	}

	#tbody tr {
		font-weight: 300;
	}

	#tbody tr td:first-child {
		width: 100px;
	}

	thead tr th:nth-child(2),
	#tbody tr td:nth-child(2)  {
		text-align: left;
		width: 50%;
	}
	
	#btnEscape{
		border-radius: 8px;
		font-size: 16px;
		color: white;
		background-color: rgb(238, 119, 133);
		border: 0.8px solid rgb(206, 212, 218);
	}
	
	#btnEscape:hover {
		background-color: rgb(255, 0, 0);
	}
	
	#btnManage{
		border-radius: 8px;
		font-size: 16px;
		color: white;
		background-color: #aacd6e;
		border: 0.8px solid rgb(206, 212, 218);
	}
	#btnManage:hover {
		background-color: rgb(137, 178, 66);
	}
	


</style>
</head>

<body>
	<%@ include file="common/header.jsp"%>
	<div id="wrap">
		<div>리더</div>
		<div>
			<table>
				<thead>
					<tr>
						<th scope="col">아이디</th>
						<th scope="col">이름</th>
						<th scope="col">이메일</th>
					</tr>
				</thead>
				<tbody id="tbody">
						<tr>
							<td>${user.member_id }</td>
							<td>${user.member_name }</a></td>
							<td>${user.member_email }</td>
						</tr>
				</tbody>
			</table>
		</div>

		<div>멤버</div>
		<div>
			<table>
				<thead>
					<tr>
						<th scope="col">포지션</th>
						<th scope="col">아이디</th>
						<th scope="col">이름</th>
						<th scope="col">이메일</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody id="tbody">
					<c:forEach items="${studyMembers }" var="memberlist" varStatus="status">
						<tr>
							<td>${memberlist.position }</td>
							<td>${memberlist.member_id }</td>
							<td>${memberlist.member_name }</a></td>
							<td>${memberlist.member_email }</td>
							<td class='td-button'><button id="btnManage">삭제</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<%@ include file="common/footer.jsp"%>
</body>
</html>