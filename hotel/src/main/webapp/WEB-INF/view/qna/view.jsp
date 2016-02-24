<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>보기</h2>
	<br>
	<table>
		<tr><th>번호</th><td>${qna.no }</td></tr>
		<tr><th>제목</th><td>${qna.title}</td></tr>
		<tr><th>내용</th><td>${qna.content}</td></tr>
		<tr><th>작성일</th><td>${qna.wdate}</td></tr>
		<tr><th>조회수</th><td>${qna.hit }</td></tr>
	</table>
</body>
</html>