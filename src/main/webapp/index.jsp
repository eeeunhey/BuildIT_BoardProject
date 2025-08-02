<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

		<div class="job-picks">
			<h4>요즘 뜨는 IT 구인공고</h4>
			<div class="collection-list">

				<div class="collection-card">
					<img src="/Board-WEB/resources/images/workimage.png" alt="IT썸네일1" />
					<div class="collection-info">
						<p class="title">백엔드 개발자 - Spring/MyBatis</p>
						<p class="meta">서울 · 시급 20,000원 · 마감 D-3</p>
					</div>
				</div>

				<div class="collection-card">
					<img src="/Board-WEB/resources/images/workimage.png" alt="IT썸네일2" />
					<div class="collection-info">
						<p class="title">프론트엔드 개발자 - React</p>
						<p class="meta">부산 · 월급 300만원 · 마감 D-5</p>
					</div>
				</div>

				<div class="collection-card">
					<img src="/Board-WEB/resources/images/workimage.png" alt="IT썸네일3" />
					<div class="collection-info">
						<p class="title">AI 모델 학습 데이터 가공</p>
						<p class="meta">재택 가능 · 일급 15만원 · 마감 D-2</p>
					</div>
				</div>

				<div class="collection-card">
					<img src="/Board-WEB/resources/images/workimage.png" alt="IT썸네일4" />
					<div class="collection-info">
						<p class="title">IoT 기반 시스템 테스트</p>
						<p class="meta">대전 · 시급 18,000원 · 마감 D-1</p>
					</div>
				</div>

			</div>
		</div>

		<!-- 🌟 에디터 추천 컬렉션 -->
		<div class="editor-picks">
			<h3>요즘 뜨는 인기 컬렉션</h3>
			<div class="collection-list">

				<div class="collection-card">
					<img src="/Board-WEB/resources/images/technology.png" alt="썸네일1" />
					<div class="collection-info">
						<p class="title">불쾌한 골짜기 밟도록 못 가는 AI</p>
						<p class="meta">조회수 632 · 좋아요 7 · 댓글 6</p>
					</div>
				</div>

				<div class="collection-card">
					<img src="/Board-WEB/resources/images/technology.png" alt="썸네일2" />
					<div class="collection-info">
						<p class="title">고양이도 알아듣는 생존형 AI</p>
						<p class="meta">조회수 257 · 좋아요 3 · 댓글 2</p>
					</div>
				</div>

				<div class="collection-card">
					<img src="/Board-WEB/resources/images/technology.png" alt="썸네일3" />
					<div class="collection-info">
						<p class="title">PICK IT 보따리 컬렉션 모음</p>
						<p class="meta">조회수 378 · 좋아요 7 · 댓글 7</p>
					</div>
				</div>

				<div class="collection-card">
					<img src="/Board-WEB/resources/images/technology.png" alt="썸네일4" />
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
			<a href="${pageContext.request.contextPath}board/signIn/signIn.do"
				class="signup-btn"> 회원가입 </a>
		</div>

	</section>

	<footer>
		<jsp:include page="/include/footer.jsp" />
	</footer>
</body>
</html>
