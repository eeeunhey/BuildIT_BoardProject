<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>   
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>π 프로젝트 등록하기</title>
  <link rel="stylesheet" href="/Board-WEB/resources/css/writeForm.css">
</head>
<body>
  <header>
    <jsp:include page="/include/topMenu.jsp" />
  </header>

  <section>
    <div class="form-container">
      <h2>프로젝트 등록</h2>

      <form name="wForm" action="/Board-WEB/board/write.do" method="post"
            enctype="multipart/form-data" onsubmit="return checkForm()">

        <input type="hidden" name="writer_id" value="${userVO.id}">

        <!-- 제목 -->
        <div class="form-group">
          <label for="title">제목</label>
          <input type="text" id="title" name="title" required>
        </div>

        <!-- 작성자 -->
        <div class="form-group">
          <label>작성자</label>
          <div class="readonly-box">${userVO.id}</div>
        </div>

        <!-- 근무지역 -->
        <div class="form-group">
          <label for="location">근무지역</label>
          <input type="text" id="location" name="location" required>
        </div>11111121	           aa22222aㅇㄴㅇㄴ

        <!-- 급여 -->
        <div class="form-group">
          <label for="pay">시급/급여</label>
          <input type="number" id="pay" name="pay" required>
        </div>

        <!-- 근무시간 -->
        <div class="form-group">
          <label for="work_time">근무시간</label>
          <input type="text" id="work_time" name="work_time" placeholder="예: 오전 9시 ~ 오후 6시" required>
        </div>

        <!-- 마감일 -->
        <div class="form-group">
          <label for="deadline">마감일</label>
          <input type="date" id="deadline" name="deadline" required>
        </div>

        <!-- 내용 -->
        <div class="form-group">
          <label for="content">내용</label>
          <textarea id="content" name="content" rows="8" required></textarea>
        </div>

        <!-- 이미지 업로드 -->
        <div class="form-group">
          <label for="image">이미지 업로드</label>
          <input type="file" id="image" name="image" accept="image/*">
        </div>

        <!-- 태그 선택 -->
        <div class="form-group">
          <label>태그 선택</label>
          <div class="tag-checkboxes">
            <label><input type="checkbox" name="tagIds" value="1"> 백엔드</label>
            <label><input type="checkbox" name="tagIds" value="2"> 프론트엔드</label>
            <label><input type="checkbox" name="tagIds" value="3"> AI</label>
            <label><input type="checkbox" name="tagIds" value="4"> DevOps</label>
            <label><input type="checkbox" name="tagIds" value="5"> Python</label>
          </div>
        </div>

        <button type="submit">등록</button>
      </form>
    </div>
  </section>

  <footer>
    <jsp:include page="/include/footer.jsp" />
  </footer>

  <script>
    function checkForm() {
      const f = document.wForm;
      if (f.title.value.trim() === '') { alert('제목을 입력해주세요'); f.title.focus(); return false; }
      if (f.location.value.trim() === '') { alert('근무지역을 입력해주세요'); f.location.focus(); return false; }
      if (f.pay.value.trim() === '') { alert('급여를 입력해주세요'); f.pay.focus(); return false; }
      if (f.work_time.value.trim() === '') { alert('근무시간을 입력해주세요'); f.work_time.focus(); return false; }
      if (f.deadline.value.trim() === '') { alert('마감일을 입력해주세요'); f.deadline.focus(); return false; }
      if (f.content.value.trim() === '') { alert('내용을 입력해주세요'); f.content.focus(); return false; }
      return true;
    }
  </script>
</body>
</html>
