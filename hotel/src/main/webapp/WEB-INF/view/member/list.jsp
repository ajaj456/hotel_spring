<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원 리스트</h2>
	<table>
		<tr>
			<th>id</th>
			<th>name</th>
			<th>grade</th>
		</tr>
		<!-- 	반복의 시작 -->
		<c:forEach var="member" items="${list }">
			<tr>
				<td>${member.id }</td>
				<td><a href="view.do?id=${member.id }">${member.name }</a></td>
				<td>${member.grade }</td>
			</tr>
		</c:forEach>
		<!-- 	반복의 끝 -->
	</table>
</body>
</html>