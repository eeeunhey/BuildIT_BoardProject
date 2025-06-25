<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공고 등록</title>
<style>
	#content > * {
		width: 80%;
	}
</style>
<script>
	let checkForm = function() {
		let f = document.wForm;
		if(f.title.value.trim() === '') {
			alert('제목을 입력해주세요');
			f.title.focus();
			return false;
		}
		if(f.location.value.trim() === '') {
			alert('근무지역을 입력해주세요');
			f.location.focus();
			return false;
		}
		if(f.pay.value.trim() === '') {
			alert('급여를 입력해주세요');
			f.pay.focus();
			return false;
		}
		if(f.workTime.value.trim() === '') {
			alert('근무시간을 입력해주세요');
			f.workTime.focus();
			return false;
		}
		if(f.deadline.value.trim() === '') {
			alert('마감일을 입력해주세요');
			f.deadline.focus();
			return false;
		}
		if(f.content.value.trim() === '') {
			alert('내용을 입력해주세요');
			f.content.focus();
			return false;
		}
		return true;
	}
</script>
<link rel="stylesheet" href="/Board-WEB/resources/css/layout.css">
<link rel="stylesheet" href="/Board-WEB/resources/css/my_css.css">
</head>
<body>
	<header>
		<jsp:include page="/include/topMenu.jsp" />
	</header>
	<section>
		<div align="center" id="content">
			<hr>
			<h2>공고 등록</h2>
			<hr><br>
			<form name="wForm" action="write.jsp" method="post" onsubmit="return checkForm()">
				
				<!-- 로그인된 사용자 ID를 서버에 함께 전송 -->
				<input type="hidden" name="writer" value="${userVO.id}">

				<table style="width: 100%;">
					<tr>
						<th width="25%">제목</th>
						<td><input type="text" name="title"></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><c:out value="${userVO.id}" /></td>
					</tr>
					<tr>
						<th>근무지역</th>
						<td><input type="text" name="location"></td>
					</tr>
					<tr>
						<th>시급/급여</th>
						<td><input type="number" name="pay"></td>
					</tr>
					<tr>
						<th>근무시간</th>
						<td><input type="text" name="workTime" placeholder="예: 오전 9시 ~ 오후 6시"></td>
					</tr>
					<tr>
						<th>마감일</th>
						<td><input type="date" name="deadline"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="content" rows="8" cols="50"></textarea></td>
					</tr>
				</table>
				<br>
				<button type="submit">등록</button>
			</form>
		</div>
	</section>
	<footer>
		<%@ include file="/include/footer.jsp" %>
	</footer>
</body>
</html>
