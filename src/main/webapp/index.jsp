<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MAIN PAGE</title>
<link rel="stylesheet" href="/Board-WEB/resources/css/layout.css">
<link rel="stylesheet" href="/Board-WEB/resources/css/my_css.css">
<link rel="stylesheet" href="/Board-WEB/resources/css/main.css">
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

		<!-- 📢 배너 광고 -->
		<div class="banner-ad">
			<img
				src="/Board-WEB/resources/images/technology.png" 
				alt="빗썸 채용 배너" style="width: 100%; border-radius: 12px;" />
		</div>

		<!-- 🌟 에디터 추천 컬렉션 -->
		<div class="editor-picks">
			<h3>요즘 에디터의 추천 컬렉션</h3>
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
					<img
						src="/Board-WEB/resources/images/technology.png" 
						alt="썸네일3" />
					<div class="collection-info">
						<p class="title">PICK IT 보따리 컬렉션 모음</p>
						<p class="meta">조회수 378 · 좋아요 7 · 댓글 7</p>
					</div>
				</div>

				<div class="collection-card">
					<img
						src="/Board-WEB/resources/images/technology.png" 
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
			<button class="signup-btn">회원가입</button>
		</div>

	</section>

	<footer>
		<jsp:include page="/include/footer.jsp" />
	</footer>
</body>
</html>
