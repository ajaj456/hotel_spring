<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/qna/notice_write.css" rel="stylesheet"
	type="text/css" />
	<script type="text/javascript">
	$(document).ready(function() {
		$("#writeForm").submit(function() {
			if ($("#content").val() == "") {
				alert("내용을 입력하셔야 됩니다.");
				$("#content").focus();
				return false;
			}
			;
		
			alert("작성이 완료되었습니다.")
		});
	});
</script>
</head>
<div id="notice_write_title">답변 하기[Answer]</div>
<br>
<br>
	<form action="reply.do" method="post" enctype="multipart/form-data" class="writeForm" id="writeForm">
		<div id="form_wrapper">
		<ul>
		<li><input type="hidden" name="id" value="${login.id}"></li> <li><input
			type="hidden" name="no" value="${qna.no}"></li> <li><input
			type="hidden" name="refNo" value="${qna.refNo}"></li> <li><input
			type="hidden" name="ordNo" value="${qna.ordNo}"></li> <li><input
			type="hidden" name="levNo" value="${qna.levNo}"></li> <li><input
			type="hidden" name="parentNo" value="${qna.no}" ></li> <li><label>글제목</label> 
			
			<input id="title" class="writeForm" name="title" value="[답변] ${qna.title}" size="" readonly="readonly" /></li>
		
		<li><label>내용</label>
		
		<textarea cols="30" rows="50" name="content" id="content">
=======[원문내용]=======
${qna.content}

=======[내용]=======

</textarea>
</li>
</ul>
<br>
		<br>
		<div id="btn">
		<button id="notice_write_btn">답변</button>
		<button id="notice_write_btn" type="button" onclick="history.back()">취소</button>
	</div>
	</div>
	</form>

</html>