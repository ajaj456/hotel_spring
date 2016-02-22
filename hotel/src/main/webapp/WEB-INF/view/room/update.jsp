<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>게시판 글수정</h2>
	<br>
	<form action="update.do" method="post" enctype="multipart/form-data">
		<label for="roomNo">방 번호 </label><input type="text" name="roomNo" id="roomNo" value="${room.roomNo}" readonly="readonly"> <br>
		<label for="rName">방 이름</label><input type="text" name="rName" id="rName" value="${room.rName}"> <br>		 
		<label for="content">방 정보 </label><textarea rows="7" cols="60" name="roomInfo" id="content">${room.rName}</textarea><br> 
		<label for="floor">층수</label><input type="text" name="floor" id="floor"value="${room.rName}"> <br>
		<label for="rSize">방 사이즈</label><input type="text" name="rSize" id="rSize"value="${room.rName}"> <br>
		<label for="price">방 가격</label><input type="text" name="price" id="price"value="${room.rName}"> <br>
		
		<label for="fileName">이미지 사진 </label><input type="file" name="file" id="fileName"value="${room.rName}"> <br>
		<button>작성</button>
		<button type="button" onclick="history.back()">취소</button>
	</form>
</body>
</html>