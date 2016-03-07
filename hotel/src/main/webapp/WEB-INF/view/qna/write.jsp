<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/qna/notice_write.css" rel="stylesheet"
	type="text/css" />
	<script type="text/javascript">
	$(document).ready(function() {
		$("#formwrite").submit(function() {
			if ($("#title").val() == "") {
				alert("제목을 입력하셔야 됩니다.");
				$("#title").focus();
				return false;
			}
			;
			if ($("#content").val() == "") {
				alert("내용을 입력하셔야 됩니다.");
				$("#content").focus();
				return false;
			}
			;
			</script>
</head>


<div id="notice_write_title">질문[Question]</div>

	<br>
	<br>
	<form action="write.do" method="post" enctype="multipart/form-data" class="writeForm" id="writeForm">
	<div id="form_wrapper">
	<ul>
		<li>
		<label>제목 </label><input id="title" class="writeForm" name="title" size="" /> 
		</li>
	<li>
		<label for="content">내용 </label><textarea name="content" id="content" class="writeForm"></textarea></li> 
		
		<li id="boardLi">
		<label for="id">작성자 </label><input type="text" name="id" value="${login.id }"> <br>
		</li>
		</ul>
		<div id="btn">
		<button id="notice_write_btn">작성</button>
		<a href="list.do" onclick="history.back()">
		<button id="notice_write_btn" type="button">취소</button></a>
		</div>
		<br>
		</div>
	</form>
	
	

</html>