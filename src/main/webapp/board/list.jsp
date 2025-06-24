<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알바 게시판</title>
<script>
	window.onload = function() {
		let addBtn = document.querySelector('#addBtn');
		addBtn.addEventListener('click', function() {
			location.href = "/Board-WEB/job/writeForm.do"; // 알바 글 등록 폼으로 이동
		});
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
		<div align="center">
			<hr>
			<h2>알바 게시판</h2>
			<hr><br>

			<table style="width: 100%;">
				<tr>
					<th width="5%">번호</th>
					<th>제목</th>
					<th width="12%">작성자</th>
					<th width="10%">지역</th>
					<th width="8%">시급</th>
					<th width="15%">근무시간</th>
					<th width="12%">등록일</th>
					<th width="12%">마감일</th>
				</tr>

				<c:forEach items="${ boardList }" var="post">
					<tr>
						<td style="color: gray;">${ post.postId }</td>
						<td style="color: gray;">
							<a href="detail.jsp?postId=${ post.postId }">
								<c:out value="${ post.title }" />
							</a>
						</td>
						<td style="color: gray;">${ post.writerId }</td>
						<td style="color: gray;">${ post.location }</td>
						<td style="color: gray;">${ post.pay }</td>
						<td style="color: gray;">${ post.workTime }</td>
						<td style="color: gray;">${ post.regDate }</td>
						<td style="color: gray;">${ post.deadline }</td>
					</tr>
				</c:forEach>
			</table>

			<br>
			<button id="addBtn">알바 글 등록</button>
		</div>
	</section>
	<footer>
		<%@ include file="/include/footer.jsp"%>
	</footer>
</body>
</html>
