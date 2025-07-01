<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알바 게시판</title>
<link rel="stylesheet" href="/Board-WEB/resources/css/layout.css">
<link rel="stylesheet" href="/Board-WEB/resources/css/list.css">
<script>
	window.onload = function() {
		document.querySelector('#addBtn').addEventListener('click', function() {
			location.href = "/Board-WEB/board/writeForm.do";
		});
	}
</script>
</head>
<body>
	<header>
		<jsp:include page="/include/topMenu.jsp" />
	</header>

	<section class="list-container">
		<h2>프로젝트 찾기</h2>
		<div class="project-count">${ boardList.size() }개의프로젝트</div>

		<c:forEach items="${ boardList }" var="post">
			<div class="project-card">
				<div class="card-header">
					<span class="badge">모집 중</span>
					<h3>
						<a href="detail.jsp?postId=${ post.postId }">${ post.title }</a>
					</h3>
				</div>
				<div class="card-body">
					<div class="info-line">
						<strong>시급:</strong> ${ post.pay }원
					</div>
					<div class="info-line">
						<strong>예상 기간:</strong> ${ post.workTime }
					</div>
					<div class="info-line">
						<strong>근무 지역:</strong> ${ post.location }
					</div>
					<div class="info-line">
						<strong>등록일:</strong> ${ post.regDate } | <strong>마감일:</strong> ${ post.deadline }
					</div>
				</div>
				<div class="card-footer">
					<span class="writer">작성자: ${ post.writerId }</span>
				</div>
			</div>
		</c:forEach>

		<div class="button-area">
			<c:if test="${ not empty userVO }">
				<button id="addBtn">프로젝트 글 등록</button>
			</c:if>
		</div>
	</section>

	<footer>
		<%@ include file="/include/footer.jsp"%>
	</footer>
</body>
</html>