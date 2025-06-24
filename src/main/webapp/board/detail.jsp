<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@page import="kr.ac.kopo.board.dao.BoardDAO"%>
<%@page import="kr.ac.kopo.board.dao.BoardDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>    

<%
	// http://localhost:8080/Board-WEB/board/detail.jsp?no=3 요청

	// 1. 파라미터 추출
	String paramNo = request.getParameter("no");
	int no = 0;

	if (paramNo == null || paramNo.trim().isEmpty()) {
	    out.println("<script>alert('잘못된 접근입니다. 글 번호가 없습니다.'); history.back();</script>");
	    return;
	}

	try {
	    no = Integer.parseInt(paramNo);
	} catch (NumberFormatException e) {
	    out.println("<script>alert('글 번호가 잘못되었습니다.'); history.back();</script>");
	    return;
	}

	// 2. 게시글 조회
	BoardDAO boardDao = new BoardDAOImpl();
	BoardVO board = boardDao.selectBoardByNo(no);

	// 3. 게시글 존재 여부 확인
	if (board == null) {
	    out.println("<script>alert('해당 게시글이 존재하지 않습니다.'); history.back();</script>");
	    return;
	}

	// 4. 공유영역 저장
	request.setAttribute("board", board);
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세 보기</title>
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

    const postNo = new URLSearchParams(window.location.search).get("no");

    listBtn?.addEventListener("click", function () {
        window.location.href = "/Board-WEB/board/list.jsp";
    });

    updateBtn?.addEventListener("click", function () {
        if (postNo) {
            window.location.href = "/Board-WEB/board/update.jsp?no=" + postNo;
        } else {
            alert("글 번호가 없습니다.");
        }
    });

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
		<table border="1">
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
