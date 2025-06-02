<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@page import="kr.ac.kopo.board.dao.BoardDAO"%>
<%@page import="kr.ac.kopo.board.dao.BoardDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>    
<%
	// http://localhost:8080/Board-WEB/board/detail.jsp?no=3 요청
	/*
		 작업순서
		 1. 파라미터 추출(no: 게시판번호)
		 2. DB에서 해당게시글 조회 
		 3. 조회된 게시글을 공유영역 저장
		 4. 화면 출력
	*/
	
	int no = Integer.parseInt(request.getParameter("no"));
	
	BoardDAO boardDao = new BoardDAOImpl();
	BoardVO board = boardDao.selectBoardByNo(no);
	
	request.setAttribute("board", board);

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#content > * {
		width: 80%;
	}
	td {
		padding-left: 10px;
	}
</style>
<script>
document.addEventListener("DOMContentLoaded", function () {
    const updateBtn = document.getElementById("updateBtn");
    const deleteBtn = document.getElementById("deleteBtn");
    const listBtn = document.getElementById("listBtn");

    // 글 번호를 no로 가져옴
    const postNo = new URLSearchParams(window.location.search).get("no");

    // 목록 버튼
    listBtn?.addEventListener("click", function () {
        window.location.href = "/Board-WEB/board/list.jsp";
    });

    // 수정 버튼
    updateBtn?.addEventListener("click", function () {
        if (postNo) {
            window.location.href = "/Board-WEB/board/update.jsp?no=" + postNo;
        } else {
            alert("글 번호가 없습니다.");
        }
    });

    // 삭제 버튼
    deleteBtn?.addEventListener("click", function () {
        if (confirm("정말 삭제하시겠습니까?")) {
            if (postNo) {
                window.location.href = "/Board-WEB/board/delete.do?no=" + postNo;
            } else {
                alert("글 번호가 없습니다.");
            }
        }
    });
});
</script>
</head>
<body>
	<div align="center" id="content">
		<hr>
		<h2>상세게시글</h2>
		<hr>
		<table border="1" >
			<tr>
				<th width="27%">번호</th>
				<td>${ board.no }</td>
			</tr>
			<tr>
				<th width="27%">제목</th>
				<td><c:out value="${ board.title }" /></td>
			</tr>
			<tr>
				<th width="27%">작성자</th>
				<td>${ board.writer }</td>
			</tr>
			<tr>
				<th width="27%">내용</th>
				<td><c:out value="${ board.content }" /></td>
			</tr>
			<tr>
				<th width="27%">조회수</th>
				<td>${ board.viewCnt }</td>
			</tr>
			<tr>
				<th width="27%">등록일</th>
				<td>${ board.regDate }</td>
			</tr>
		</table>
		<br>
		<button id="listBtn">목록</button>
		<button id="updateBtn">수정</button>
		<button id="deleteBtn">삭제</button>
	</div>
</body>
</html>





