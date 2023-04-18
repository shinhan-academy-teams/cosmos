<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
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
	
</style>
</head>

<body id="top">
	<%@ include file="common/header.jsp" %>
	<div id="wrap">
		<h1>스터디 그룹 목록</h1>
		<table>
			<thead>
				<tr>
					<th>스터디명</th>
					<th>스터디장(수정할거임)</th>
					<th>모집인원(수정할거임)</th>
					<th>사용언어</th>
					<th>생성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${studyGroup }" var="group">
				<tr>
					<td>${group.sg_name }</td>
					<td>${group.sg_manager }</td>
					<td>${group.sg_max }</td>
					<td>${group.sg_lang }</td>
					<td>${group.sg_created }</td>
				</tr>			
				</c:forEach>
			</tbody>
		</table>
	</div>
	<%@ include file="common/footer.jsp" %>
</body>
</html>