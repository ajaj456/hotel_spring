<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/qna/notice_write.css" rel="stylesheet"
	type="text/css" />
</head>
<div id="notice_write_title">답변 하기[Answer]</div>
<br>
<br>
	<form action="reply.do" method="post" enctype="multipart/form-data" class="writeForm" id="writeForm">
		<div id="form_wrapper">
		<ul>
		<li><input type="hidden" name="id" value="${login.id}"> <input
			type="hidden" name="no" value="${qna.no}"> <input
			type="hidden" name="refNo" value="${qna.refNo}"> <input
			type="hidden" name="ordNo" value="${qna.ordNo}"> <input
			type="hidden" name="levNo" value="${qna.levNo}"> <input
			type="hidden" name="parentNo" value="${qna.no}"> 글제목 <p>
			<input name="title" value="[답변] ${qna.title}" size="50"><p/>
		
		<p>내용 </p> <textarea name="content" rows="20" cols="60">
	
=======[원문내용]=======
${qna.content}

=======[내용]=======

</textarea>
</ul>
		<br>
		<div id="btn">
		<button id="notice_write_btn">답변</button>
		<button id="notice_write_btn" type="button" onclick="history.back()">취소</button>
	</div>
	</div>
	</form>

</html>