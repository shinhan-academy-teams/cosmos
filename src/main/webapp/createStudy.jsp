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
	.table>:not(caption)>*>* {
    padding: 0.5rem 0.5rem;
    background-color: var(--bs-table-bg);
    border-bottom-color: white;
    box-shadow: inset 0 0 0 9999px var(--bs-table-accent-bg);
	}
	
	#td-right{
		padding-left: 70%;
	}
	
	
</style>
</head>

<body id="top">
	<%@ include file="common/header.jsp"%>

	<div id="wrap">
			<table class="table table-boardered">
				<tr>
					<th>스터디 이름</th>
					<td><input type="text" class="form-control" name="sgname"></td>
				</tr>
				<tr>
					<!-- 로그인한 사람 아이디 read only로 쏴야함 -->
					<th>그룹장</th>
					<td><input type="password" class="form-control"
						name="sgmanager"></td>
				</tr>

				<tr>
					<th>최대인원</th>
					<td>
						<!-- select name="job" class="form-control">
								<option value=""></option>
								<option value="">1</option>
								<option value="">2</option>
								<option value="">3</option>
								<option value="">4</option>
						</select> -->
						<input type="number">
						
					</td>
				</tr>
				<tr>
					<th>사용언어</th>
					<td><select name="job" class="form-control">
							<option value="java">java</option>
							<option value="python">python</option>
							<option value="c">c</option>
							<option value="c++">c++</option>
					</select></td>
				</tr>
				
				<tr>
					<th>그룹소개</th>
					<td><textarea rows="5" cols="40" name="info"
							class="form-control" placeholder="1000자 이내로 작성해주세요"></textarea></td>
				</tr>

				<tr>
					<td id="td-right" colspan="2"><input type="submit" class="btn btn-primary"
						value="생성"> <input type="reset" class="btn btn-danger"
						value="취소"></td>
				</tr>

			</table>
	</div>
	<%@ include file="common/footer.jsp"%>
</body>
</html>