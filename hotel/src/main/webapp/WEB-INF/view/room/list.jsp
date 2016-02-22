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
	${room }
	<h2>객실 리스트</h2>
	<br>
	<table>
		<tr>
			<th>객실 번호</th>
			<th>객실 소개</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="room" items="${list}">
			<tr>

		<td><a href="view.do?no=${room.roomNo }">${room.roomNo }</a></td>
		<th>방 이름</th><td>${room.rName}</td>
		<th>방 정보</th><td><pre>${room.roomInfo}</pre></td>
		<th>방 크기</th><td>${room.rSize}</td>
		<th>가격</th><td>${room.price}</td>
		<th>층수</th><td>${room.floor }</td>
		<tr>
		</c:forEach>
			<td colspan="5"><a href="write.do"><button>글쓰기</button></a></td>
		</tr>
	</table>
	<br>
	<br>
</body>
</html>