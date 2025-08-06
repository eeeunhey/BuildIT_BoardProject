<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>BuildIT_회원가입</title>
  <link rel="stylesheet" href="/Board-WEB/resources/css/register.css">
  
  <script>
    // ✅ 비밀번호 확인 일치 여부 체크
    function validateForm() {
      var pw = document.querySelector('input[name="password"]').value;
      var confirmPw = document.querySelector('input[name="confirmPassword"]').value;
      if (pw !== confirmPw) {
        alert("비밀번호가 일치하지 않습니다.");
        return false;
      }
      return true;
    }

    // ✅ 아이디 실시간 중복 확인
    function checkId() {
      const id = document.getElementById("id").value;
      const result = document.getElementById("idCheckResult");

      if (id === "") {
        result.innerText = "아이디를 입력해주세요.";
        result.style.color = "red";
        return;
      }

      fetch("/checkId.do?id=" + encodeURIComponent(id))
        .then(res => res.text())
        .then(data => {
          if (data === "exist") {
            result.innerText = "이미 사용 중인 아이디입니다.";
            result.style.color = "red";
          } else if (data === "available") {
            result.innerText = "사용 가능한 아이디입니다.";
            result.style.color = "green";
          } else {
            result.innerText = "서버 오류입니다.";
            result.style.color = "orange";
          }
        })
        .catch(err => {
          console.error("중복 확인 오류", err);
          result.innerText = "서버 오류입니다.";
          result.style.color = "orange";
        });
    }
  </script>
</head>
<body>
  <div class="register-container">
    <h2>회원가입</h2>
    <form action="signupProcess.do" method="post" class="register-form" onsubmit="return validateForm()">

      <!-- 아이디 -->
      <label for="id">아이디</label>
      <input type="text" id="id" name="id" placeholder="아이디" required onblur="checkId()">
      <span id="idCheckResult" style="font-size: 12px; display: block; margin-bottom: 10px;"></span>

      <!-- 이름 -->
      <label for="name">이름</label>
      <input type="text" id="name" name="name" placeholder="이름" required>

      <!-- 비밀번호 -->
      <label for="password">비밀번호</label>
      <input type="password" id="password" name="password" placeholder="비밀번호 (8자 이상 32자 이하)" minlength="8" maxlength="32" required>

      <!-- 비밀번호 확인 -->
      <label for="confirmPassword">비밀번호 확인</label>
      <input type="password" id="confirmPassword" name="confirmPassword" placeholder="비밀번호 확인" minlength="8" maxlength="32" required>

      <!-- 회원 유형 선택 (라디오 버튼) -->
      <div class="radio-group">
        <p>회원 유형</p>
        <label>
          <input type="radio" name="type" value="CLIENT" required>
          CLIENT (의뢰인)
        </label>
        <label>
          <input type="radio" name="type" value="PARTNER" required>
          PARTNER (파트너)
        </label>
      </div>

      <!-- 가입 버튼 -->
      <button type="submit" class="btn-primary">회원가입</button>

      <div class="divider"><span>또는</span></div>

      <!-- 소셜 가입 -->
      <button type="button" class="btn-social google" onclick="alert('구글 가입은 현재 준비 중입니다.')">구글로 회원가입</button>
      <button type="button" class="btn-social facebook" onclick="alert('카카오톡 가입은 현재 준비 중입니다.')">카카오톡으로 회원가입</button>

      <p class="login-text">통합회원이신가요? <a href="login.jsp">로그인</a></p>
    </form>
  </div>
</body>
</html>
