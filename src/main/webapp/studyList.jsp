<!-- 
전체 스터디 그룹 목록 화면
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
		justify-content: center;
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

	img[alt="hit"] {
   		height: 43px;
		width: auto;
	}
	
	img[alt="soldout"] {
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
	#tbody tr td:nth-child(2) {
		text-align: left;
		width: 50%;
	}
	
	#tbody > tr > td:nth-child(2) > a {
		color: black;
		text-decoration: none;
	}
	
	#tbody > tr > td:nth-child(2) > a:hover {
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
							<c:choose>
								<c:when test ="${grouplist.sg_max eq grouplist.sg_cur}">
									<td><img alt="soldout" src="${path}/images/icon-soldout.png"></td>
								</c:when>
								<c:otherwise>
									<c:if test ="${(grouplist.sg_cur / grouplist.sg_max)*100 >= 65}">
										<td><img alt="hit" src="${path}/images/icon-hit.png"></td>
									</c:if>
									<c:if test ="${(grouplist.sg_cur / grouplist.sg_max)*100 < 65}">
										<td></td>
									</c:if>
								</c:otherwise>
							</c:choose>
							<td><a href="studyintro.do?studyno=${grouplist.sg_no}">${grouplist.sg_name}</a></td>
							<td>${grouplist.sg_lang}</td>
							<td>${grouplist.manager_name}</td>
							<td>${grouplist.sg_cur}/${grouplist.sg_max}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
	</div>
	<%@ include file="common/footer.jsp"%>
</body>
</html>