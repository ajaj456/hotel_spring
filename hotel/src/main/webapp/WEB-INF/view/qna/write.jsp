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
<script type="text/javascript">
$(document).ready(function() {
	$($("#form")).submit(function() {
		if ($("#title").val() == "") {
			alert("제목을 입력해주세요.");
			$("#title").focus();
			return false;
		}
		if ($("#content").val() == "") {
			alert("내용을 입력해주세요.");
			$("#content").focus();
			return false;
		}
	});
});
		</script>
</head>
<body>
<div id="all">
<div id="MainContent_title">질문달기</div>
<div id="Content_form">
	
	<br>
	<form action="write.do" method="post" enctype="multipart/form-data">
		<label for="title">제목 </label><input type="text" name="title" size="40" id="title"> <br>
		<label for="content">내용 </label><textarea rows="7" cols="60" name="content" id="content"></textarea><br> 
		<label for="id">작성자 </label><input type="text" name="id" value="${login.id }"> <br>
		<button>작성</button>
		<button type="button" onclick="history.back()">취소</button>
	</form>
	</div>
	</div>
</body>
</html>