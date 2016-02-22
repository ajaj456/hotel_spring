<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>객실 보기</h2>
	<br>
	<table>
		<tr><th>방 번호</th><td>${room.roomNo }</td></tr>
		<tr><th>방 이름</th><td>${room.rName}</td></tr>
		<tr><th>방 정보</th><td><pre>${room.roomInfo}</pre></td></tr>
		<tr><th>방 크기</th><td>${room.rSize}</td></tr>
		<tr><th>가격</th><td>${room.price}</td></tr>
		<tr><th>층수</th><td>${room.floor }</td></tr>
		<tr><td><img alt="${room.fileName}" src="../upload/room/${room.fileName}"> </td></tr>
		<tr><td colspan="2">
		<a href="update.do?no=${room.roomNo }"><button>객실 올리기</button></a>
		<a href="delete.do?no=${room.roomNo }"><button>객실 지우기</button></a>
		<a href="list.do"><button>객실 리스트로</button></a>
		</td></tr>
	</table>
</body>
</html>