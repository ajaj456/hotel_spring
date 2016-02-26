<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>글쓰기</h2>
	<br>
	<form action="write.do" method="post" enctype="multipart/form-data">
		<label for="title">제목 </label><input type="text" name="title"> <br>
		<label for="content">내용 </label><textarea rows="7" cols="60" name="content" id="content"></textarea><br> 
		<label for="id">작성자 </label><input type="text" name="id" value="${login.id }"> <br>
		<button>작성</button>
		<button type="button" onclick="history.back()">취소</button>
	</form>
</body>
</html>