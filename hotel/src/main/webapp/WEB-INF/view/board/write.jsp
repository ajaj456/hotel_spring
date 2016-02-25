<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>리뷰 올리기</h2>
	<br>
<!-- 	insert into review(no, title, content, filename, -->
<!-- 		grade,	id, bno) -->
<%-- 		values(REVIEW_SEQ.nextval,#{title},#{content},#{filename},#{grade},#{id},#{bno}) --%>
	
	<form action="write.do" method="post" enctype="multipart/form-data">
		<label for="title">글제목 </label><input type="text" name="title" id="title"> <br>
		<label for="content">글내용</label><textarea rows="7" cols="60" name="content" id="content"></textarea><br> 
		<label for="id">아이디 </label><input type="text" name="id" id="id"> <br>
		<label for="bno">예약번호 </label><input type="text" name="bno" id="bno"> <br>
		<label for="grade">평가</label> <br>
		<select id="grade" name="grade" class="grade">
			<option
				<c:if test="${board.grade == '1'}">selected="selected"</c:if>>1점</option>
			<option
				<c:if test="${board == '2'}">selected="selected"</c:if>>2점</option>
			<option
				<c:if test="${board == '3'}">selected="selected"</c:if>>3점</option>
			<option
				<c:if test="${board == '4'}">selected="selected"</c:if>>4점</option>
			<option
				<c:if test="${board == '5'}">selected="selected"</c:if>>5점</option>
		</select><br>
		<label for="fileName">이미지 사진 </label><input type="file" name="file" id="fileName"> <br>
		<button>작성</button>
		<button type="button" onclick="history.back()">취소</button>
	</form>
</body>
</html>