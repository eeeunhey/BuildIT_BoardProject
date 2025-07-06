<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>   

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>π 프로젝트 등록하기</title>

  <!-- 외부 CSS -->
  <link rel="stylesheet" href="/Board-WEB/resources/css/layout.css">
  <link rel="stylesheet" href="/Board-WEB/resources/css/my_css.css">
  <link rel="stylesheet" href="/Board-WEB/resources/css/writeForm.css">

  <!-- JS 유효성 검사 -->
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
</head>
<body>

  <!-- 상단 메뉴 포함 -->
  <header>
    <jsp:include page="/include/topMenu.jsp" />
  </header>

  <!-- 본문 -->
  <section>
    <div align="center" id="content">
      <hr>
      <h2>프로젝트 등록</h2>
      <hr>
      <br>

      <form name="wForm" action="/Board-WEB/board/write.do" method="post"
            enctype="multipart/form-data" onsubmit="return checkForm()">

        <input type="hidden" name="writer_id" value="${userVO.id}">

        <table style="width: 80%;">
          <tr>
            <th width="25%">제목</th>
            <td><input type="text" name="title" required></td>
          </tr>
          <tr>
            <th>작성자</th>
            <td><div class="readonly-box">${userVO.id}</div></td>
          </tr>
          <tr>
            <th>내용</th>
            <td><textarea id="content" name="content" rows="8" cols="60" required></textarea></td>
          </tr>
          <tr>
            <th>근무지역</th>
            <td><input type="text" id="location" name="location" required></td>
          </tr>
          <tr>
            <th>시급/급여</th>
            <td><input type="number" id="pay" name="pay" required></td>
          </tr>
          <tr>
            <th>근무시간</th>
            <td><input type="text" id="work_time" name="work_time" placeholder="예: 오전 9시 ~ 오후 6시" required></td>
          </tr>
          <tr>
            <th>마감일</th>
            <td><input type="date" id="deadline" name="deadline" required></td>
          </tr>
          <tr>
            <th>이미지 업로드</th>
            <td><input type="file" id="image" name="image" accept="image/*"></td>
          </tr>
          <tr>
            <th>태그 선택</th>
            <td>
              <div class="tag-checkboxes">
                <label><input type="checkbox" name="tagIds" value="1"> 백엔드</label>
                <label><input type="checkbox" name="tagIds" value="2"> 프론트엔드</label>
                <label><input type="checkbox" name="tagIds" value="3"> AI</label>
                <label><input type="checkbox" name="tagIds" value="4"> DevOps</label>
                <label><input type="checkbox" name="tagIds" value="5"> Python</label>
              </div>
            </td>
          </tr>
        </table>
        <br>
        <button type="submit">등록</button>
      </form>
    </div>
  </section>

  <!-- 하단 푸터 포함 -->
  <footer>
    <jsp:include page="/include/footer.jsp" />
  </footer>
</body>
</html>
