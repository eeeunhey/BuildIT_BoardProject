<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>회원가입</title>
  <link rel="stylesheet" href="/Board-WEB/resources/css/register.css">
</head>
<body>
  <div class="register-container">
    <h2>회원가입</h2>
    <form action="register.do" method="post" class="register-form">
      <!-- 이메일 -->
      <input type="email" name="email" placeholder="이메일" required>
      <p class="info-text">비즈니스용 이메일 사용을 권장합니다.</p>

      <!-- 아이디 -->
      <input type="text" name="userId" placeholder="아이디" required>

      <!-- 비밀번호 -->
      <input type="password" name="password" placeholder="비밀번호 (8자 이상 32자 이하)" required>

      <!-- 비밀번호 확인 -->
      <input type="password" name="confirmPassword" placeholder="비밀번호 확인" required>


      <!-- 가입 버튼 -->
      <button type="submit" class="btn-primary">회원가입</button>

      <div class="divider"><span>또는</span></div>

      <!-- 소셜 가입 -->
      <button type="button" class="btn-social google">구글로 회원가입</button>
      <button type="button" class="btn-social facebook">카카오톡으로 회원가입</button>

      <p class="login-text"> 통합회원이신가요? <a href="login.jsp">로그인</a></p>
    </form>
  </div>
</body>
</html>
