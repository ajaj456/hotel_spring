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
	${board }
	<h2>후기 게시판</h2>
	<br>
	<table>
		<tr>
			<th>글번호</th>
			<th>글제목</th>
			<th>조회수</th>
			<th>작성일</th>
			<th>아이디</th>
			
		</tr>
		<c:forEach var="board" items="${list}">
			<tr>
		<td><a href="view.do?no=${board.no}">${board.no}</a></td>
		<td>${board.title}</td>
		<td><pre>${board.hit}</pre></td>
		<td>${board.wdate}</td>
		<td>${board.id}</td>
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