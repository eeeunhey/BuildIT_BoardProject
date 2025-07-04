<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>상단바</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/topMenu.css">
</head>
<body>

<div class="top-bar">
  <!-- 왼쪽 그룹: 로고 + 검색창 -->
  <div class="left-group">
    <div class="logo-search">
      <!-- 로고 -->
      <div class="logo">
        <a href="${pageContext.request.contextPath}/index.jsp">
          <img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="로고" class="logo-img">
        </a>
      </div>

<!-- 커스텀 검색창 -->
      <div class="custom-search">
        <div class="dropdown">
          <button class="dropdown-toggle" type="button">
            <span id="selected-category">전체</span>
            <span class="arrow">&#9662;</span>
          </button>
          <ul class="dropdown-menu">
            <li data-value="all">전체</li>
            <li data-value="title">제목</li>
            <li data-value="skill">관련 기술</li>
            <li data-value="content">프로젝트 내용</li>
          </ul>
        </div>

        <form class="search-box" action="${pageContext.request.contextPath}/search.do" method="get">
          <input type="hidden" name="category" id="category-input" value="all">
          <input type="text" name="keyword" placeholder="어떤 프로젝트를 찾으세요?">
          <button type="submit">&#128269;</button>
        </form>
      </div>
    </div>

    <!-- 메뉴 -->
    <div class="main-menu">
      <a href="${pageContext.request.contextPath}/board/writeForm.do">프로젝트 등록</a>
      <a href="${pageContext.request.contextPath}/board/list.do">프로젝트 탐색</a>
      <a href="#">나의 성장 잔디</a>
      <a href="#">강의 / 스터디 정보 공유</a>
      <a href="#">참여 프로젝트 기록</a>
    </div>
  </div>

  <!-- 오른쪽: 회원 정보 -->
  <div class="right-group">
    <span>${ empty userVO ? "GUEST" : userVO.name }님 환영합니다</span>
    <a href="${pageContext.request.contextPath}/signIn/signIn.do">회원가입</a>
    <a href="${pageContext.request.contextPath}/login/login.do">로그인</a>
  </div>
</div>

<script>
  document.addEventListener("DOMContentLoaded", () => {
    const toggle = document.querySelector('.dropdown-toggle');
    const menu = document.querySelector('.dropdown-menu');
    const selected = document.getElementById('selected-category');
    const categoryInput = document.getElementById('category-input');

    toggle.addEventListener('click', () => {
      menu.style.display = menu.style.display === 'block' ? 'none' : 'block';
    });

    menu.querySelectorAll('li').forEach(item => {
      item.addEventListener('click', () => {
        const value = item.getAttribute('data-value');
        selected.textContent = item.textContent;
        categoryInput.value = value;
        menu.style.display = 'none';
      });
    });

    document.addEventListener('click', e => {
      if (!document.querySelector('.dropdown').contains(e.target)) {
        menu.style.display = 'none';
      }
    });
  });
</script>

</body>
</html>
