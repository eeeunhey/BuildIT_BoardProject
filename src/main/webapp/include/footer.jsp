<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>footer</title>
  <link rel="stylesheet" href="/Board-WEB/resources/css/layout.css">
</head>
<body>

<div class="custom-footer">
  <div class="footer-menu">
    <a href="#">소개</a>
    <a href="#">이용방법</a>
    <a href="#">뉴스센터</a>
    <a href="#">고객센터</a>
  </div>

  <div class="footer-logo">
    <img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="로고" class="main-logo">
  </div>

  <div class="footer-sns">
    <img src="${pageContext.request.contextPath}/resources/images/GitHub.png" alt="GitHub" class="sns-icon">
    <img src="${pageContext.request.contextPath}/resources/images/LinkedIn.png" alt="LinkedIn" class="sns-icon">
    <img src="${pageContext.request.contextPath}/resources/images/Google Maps.png" alt="Google Maps" class="sns-icon">
  </div>
</div>



</body>
</html>