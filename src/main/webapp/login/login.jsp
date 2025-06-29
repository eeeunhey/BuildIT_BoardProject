<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>로그인</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">

  <script>
    window.onload = function () {
      const tabs = document.querySelectorAll('.tab-btn');
      const personalForm = document.querySelector('#personalForm');
      const companyForm = document.querySelector('#companyForm');
      const serviceTitle = document.querySelector('#service-title');
      const serviceItems = document.querySelector('#service-items');

      tabs.forEach(tab => {
        tab.addEventListener('click', function () {
          tabs.forEach(t => t.classList.remove('active'));
          this.classList.add('active');

          const type = this.dataset.type;
          if (type === 'personal') {
            personalForm.style.display = 'block';
            companyForm.style.display = 'none';
            serviceTitle.innerText = '개인회원 특별서비스';
            serviceItems.innerHTML = `
              <div class="service-item"><strong>원-클릭 입사지원</strong><span>알바천국 이력서만 있으면 클릭 한 번에 입사지원 끝!</span></div>
              <div class="service-item"><strong>SMART 맞춤 채용정보</strong><span>희망 근무조건을 입력하면 매칭율 높은 공고를 알려드려요.</span></div>
              <div class="service-item"><strong>알바상담센터</strong><span>임금체불, 근로계약, 부당대우 등 각종 문제에 무료상담 지원해드려요.</span></div>
            `;
          } else {
            personalForm.style.display = 'none';
            companyForm.style.display = 'block';
            serviceTitle.innerText = '기업회원 특별서비스';
            serviceItems.innerHTML = `
              <div class="service-item"><strong>쉽고 빠른 공고등록</strong><span>AI 추천으로 더 빠르게 공고 등록!</span></div>
              <div class="service-item"><strong>무료공고 & 할인쿠폰</strong><span>기업회원은 공고등록이 무료! 쿠폰 혜택도 풍부해요.</span></div>
              <div class="service-item"><strong>정액권 · 이력서열람</strong><span>35% 할인된 상품과 인재 검색 기능 제공.</span></div>
            `;
          }
        });
      });
    }
  </script>
</head>
<body>
  <div class="container">
    <!-- 왼쪽: 로그인 영역 -->
    <div class="login-section">
      <div class="tab-buttons">
        <div class="tab-btn active" data-type="personal">
          개인회원<br> <small>(일자리 찾기)</small>
        </div>
        <div class="tab-btn" data-type="company">
          기업회원<br> <small>(알바생 찾기)</small>
        </div>
      </div>

      <!-- 개인회원 로그인 폼 -->
      <form id="personalForm" action="${pageContext.request.contextPath}/login/loginProcess.do" method="post" class="login-form">
        <div class="input-group">
          <div class="input-fields">
            <input type="text" name="id" placeholder="아이디" required />
            <input type="password" name="password" placeholder="비밀번호" required />
          </div>
          <button type="submit" id="loginBtn" style="background-color: #ffeb3b;">로그인</button>
        </div>

        <div class="options">
          <label><input type="checkbox" name="remember"> 아이디 저장</label>
          <span>보안접속 <strong style="color: green;">ON</strong></span>
        </div>

        <div class="links">
          <a href="#">회원가입</a> | <a href="#">아이디 찾기</a> | <a href="#">비밀번호 찾기</a>
        </div>

        <div class="sns-buttons">
          <button style="background-color: #1ec800;">네이버</button>
          <button style="background-color: #ffe812; color: #000;">카카오톡</button>
          <button style="background-color: #1877f2; color: #fff;">페이스북</button>
          <button style="background-color: #000; color: #fff;">Apple</button>
        </div>
      </form>

      <!-- 기업회원 로그인 폼 -->
      <form id="companyForm" action="${pageContext.request.contextPath}/login/loginProcess.do" method="post" class="login-form" style="display: none;">
        <div class="input-group">
          <div class="input-fields">
            <input type="text" name="id" placeholder="아이디" required />
            <input type="password" name="password" placeholder="비밀번호" required />
          </div>
          <button type="submit" style="background-color: #2196f3; color: white;">로그인</button>
        </div>

        <div class="options">
          <label><input type="checkbox" name="remember"> 아이디 저장</label>
          <span>보안접속 <strong style="color: green;">ON</strong></span>
        </div>

        <div class="links">
          <a href="#">회원가입</a> | <a href="#">아이디 찾기</a> | <a href="#">비밀번호 찾기</a>
        </div>
      </form>
    </div>

    <!-- 오른쪽: 서비스 설명 영역 -->
    <div class="side-info">
      <h3 id="service-title">개인회원 특별서비스</h3>
      <div id="service-items">
        <div class="service-item">
          <strong>원-클릭 입사지원</strong><span>알바천국 이력서만 있으면 클릭 한 번에 입사지원 끝!</span>
        </div>
        <div class="service-item">
          <strong>SMART 맞춤 채용정보</strong><span>희망 근무조건을 입력하면 매칭율 높은 공고를 알려드려요.</span>
        </div>
        <div class="service-item">
          <strong>알바상담센터</strong><span>임금체불, 근로계약, 부당대우 등 각종 문제에 무료상담 지원해드려요.</span>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
