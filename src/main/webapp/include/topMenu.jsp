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
  <!-- 왼쪽 그룹: 로고 + 검색창 (가로), 메뉴 (아래) -->
  <div class="left-group">
    <div class="logo-search">
      <div class="logo">
      	<a href="${pageContext.request.contextPath}/index.jsp">
        <img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="로고" class="logo-img">
        </a>
      </div>
      <form class="search-form" action="${pageContext.request.contextPath}/search.do" method="get">
        <input type="text" name="keyword" placeholder="어떤 업무를 찾으세요?">
        <button type="submit">&#128269;</button>
      </form>
    </div>

    <div class="main-menu">
      <a href="${pageContext.request.contextPath}/board/list.do">채용정보</a>
      <a href="#">개인서비스</a>
      <a href="#">취준성장</a>
      <a href="#">자료실</a>
    </div>
  </div>

  <!-- 오른쪽: 회원 정보 -->
  <div class="right-group">
    <span>${ empty userVO ? "GUEST" : userVO.name }님 환영합니다</span>
    <a href="${pageContext.request.contextPath}/board/signIn.do">회원가입</a>
    <a href="${pageContext.request.contextPath}/login.do">로그인</a>
  </div>
</div>

</body>
</html>
