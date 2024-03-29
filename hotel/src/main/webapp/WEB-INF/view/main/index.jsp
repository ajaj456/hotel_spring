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
		<a href="../room/list.do" id="more">☞더보기</a>
		<h2>▷뜨거운방</h2>
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
		<a href="../notice/list.do" id="more">☞더보기</a>
		<h2>▷공지</h2>
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성일</th>
				<th>작성자</th>
			</tr>
			<c:forEach var="notice" items="${noticeList}">
				<c:choose>
					<c:when test="${notice.firstYn == '2'}">
						<tr class="Active_hoover">
							<td id="nno" class="first_yn">☆</td>
							<td id="ntitle" class="first_yn"><a class="ntitle"
								href="../notice/view.do?no=${notice.no}">${notice.title}</a></td>
							<td id="nwdate" class="first_yn">${notice.wdate}</td>
							<td id="nwriter" class="first_yn">관리자</td>
						<tr>
					</c:when>
					<c:otherwise>
						<tr class="Active_hoover">
							<td id="nno">${notice.no }</td>
							<td id="ntitle"><a class="ntitle"
								href="../notice/view.do?no=${notice.no}">${notice.title}</a></td>
							<td id="nwdate">${notice.wdate}</td>
							<td id="nwriter">관리자</td>
						<tr>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</table>
	</div>

	<c:choose>
		<c:when test="${login != null}">
			<div id="mybooked">
				<a href="../booked/mylist.do?id=${login.id}&page=1" id="more">☞더보기</a>
				<h2>▷나의 예약</h2>
				<table>
					<tr>
						<th>아이디</th>
						<th>호실</th>
						<th>숙박시작일</th>
						<th>숙박기간</th>
						<th>결제 금액</th>
						<th>후기</th>
					</tr>
					<!-- 반복의 시작 -->
					<c:forEach var="booked" items="${bookedList }">
						<tr>
							<td id="booka">${booked.id }</td>
							<td id="bookb">${booked.roomNo }호</td>
							<td id="bookc">${booked.startDate }</td>
							<td id="bookd">${booked.stay }일</td>
							<td id="booke">${booked.totalPrice }원</td>
							<td id="bookf"><c:if test="${booked.inoutck == '1' }">
					미입실
					</c:if> <c:if test="${booked.inoutck == '2' }">
									<a
										href="../board/write.do?startDate=${ booked.startDate }
							&roomNo=${booked.roomNo  }&bno=${booked.bno  }">
										<button>후기 작성</button>
									</a>
								</c:if> <c:if test="${booked.inoutck == '3' }">
						작성완료
					</c:if></td>
						</tr>
					</c:forEach>
					<!-- 반복의 끝 -->
				</table>
			</div>
		</c:when>
	</c:choose>
</body>
</html>