<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<table style="width: 100%; border-collapse: collapse;" id="topMenu">
	<tr>
		<!-- 로고 영역 -->
		<td rowspan="2" style="width: 150px; height: 150px;"><img
			src="/Board-WEB/resources/images/logo.png"
			style="width: 230px; height: 90px;"></td>

		<!-- 검색창 영역 -->
		<td align="right" style="vertical-align: top; padding: 10px;">
			<form class="search-form" action="/Board-WEB/search.do" method="get"
				style="display: flex; justify-content: flex-end; align-items: center;">
				<input type="text" id="keyword" name="keyword"
					placeholder="검색어를 입력하세요" style="padding: 5px;">
				<button type="submit" style="margin-left: 5px; padding: 5px;">검색</button>
			</form>
		</td>
	</tr>

	<tr>
		<!-- 메뉴 영역 -->
		<td align="center" style="padding-right: 10px;"><span
			style="float: right;">GUEST님 환영합니다</span> | <a
			href="/Board-WEB/board/list.do">게시판</a> | <a
			href="/Board-WEB/board/signIn.do">회원가입</a> | <a href="#">로그인</a> | <a
			href="#">마이페이지</a> | <a href="#">로그아웃</a></td>
	</tr>
</table>