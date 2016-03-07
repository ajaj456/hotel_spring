<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/qna/notice_write.css" rel="stylesheet"
	type="text/css" />

</head>

	<div id="notice_write_title">수정[Edit]</div>
	<br>
	
	<form action="update.do" method="post" enctype="multipart/form-data" class="writeForm" id="writeForm">
		<div id="form_wrapper">
		<ul>
		<li><label for="no">번호 </label><input type="text" name="no" id="qnaNo" value="${qna.no}" readonly="readonly"></li> 
		<li><label for="title">제목</label><input type="text" name="title" id="title" value="${qna.title}"> </li>	 
		<li><label for="content">내용 </label><textarea rows="7" cols="60" name="content" id="content">${qna.content}</textarea></li> 
		<li><label for="wdate">작성일</label><input type="text" name="wdate" id="wdate" value="${qna.wdate}"> </li>
		<li><label for="id">작성자</label><input type="text" name="id" id="wdate" value="${qna.id}" readonly="readonly"></li> 
		<li><label for="hit">조회수</label><input type="text" name="hit" id="hit"value="${qna.hit}" readonly="readonly"> </li>
		</ul>
		<div id="btn">
		<button id="notice_write_btn">작성</button>
		<button id="notice_write_btn" type="button" onclick="history.back()">취소</button>
	</div>
	</div>
	
	</form>

</html>	