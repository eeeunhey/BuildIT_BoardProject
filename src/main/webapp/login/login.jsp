<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login.css">
<script>
  function onlyOne(checkbox) {
    const checkboxes = document.getElementsByName('type');
    checkboxes.forEach(cb => {
      if (cb !== checkbox) cb.checked = false;
    });
  }
</script>
</head>
<body>
	<div class="container">
		<!-- 왼쪽 영역 -->
		<div class="left-section">
			<p class="slogan">
				빌드잇에서 서비스를<br>하나의 계정으로!
			</p>
			<img
				src="${pageContext.request.contextPath}/resources/images/logo.png"
				alt="서비스 이미지" class="login-image">
		</div>

		<!-- 로그인 박스 -->
		<div class="login-box">
			<h2 class="login-title">로그인</h2>
			<form
				action="${pageContext.request.contextPath}/login/loginProcess.do"
				method="post">

				<!-- 로그인 실패 메시지 출력 -->
				<c:if test="${not empty msg}">
					<div class="login-error" style="color: red; margin-bottom: 10px;">
						${msg}</div>
				</c:if>

				<input type="text" name="id" placeholder="아이디 또는 이메일"
					class="input-field" required> <input type="password"
					name="password" placeholder="비밀번호" class="input-field" required>

				<div class="options">
					<label><input type="checkbox" name="remember"> 로그인
						상태 유지</label> <a href="#" class="link">비밀번호 찾기</a>
				</div>

				<!-- 회원 유형 탭 -->
				<div class="member-type-tab">
					<input type="radio" id="client" name="type" value="CLIENT" checked>
					<label for="client" class="tab client-tab">CLIENT<br>
					<span>파트너스 찾기</span></label> <input type="radio" id="partner" name="type"
						value="PARTNER"> <label for="partner"
						class="tab partner-tab">PARTNER<br>
					<span></span>프로젝트 찾기</label>
				</div>

				<button type="submit" class="login-btn">로그인</button>

				<div class="divider">또는</div>
				<button type="button" class="social-btn google">구글로 로그인</button>
				<button type="button" class="social-btn kakao">카카오로 로그인</button>
			</form>

			<div class="signup-link">
				아직 빌드잇의 통합회원이 아니신가요? <a href="${pageContext.request.contextPath}//login/sign.do">회원가입</a>
			</div>
		</div>
	</div>
</body>
</html>
