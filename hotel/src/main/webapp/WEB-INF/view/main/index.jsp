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
		<a href="../room/list.do" id="more">▷더보기</a>
		<h2>핫방</h2>
		<table id="hot">
			<c:forEach var="room" items="${roomList}">
				<tr>
					<td>[${room.roomNo }호] ${room.rName }방</td>
				</tr>
				<tr>
					<td><c:if test="${!empty room.fileName }">
							<img src="../images/room/${room.fileName}" height="120px"
								width="200px" />
						</c:if></td>
					<td>${room.roomInfo }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div id="div">
		<a href="../notice/list.do" id="more">▷더보기</a>
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