<%-- 작성일: 2025-08-11 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>상단바</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/topMenu.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>

	<!-- 상단 바 -->
	<header class="header-container">

		<!-- 왼쪽: (한 줄) 로고 + 검색창  → (아래 줄) 메뉴 -->
		<div class="header-left">

			<!-- 🔹 로고 + 검색창 같은 줄 -->
			<div class="logo-search-row">
				<!-- 로고 -->
				<a href="${pageContext.request.contextPath}/index.jsp"> <img
					src="${pageContext.request.contextPath}/resources/images/logo.png"
					alt="로고" class="logo-img">
				</a>

				<!-- 검색창 -->
				<div class="custom-search">
					<div class="dropdown">
						<button class="dropdown-toggle" type="button">
							<span id="selected-category">전체</span> <span class="arrow">▼</span>
						</button>
						<ul class="dropdown-menu">
							<li data-value="all">전체</li>
							<li data-value="title">제목</li>
							<li data-value="skill">관련 기술</li>
							<li data-value="content">프로젝트 내용</li>
						</ul>
					</div>

					<form class="search-box"
						action="${pageContext.request.contextPath}/search.do" method="get">
						<input type="hidden" name="category" id="category-input"
							value="all"> <input type="text" name="keyword"
							placeholder="어떤 프로젝트를 찾으세요?">
						<button type="submit">
							<i class="fas fa-search"></i>
						</button>
					</form>
				</div>
			</div>

			<!-- 메뉴 (로고+검색창 아래 줄) -->
			<nav class="main-menu">
				<a href="${pageContext.request.contextPath}/board/writeForm.do">프로젝트
					등록</a> <a href="${pageContext.request.contextPath}/board/list.do">프로젝트
					탐색</a> <a href="#">나의 성장 잔디</a> <a href="#">강의/스터디 정보</a> <a href="#">참여
					프로젝트 기록</a>
			</nav>
		</div>

		<!-- 오른쪽: 로그인/회원 정보 -->
		<div class="header-right">
			<div class="user-info">
				<span>${empty userVO ? "GUEST" : userVO.name}님 환영합니다</span> <a
					href="${pageContext.request.contextPath}/signup/signUp.do">회원가입</a>
				<a href="${pageContext.request.contextPath}/login/login.do">로그인</a>
			</div>
		</div>

	</header>

	<script>
    document.addEventListener("DOMContentLoaded", () => {
      const dropdown = document.querySelector('.dropdown');
      const toggle = dropdown.querySelector('.dropdown-toggle');
      const menu = dropdown.querySelector('.dropdown-menu');
      const selected = document.getElementById('selected-category');
      const categoryInput = document.getElementById('category-input');

      toggle.addEventListener('click', () => {
        menu.style.display = (menu.style.display === 'block') ? 'none' : 'block';
      });

      menu.querySelectorAll('li').forEach(item => {
        item.addEventListener('click', () => {
          const value = item.getAttribute('data-value');
          selected.textContent = item.textContent;
          categoryInput.value = value;
          menu.style.display = 'none';
        });
      });

      document.addEventListener('click', (e) => {
        if (!dropdown.contains(e.target)) menu.style.display = 'none';
      });
    });
  </script>

</body>
</html>
