<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	$(document).ready(function() {
		$("#booklist").hide();
		$("#bookingbtn").click(function() {
			$("#booklist").hide();
		});
		$("#booklistbtn").click(function() {
			$("#booking").hide();
		});
	});
</script>
<style type="text/css">

</style>
<title>Insert title here</title>
</head>
<body>
	<div>
		<div id="bookingbtn">예약 하기</div>
		<div id="booklistbtn">예약 리스트</div>
	</div>
	<div id="booking">
		<h2>예약 하기</h2>
	</div>
	<div id="booklist">
		<h2>예약 리스트</h2>
		<table>
			<tr>
				<th>예약 번호</th>
				<th>객실 번호</th>
				<th>예약자</th>
				<th>예약시작일</th>
				<th>숙박일수</th>
			</tr>
			<c:forEach var="booked" items="${list }">
				<tr>
					<td>${booked.bno }</td>
					<td>${booked.roomNo }</td>
					<td>${booked.id }</td>
					<td>${booked.startDate }</td>
					<td>${booked.stay }</td>
				<tr>
			</c:forEach>
		</table>
	</div>
	<br>
	<br>
</body>
</html>