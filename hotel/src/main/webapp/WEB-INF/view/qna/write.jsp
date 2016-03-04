<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/board/board_write.css" rel="stylesheet"
	type="text/css" />
</head>
<body id="boardBody">

<h1>질문달기</h1>

	
	<br>
	<form action="write.do" method="post" enctype="multipart/form-data" id="writeForm">
	<fieldset id="boardWriteField">
	<ul id="boardUl">
		<li id="boardLi">
		<label for="title">제목 </label><input type="text" name="title" size="40" id="title"> <br>
		
	</li>
	<li id="boardLi">
		<label for="content">내용 </label><textarea rows="7" cols="60" name="content" id="content"></textarea><br> 
		</li>
		<li id="boardLi">
		<label for="id">작성자 </label><input type="text" name="id" value="${login.id }"> <br>
		</li>
		</ul>
		<div id="Btn">
		<button>작성</button>
		<button type="button" onclick="history.back()">취소</button>
		</div>
		</fieldset>
	</form>
	
	
</body>
</html>