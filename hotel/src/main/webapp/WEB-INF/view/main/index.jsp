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

	<div id="hatbang">
		<a href="../room/list.do" id="more">▷더보기</a>
		<h2>핫방</h2>
		<table id="hot">
			<c:forEach var="room" items="${roomList}">
				<tr>
					<td>[${room.roomNo }호] ${room.rName }방</td>
				</tr>
				<tr>
					<td><c:if test="${!empty room.fileName }">
							<a href="../room/view.do?no=${room.roomNo }"> <img
								src="../images/room/${room.fileName}" height="115px"
								width="200px" /></a>
						</c:if></td>
					<td>${room.roomInfo }</td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<div id="gonggi">
		<a href="../notice/list.do" id="more">▷더보기</a>
		<h2>공지</h2>
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

	<div id="mybooked">
		<a href="../booked/mylist.do?id=${login.id}&page=1" id="more">▷더보기</a>
		<table>
			<tr>
				<th>아이디</th>
				<th>객실번호</th>
				<th>숙박시작일</th>
				<th>숙박기간</th>
				<th>결제 금액</th>
			</tr>
			<!-- 반복의 시작 -->
			<c:forEach var="booked" items="${bookedList }">
				<tr>
					<td>${booked.id }</td>
					<td>${booked.roomNo }호</td>
					<td>${booked.startDate }</td>
					<td>${booked.stay }일</td>
					<td>${booked.totalPrice }원</td>
				</tr>
			</c:forEach>
			<!-- 반복의 끝 -->
		</table>
	</div>

</body>
</html>