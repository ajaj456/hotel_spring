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
	<h2>리뷰 올리기</h2>
	<form action="write.do" method="post" enctype="multipart/form-data">
		<label for="title">글제목 </label><input type="text" name="title"
			id="title"> <br> <label for="content">글내용</label>
		<textarea rows="7" cols="60" name="content" id="content"></textarea>
		<br> <label for="id">아이디 </label><input type="text" name="id"
			id="id" value="${login.id }" readonly="readonly"> <input
			type="hidden" name="bno" id="bno" value="${param.bno} "> <br> <label
			for="grade">평가</label><select id="grade" name="grade" class="grade">
			<option value="1">1점</option>
			<option value="2">2점</option>
			<option value="3">3점</option>
			<option value="4">4점</option>
			<option value="5">5점</option>
			<%-- 				<c:if test="${board == '5'}">selected="selected"</c:if> --%>
		</select><br> <label for="fileName">이미지 사진 </label><input type="file"
			name="file" id="fileName"> <br> 
			
			<input type="hidden" name="startDate" value="${param.startDate }"> 
			<input type="hidden" name="roomNo" value="${param.roomNo }">

		<button>작성</button>
		<button type="button" onclick="history.back()">취소</button>
	</form>
</body>
</html>