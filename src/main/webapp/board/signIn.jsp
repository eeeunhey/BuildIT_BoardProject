<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>개인회원가입</title>
    <link rel="stylesheet" href="/Board-WEB/resources/css/register.css">
</head>
<body>
    <div class="container">
        <h2>개인회원가입</h2>
        <form action="register.do" method="post">
            <label>내국인/외국인</label>
            <div class="radio-group">
                <label><input type="radio" name="nationality" value="local" checked> 내국인</label>
                <label><input type="radio" name="nationality" value="foreigner"> 외국인</label>
            </div>

            <label>아이디</label>
            <input type="text" name="userId" required>

            <label>비밀번호</label>
            <input type="password" name="password" required>

            <label>비밀번호 확인</label>
            <input type="password" name="confirmPassword" required>

            <label>이름</label>
            <input type="text" name="name" required>

            <label>생년월일 (YYYYMMDD)</label>
            <input type="text" name="birthDate" maxlength="8" required>

            <label>성별</label>
            <div class="radio-group">
                <label><input type="radio" name="gender" value="male"> 남자</label>
                <label><input type="radio" name="gender" value="female"> 여자</label>
            </div>

            <label>이메일</label>
            <input type="email" name="email" required>

            <label>휴대폰 번호</label>
            <input type="text" name="phone" required>

            <label>인증번호</label>
            <input type="text" name="verifyCode" style="width: 70%;">
            <input type="button" value="인증번호 요청" class="verify-btn">

            <div class="clearfix"></div>
            <input type="submit" value="가입하기" class="btn">
        </form>
    </div>
</body>
</html>