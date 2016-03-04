<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인</title>
<link href="../css/main/index.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div id="me"></div>
	<div id="div">
		<h2>객실정보</h2>
		<table>
			<tr>
				<th>호실</th>
				<th>객실사진</th>
			</tr>
			<c:forEach var="room" items="${roomList}">
				<tr>
					<td>${room.roomNo }</td>
					<td><c:if test="${!empty room.fileName }">
							<img src="../images/room/${room.fileName}" />
						</c:if></td>
				<tr>
			</c:forEach>
		</table>
	</div>
	<div id="div">
		<h2>공지사항</h2>
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성일</th>
				<th>작성자</th>
			</tr>
			<c:forEach var="notice" items="${noticeList}">
				<tr>
					<td>${notice.no }</td>
					<td>${notice.title}</td>
					<td>${notice.wdate}</td>
					<td>관리자</td>
				<tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>