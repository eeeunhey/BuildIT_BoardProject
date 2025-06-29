<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<<<<<<< HEAD

<script>
	window.onload = function() {
		let addBtn = document.querySelector('#addBtn');
		addBtn.addEventListener('click', function() {
			location.href = "/Board-WEB/board/writeForm.do"; // 알바 글 등록 폼으로 이동
=======
<title>알바 게시판</title>
<link rel="stylesheet" href="/Board-WEB/resources/css/layout.css">
<link rel="stylesheet" href="/Board-WEB/resources/css/list.css">
<script>
	window.onload = function() {
		document.querySelector('#addBtn').addEventListener('click', function() {
			location.href = "/Board-WEB/job/writeForm.do";
>>>>>>> 1696acf (ui update250629)
		});
	}
</script>
</head>
<body>
	<header>
		<jsp:include page="/include/topMenu.jsp" />
	</header>
<<<<<<< HEAD
	<section>
		<div align="center">
			<table style="width: 100%;">
				<tr>
					<th>제목</th>
					<th width="10%">지역</th>
					<th width="8%">시급</th>
					<th width="15%">근무시간</th>
					<th width="12%">등록일</th>
					<th width="12%">마감일</th>
				</tr>

				<c:forEach items="${ boardList }" var="post">
					<tr>
						<td style="color: gray;">
							<a href="detail.jsp?postId=${ post.postId }">
								<c:out value="${ post.title }" />
							</a>
						</td>
						<td style="color: gray;">${ post.location }</td>
						<td style="color: gray;">${ post.pay }</td>
						<td style="color: gray;">${ post.workTime }</td>
						<td style="color: gray;">${ post.regDate }</td>
						<td style="color: gray;">${ post.deadline }</td>
					</tr>
				</c:forEach>
			</table>
=======

	<section class="list-container">
		<h2> IT 프로젝트 목록</h2>
		<div class="project-count">${ boardList.size() }개의 프로젝트</div>

		<c:forEach items="${ boardList }" var="post">
			<div class="project-card">
				<div class="card-header">
					<span class="badge">모집 중</span>
					<h3><a href="detail.jsp?postId=${ post.postId }">${ post.title }</a></h3>
				</div>
				<div class="card-body">
					<div class="info-line"><strong>시급:</strong> ${ post.pay }원</div>
					<div class="info-line"><strong>예상 기간:</strong> ${ post.workTime }</div>
					<div class="info-line"><strong>근무 지역:</strong> ${ post.location }</div>
					<div class="info-line"><strong>등록일:</strong> ${ post.regDate } | <strong>마감일:</strong> ${ post.deadline }</div>
				</div>
				<div class="card-footer">
					<span class="writer">작성자: ${ post.writerId }</span>
				</div>
			</div>
		</c:forEach>
>>>>>>> 1696acf (ui update250629)

		<div class="button-area">
			<button id="addBtn">알바 글 등록</button>
		</div>
	</section>

	<footer>
		<%@ include file="/include/footer.jsp" %>
	</footer>
</body>
</html>
