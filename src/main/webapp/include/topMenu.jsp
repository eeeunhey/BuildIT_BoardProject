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

      <!-- 🔍 개선된 검색창 -->
      <form class="search-form" action="${pageContext.request.contextPath}/search.do" method="get">
        <select name="category" class="category-select">
          <option value="all">전체</option>
          <option value="job">구인공고</option>
          <option value="project">프로젝트</option>
          <option value="study">스터디</option>
        </select>
        <input type="text" name="keyword" placeholder="어떤 프로젝트를 찾으세요?" />
        <button type="submit">&#128269;</button>
      </form>
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
    <a href="${pageContext.request.contextPath}/board/signIn.do">회원가입</a>
    <a href="${pageContext.request.contextPath}/login/login.do">로그인</a>
  </div>
</div>

</body>
</html>
