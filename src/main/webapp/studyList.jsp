<!-- 
전체 스터디 그룹 목록 화면
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
	table{
		width: 100%; 
		height: 200px;
        margin: auto;
        text-align: center;
        
	}
	thead > tr {
		border-top: 1px solid black;
		border-bottom: 1px solid black;
	}
	th {
		font-size: x-large; 
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
	#tbody a{
	 color : #0076C0;
	 text-decoration: underline;
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
						<th scope="col">스터디명</th>
						<th scope="col">사용언어</th>
						<th scope="col">그룹장</th>
						<th scope="col">모집인원</th>
					</tr>
				</thead>
				<tbody id="tbody">
					<c:forEach items="${studyGroup }" var="grouplist" varStatus="status" >
						<tr>
							<td>상태</td>
							<td><a href="studyintro.do?studyno=${grouplist.sg_no }">${grouplist.sg_name }</a></td>
							<td>${grouplist.sg_lang }</td>
							<td>${grouplist.manager_name }</td>
							<td>${grouplist.sg_max }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
	</div>
	<%@ include file="common/footer.jsp"%>
</body>
</html>