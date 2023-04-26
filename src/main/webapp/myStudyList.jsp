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
		display: flex;
		vertical-align: middle;
	}
	table {
		font-size: 18px;
    	margin-top: 48px;
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
			<table>
				<thead>
					<tr>
						<th scope="col"></th>
						<th scope="col">내 스터디</th>
						<th scope="col">관리자</th>
						<th scope="col">인원수</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody id="tbody">
					<c:forEach items="${myGroup }" var="grouplist" varStatus="status" >
						<tr>
							<c:choose>
								<c:when test ="${grouplist.sg_manager eq  user.member_no}">
									<td><img alt="star" src="${path}/images/icon-star.png"></td>
									<td><a href="studymain.do?studyno=${grouplist.sg_no }">${grouplist.sg_name }</a></td>
									<td>${grouplist.manager_name }</td>
									<td>${grouplist.sg_cur }/${grouplist.sg_max }</td>
									<td class='td-button'><button id="btnManage">관리</button></td>
								</c:when>
								<c:otherwise>
									<td></td>
									<td><a href="studymain.do?studyno=${grouplist.sg_no }">${grouplist.sg_name }</a></td>
									<td>${grouplist.manager_name }</td>
									<td>${grouplist.sg_cur }/${grouplist.sg_max }</td>
									<td class='td-button'><button id="btnEscape">탈퇴</button></td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				</tbody>
			</table>
	</div>
	<%@ include file="common/footer.jsp"%>
</body>
</html>