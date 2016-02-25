<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	${qna }
	<h2>질문답변리스트</h2>
	<br>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>아이디</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="qna" items="${list}">
			<tr>
		<td><a href="view.do?no=${qna.no }">${qna.no }</a></td>
		<td>${qna.title}</td>
		<td>${qna.id}</td>
		<td>${qna.wdate}</td>
		<td>${qna.hit}</td>
		<tr>
		</c:forEach>
		<tr>
			<td><a href="write.do"><button>글쓰기</button></a></td>
		</tr>
	</table>
	<br>
	<br>
</body>
</html>