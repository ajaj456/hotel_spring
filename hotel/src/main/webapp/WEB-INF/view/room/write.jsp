<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>객실 올리기</h2>
	<br>
	<form action="write.do" method="post" enctype="multipart/form-data">
		<label for="title">방 번호 </label><input type="text" name="roomNo" id="title"> <br>
		<label for="name">방 이름</label><input type="text" name="rName" id="name"> <br>		 
		<label for="content">방 정보 </label><textarea rows="7" cols="60" name="roomInfo" id="content"></textarea><br> 
		<label for="floor">층수</label><input type="text" name="floor" id="floor"> <br>
		<label for="rSize">방 이름</label><input type="text" name="rSize" id="rSize"> <br>
		<label for="price">방 가격</label><input type="text" name="price" id="price"> <br>
		<label for="fileName">작성자 </label><input type="file" name="fileName" id="fileName"> <br>
		<button>작성</button>
		<button type="button" onclick="history.back()">취소</button>
	</form>
</body>
</html>