<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>답변 하기</title>
</head>
<body>
	<form action="reply.do" method="post">
		<input type="hidden" name="id" value="${login.id}"> <input
			type="hidden" name="no" value="${qna.no}"> <input
			type="hidden" name="refNo" value="${qna.refNo}"> <input
			type="hidden" name="ordNo" value="${qna.ordNo}"> <input
			type="hidden" name="levNo" value="${qna.levNo}"> <input
			type="hidden" name="parentNo" value="${qna.no}"> 글제목 : <input
			name="title" value="[답변] ${qna.title}" size="40"><br> 내용
		:
		<textarea name="content" rows="20" cols="60">
		
=======[원문내용]=======
${qna.content}

=======[내용]=======

</textarea>
		<br>
		<button>답변</button>
		<button type="button" onclick="history.back()">취소</button>
	</form>
</body>
</html>