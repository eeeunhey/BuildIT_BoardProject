<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@page import="kr.ac.kopo.board.dao.BoardDAO"%>
<%@page import="kr.ac.kopo.board.dao.BoardDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<%
int no = Integer.parseInt(request.getParameter("postId"));

BoardDAO boardDao = new BoardDAOImpl();
BoardVO board = boardDao.selectBoardByNo(no);

request.setAttribute("board", board);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세 보기</title>
<link rel="stylesheet" href="/Board-WEB/resources/css/detail.css">
<style>
#content>* {
	width: 80%;
}

td {
	padding-left: 10px;
}
</style>
<script>
	window.onload = function() {
		document.querySelector('#listBtn').addEventListener('click',
				function() {
					location.href = 'list.do';
				});
	}
</script>
</head>
<body>
	<div class="job-conditions">
		<div class="condition-box">
			<table>
				<tr>
					<th>시급</th>
					<td><span class="highlight">시급</span> ${board.pay}원</td>
				</tr>
				<tr>
					<th>지역</th>
					<td>${board.location}</td>
				</tr>
				<tr>
					<th>근무시간</th>
					<td>${board.workTime}</td>
				</tr>
				<tr>
					<th>등록일</th>
					<td>${board.regDate}</td>
				</tr>
				<tr>
					<th>마감일</th>
					<td>${board.deadline}</td>
				</tr>
			</table>
		</div>

		<div class="condition-box">
			<table>
				<tr>
					<th>글 번호</th>
					<td>${board.postId}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><c:out value="${board.title}" /></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${board.writerId}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td><c:out value="${board.content}" /></td>
				</tr>
			</table>
		</div>
	</div>

	<br>
	<div align="center">
		<c:choose>
			<c:when test="${sessionScope.userType eq 'company'}">
				<button id="listBtn">목록</button>
				<button id="updateBtn">수정</button>
				<button id="deleteBtn">삭제</button>
			</c:when>
			<c:when test="${sessionScope.userType eq 'user'}">
				<button id="listBtn">목록</button>
				<button id="applyBtn">지원</button>
			</c:when>
			<c:otherwise>
				<button id="listBtn">목록</button>
			</c:otherwise>
		</c:choose>
	</div>

</body>
</html>
