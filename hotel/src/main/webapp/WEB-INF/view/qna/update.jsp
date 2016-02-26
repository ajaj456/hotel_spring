<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>수정</h2>
	<br>
	<form action="update.do" method="post" enctype="multipart/form-data">
		<label for="no">번호 </label><input type="text" name="no" id="qnaNo" value="${qna.no}" readonly="readonly"> <br>
		<label for="title">제목</label><input type="text" name="title" id="title" value="${qna.title}"> <br>		 
		<label for="content">내용 </label><textarea rows="7" cols="60" name="content" id="content">${qna.content}</textarea><br> 
		<label for="wdate">작성일</label><input type="text" name="wdate" id="wdate"value="${qna.wdate}"> <br>
		<label for="id">작성자</label><input type="text" name="id" id="wdate" value="${qna.id}"> <br>
		<label for="hit">조회수</label><input type="text" name="hit" id="hit"value="${qna.hit}"> <br>
		<button>작성</button>
		<button type="button" onclick="history.back()">취소</button>
	</form>
	<form action=""></form>

</body>
</html>	