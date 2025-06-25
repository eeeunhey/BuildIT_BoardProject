<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="/Board-WEB/resources/css/login.css">
<script>
  window.onload = function() {
    const tabs = document.querySelectorAll('.tab');
    const forms = document.querySelectorAll('.login-form');
    const personalService = document.getElementById('personal-service');
    const companyService = document.getElementById('company-service');

    tabs.forEach((tab, index) => {
      tab.addEventListener('click', () => {
        tabs.forEach(t => t.classList.remove('active'));
        tab.classList.add('active');

        forms.forEach(f => f.style.display = 'none');
        forms[index].style.display = 'block';

        if (index === 0) {
          personalService.style.display = 'block';
          companyService.style.display = 'none';
        } else {
          personalService.style.display = 'none';
          companyService.style.display = 'block';
        }
      });
    });
  };
</script>
</head>
<body>
  <div class="login-wrapper">
    <div class="login-inner">

      <div class="login-main">
        <!-- 왼쪽: 탭 + 로그인폼 -->
        <div class="login-left">
          <!-- 탭 -->
          <div class="login-tabs">
            <div class="tab active">개인회원<br><span>(일자리 찾기)</span></div>
            <div class="tab">기업회원<br><span>(알바생 찾기)</span></div>
          </div>

          <!-- 로그인 폼 -->
          <div class="login-form-container">
            <!-- 개인회원 -->
            <div class="login-form" style="display: block;">
              <form action="/Board-WEB/loginPersonal.do" method="post">
                <input type="text" name="id" placeholder="아이디" class="input-box" />
                <div class="input-group">
                  <input type="password" name="password" placeholder="비밀번호" class="input-box" />
                  <button type="submit" class="login-btn">로그인</button>
                </div>
                <div class="login-options">
                  <label><input type="checkbox" /> 아이디 저장</label>
                  <div class="secure">🔒 보안접속 <span>ON</span></div>
                </div>
                <div class="login-links">
                  <a href="#">회원가입</a> | <a href="#">아이디 찾기</a> | <a href="#">비밀번호 찾기</a>
                </div>
              </form>
            </div>

            <!-- 기업회원 -->
            <div class="login-form" style="display: none;">
              <form action="/Board-WEB/loginCompany.do" method="post">
                <input type="text" name="bizId" placeholder="아이디" class="input-box" />
                <div class="input-group">
                  <input type="password" name="bizPassword" placeholder="비밀번호" class="input-box" />
                  <button type="submit" class="login-btn blue">로그인</button>
                </div>
                <div class="login-options">
                  <label><input type="checkbox" /> 아이디 저장</label>
                  <div class="secure">🔒 보안접속 <span>ON</span></div>
                </div>
                <div class="login-links">
                  <a href="#">회원가입</a> | <a href="#">아이디 찾기</a> | <a href="#">비밀번호 찾기</a>
                </div>
              </form>
            </div>
          </div>
        </div>

        <!-- 오른쪽: 서비스 안내 -->
        <div class="service-box">
          <!-- 개인회원 서비스 -->
          <div class="service-info" id="personal-service" style="display: block;">
            <h3 class="service-title personal">개인회원 특별서비스</h3>
            <div class="service-item">
              <div class="icon">🖱️</div>
              <div>
                <strong>원-클릭 입사지원</strong><br>
                알바천국 이력서만 있으면 클릭 한 번에 입사지원 끝!
              </div>
            </div>
            <div class="service-item">
              <div class="icon">🎯</div>
              <div>
                <strong>SMART 맞춤 채용정보</strong><br>
                희망 근무조건을 입력하면 매칭률 높은 공고를 알려드려요.
              </div>
            </div>
          </div>

          <!-- 기업회원 서비스 -->
          <div class="service-info" id="company-service" style="display: none;">
            <h3 class="service-title company">기업회원 특별서비스</h3>
            <div class="service-item">
              <div class="icon">📄</div>
              <div>
                <strong>쉽고 빠른 공고등록</strong><br>
                AI 추천기능으로 더 빨라진 공고등록!<br>
                지원자도 한곳에서 쉽게 관리할 수 있어요.
              </div>
            </div>
            <div class="service-item">
              <div class="icon">🎟️</div>
              <div>
                <strong>무료공고 & 할인쿠폰 제공</strong><br>
                공고등록 무료 + 다양한 혜택 제공!
              </div>
            </div>
          </div>
        </div>
      </div> <!-- .login-main -->
    </div> <!-- .login-inner -->
  </div> <!-- .login-wrapper -->
</body>
</html>
