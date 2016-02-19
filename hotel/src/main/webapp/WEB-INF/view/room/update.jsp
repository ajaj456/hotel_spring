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
	<form action="update.do" method="post">
		<input type="hidden" name="no" value="${board.no }"><br>
		<label for="title">글제목 </label><input type="text" name="title" id="title" value="${board.title}"> <br>
		<label for="content">글내용 </label><textarea rows="7" cols="60" name="content" id="content">${board.content}</textarea><br> 
		<label for="writer">작성자 </label><input type="text" name="writer" id="writer" value="${board.writer}"> <br>
		<button>수정</button><button type="button" onclick="history.back()">취소</button>
	</form>
</body>
</html>