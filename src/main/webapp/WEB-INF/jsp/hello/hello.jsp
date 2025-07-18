<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> 
 		<p>서버에서 받은 메세지 : ${msg}</p> 
 		<p>내이름 출력하기 : ${name}</p>
 		<p>${today}</p>
 		<!-- HelloController 에 mav 객체에 addObject 안에 키값 벨류 형식으로 입력
 			jsp 에서 가져올 떄 키 값을 입력하면 벨류를 가져온다
 		 -->  

</body>
</html>