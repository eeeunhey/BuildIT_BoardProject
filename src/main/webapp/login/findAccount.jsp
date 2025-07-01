<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>아이디/비밀번호 찾기</title>
  <link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/find.css">
</head>
<body>
  <h2>아이디 찾기</h2>
  <form action="${pageContext.request.contextPath}/findId" method="post">
    이름: <input type="text" name="name" required><br>
    이메일: <input type="email" name="email" required><br>
    <input type="submit" value="아이디 찾기">
  </form>

  <h2>비밀번호 찾기</h2>
  <form action="${pageContext.request.contextPath}/findPw" method="post">
    아이디: <input type="text" name="id" required><br>
    이메일: <input type="email" name="email" required><br>
    <input type="submit" value="비밀번호 찾기">
  </form>
</body>
</html>