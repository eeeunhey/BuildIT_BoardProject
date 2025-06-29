<%@ page language="java" contentType="text/html; charset=UTF-8"
<<<<<<< HEAD
    pageEncoding="UTF-8"%>
=======
	pageEncoding="UTF-8"%>
>>>>>>> 1696acf (ui update250629)
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<<<<<<< HEAD
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
=======
<link rel="stylesheet" href="resources/css/login.css">
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
					개인회원<br>
					<small>(일자리 찾기)</small>
				</div>
				<div class="tab-btn" data-type="company">
					기업회원<br>
					<small>(알바생 찾기)</small>
				</div>
			</div>

			<!-- 개인회원 로그인 폼 -->
			<form id="personalForm" action="/Board-WEB/loginProcess.do"method="post"
				class="login-form">
				<div class="input-group">
					<div class="input-fields">
						<input type="text" name="id" placeholder="아이디" required /> <input
							type="password" name="password" placeholder="비밀번호" required />
					</div>
					<button type="submit" id="loginBtn"
						style="background-color: #ffeb3b;">로그인</button>
				</div>

				<div class="options">
					<label><input type="checkbox" name="remember"> 아이디
						저장</label> <span>보안접속 <strong style="color: green;">ON</strong></span>
				</div>

				<div class="links">
					<a href="#">회원가입</a> | <a href="#">아이디 찾기</a> | <a href="#">비밀번호
						찾기</a>
				</div>

				<div class="sns-buttons">
					<button style="background-color: #1ec800;">네이버</button>
					<button style="background-color: #ffe812; color: #000;">카카오톡</button>
					<button style="background-color: #1877f2; color: #fff;">페이스북</button>
					<button style="background-color: #000; color: #fff;">Apple</button>
				</div>
			</form>

			<!-- 기업회원 로그인 폼 -->
			<form id="companyForm" action="/Board-WEB/loginProcess.do" method="post"
				class="login-form" style="display: none;">
				<div class="input-group">
					<div class="input-fields">
						<input type="text" name="id" placeholder="아이디" required /> <input
							type="password" name="password" placeholder="비밀번호" required />
					</div>
					<button type="submit"
						style="background-color: #2196f3; color: white;">로그인</button>
				</div>

				<div class="options">
					<label><input type="checkbox" name="remember"> 아이디
						저장</label> <span>보안접속 <strong style="color: green;">ON</strong></span>
				</div>

				<div class="links">
					<a href="#">회원가입</a> | <a href="#">아이디 찾기</a> | <a href="#">비밀번호
						찾기</a>
				</div>
			</form>
		</div>

		<!-- 오른쪽: 서비스 설명 영역 -->
		<div class="side-info">
			<h3 id="service-title">개인회원 특별서비스</h3>
			<div id="service-items">
				<div class="service-item">
					<strong>원-클릭 입사지원</strong><span>알바천국 이력서만 있으면 클릭 한 번에 입사지원
						끝!</span>
				</div>
				<div class="service-item">
					<strong>SMART 맞춤 채용정보</strong><span>희망 근무조건을 입력하면 매칭율 높은 공고를
						알려드려요.</span>
				</div>
				<div class="service-item">
					<strong>알바상담센터</strong><span>임금체불, 근로계약, 부당대우 등 각종 문제에 무료상담
						지원해드려요.</span>
				</div>
			</div>
		</div>
	</div>
>>>>>>> 1696acf (ui update250629)
</body>
</html>
