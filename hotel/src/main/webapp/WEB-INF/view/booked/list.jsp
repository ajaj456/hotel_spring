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
	<h2>예약 리스트</h2>
	<br>
	<table>
		<tr>
			<th>객실 번호</th>
			<th>객실 이름</th>
			<th>객실 정보</th>
			<th>객실 사이즈</th>
			<th>객실 가격</th>
			<th>객실 층수</th>
		</tr>
		<c:forEach var="booked" items="${list}">
			<tr>
		<td><a href="view.do?no=${booked.roomNo }">${booked.roomNo }</a></td>
<%-- 		<td>${booked.rName}</td> --%>
<%-- 		<td><pre>${booked.roomInfo}</pre></td> --%>
<%-- 		<td>${booked.rSize}</td> --%>
<%-- 		<td>${booked.price}</td> --%>
<%-- 		<td>${booked.floor }</td> --%>
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