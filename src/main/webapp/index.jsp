<%-- 작성일: 2025-08-11 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BuildIT - 실무 프로젝트 채용 플랫폼</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/layout.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/my_css.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main.css">
</head>
<body>
	<header>
		<jsp:include page="/include/topMenu.jsp" />
	</header>

	<section class="main-section">

		<!-- 🔥 오늘의 토픽 영역 -->
		<div class="today-topic-container">
			<!-- 오버레이 텍스트 -->
			<div class="topic-overlay">
				<div class="topic-badge">🔥 오늘의 토픽</div>

				<div class="topic-info-text">
					<h2>구글 클라우드 기반 기업용 AI 구축하기(feat. CEN AI)</h2>
					<span>개발</span>
				</div>

				<div class="slide-control">
					<span class="pause-icon">⏸</span> <span class="slide-count">1
						/ 5</span>
				</div>
			</div>

			<!-- 배경 이미지 -->
			<img
				src="${pageContext.request.contextPath}/resources/images/technology.png"
				alt="오늘의 토픽 이미지" class="topic-bg-img" />
		</div>

		<!-- 🧩 최신 프로젝트 공고 -->
		<div class="job-picks">
			<h4>요즘 뜨는 IT 프로젝트 공고</h4>

			<div class="collection-list">
				<c:choose>
					<c:when test="${not empty hotBoardList}">
						<c:forEach var="post" items="${hotBoardList}">
							<c:url var="detailUrl" value="/board/detail.do">
								<c:param name="postId" value="${post.postId}" />
							</c:url>

							<!-- 카드 전체가 링크 -->
							<a class="collection-card"
								href="${pageContext.request.contextPath}${detailUrl}">
								<div class="thumb">
									<img
										src="${pageContext.request.contextPath}/board/image.do?postId=${post.postId}"
										alt="${post.title}"
										onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/resources/images/workimage.png';" />
								</div>
								<div class="collection-info">
									<p class="title">${post.title}</p>
									<p class="meta">
										${post.location} ·
										<c:choose>
											<c:when test="${post.pay != 0}">시급/급여 ${post.pay}</c:when>
											<c:otherwise>급여 협의</c:otherwise>
										</c:choose>
										· 마감 ${post.deadline}
									</p>
								</div>
							</a>
						</c:forEach>
					</c:when>

					<c:otherwise>
						<!-- 비어있을 때 플레이스홀더 -->
						<div class="collection-card">
							<div class="thumb">
								<img
									src="${pageContext.request.contextPath}/resources/images/workimage.png"
									alt="placeholder" />
							</div>
							<div class="collection-info">
								<p class="title">등록된 프로젝트가 없습니다</p>
								<p class="meta">지금 첫 프로젝트를 등록해 보세요</p>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>

		<!-- 🌟 에디터 추천 컬렉션 -->
		<div class="editor-picks">
			<h3>요즘 뜨는 인기 컬렉션</h3>
			<div class="collection-list">

				<div class="collection-card">
					<img
						src="${pageContext.request.contextPath}/resources/images/technology.png"
						alt="썸네일1" />
					<div class="collection-info">
						<p class="title">불쾌한 골짜기 밟도록 못 가는 AI</p>
						<p class="meta">조회수 632 · 좋아요 7 · 댓글 6</p>
					</div>
				</div>

				<div class="collection-card">
					<img
						src="${pageContext.request.contextPath}/resources/images/technology.png"
						alt="썸네일2" />
					<div class="collection-info">
						<p class="title">고양이도 알아듣는 생존형 AI</p>
						<p class="meta">조회수 257 · 좋아요 3 · 댓글 2</p>
					</div>
				</div>

				<div class="collection-card">
					<img
						src="${pageContext.request.contextPath}/resources/images/technology.png"
						alt="썸네일3" />
					<div class="collection-info">
						<p class="title">PICK IT 보따리 컬렉션 모음</p>
						<p class="meta">조회수 378 · 좋아요 7 · 댓글 7</p>
					</div>
				</div>

				<div class="collection-card">
					<img
						src="${pageContext.request.contextPath}/resources/images/technology.png"
						alt="썸네일4" />
					<div class="collection-info">
						<p class="title">요즘IT도 광고해요</p>
						<p class="meta">조회수 283 · 좋아요 3 · 댓글 3</p>
					</div>
				</div>

			</div>
		</div>

		<!-- 👥 회원가입 CTA -->
		<div class="cta-signup">
			<p>
				지금 회원가입하고<br>실무 꿀팁을 스크랩해 보세요.
			</p>
			<a href="${pageContext.request.contextPath}/signup/signUp.do"
				class="signup-btn">회원가입</a>
		</div>

	</section>

	<footer>
		<jsp:include page="/include/footer.jsp" />
	</footer>
</body>
</html>
