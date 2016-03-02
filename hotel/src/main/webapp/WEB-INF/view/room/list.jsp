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
	<h2>객실 리스트</h2>
	<br>
	<div id="notice_list_pbtn">
		<a onclick="location='list.do?floor=1'"><button>1층</button></a> <a
			onclick="location='list.do?floor=2'"><button>2층</button></a> <a
			onclick="location='list.do?floor=3'"><button>3층</button></a>
	</div>
	<table>
		<tr>
			<th>객실 번호</th>
			<th>객실 이름</th>
			<th>객실 정보</th>
			<th>수용 인원</th>
			<th>객실 가격</th>
			<th>객실 층수</th>
		</tr>
		<c:forEach var="room" items="${list}">
			<tr>
				<td>${room.roomNo }호</td>
				<td><a href="view.do?no=${room.roomNo }">${room.rName}</a></td>
				<td><pre>${room.roomInfo}</pre></td>
				<td>${room.rSize}명</td>
				<td>${room.price}원</td>
				<td>${room.floor }층</td>
			<tr>
		</c:forEach>
		<c:if test="${login.grade eq 'master'}">
			<tr>
				<td><a href="write.do"><button>객실 추가</button></a></td>
			</tr>
		</c:if>
	</table>
	<br>
	<br>
</body>
</html>