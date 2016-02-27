<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="notice_write_title">공지사항 글수정</div>
	<br><br>
	<form action="update.do" method="post" enctype="multipart/form-data" class="writeForm">
		<div id="form_wrapper">
			<ul>
				<li>
				<label>제목</label>
				<input id="no" name="no" value="${notice.no }" type="hidden">
				<input id="title" class="writeForm" name="title" size="" value="${notice.title }" /></li>
				<li>
				<label for="content">내용</label>
				<textarea name="content" id="content" class="writeForm" >${notice.content }</textarea></li>
				<li>
				<label for="startDate">공지시작일</label>
				<input type="date" name="startDate" id="startDate" class="writeForm" value="${notice.startDate }"/></li>
				<li>
				<label for="endDate">공지종료일</label>
				<input type="date" name="endDate" id="endDate" class="writeForm" value="${notice.endDate }"/></li>
				<li>
				<label>우선사항</label>
				<input id="title" class="writeForm" name="firstYn" value="${notice.firstYn }"/></li>
				<li>
				<label for="file">첨부파일</label>
				<input type="file" name="file" id="file" class="writeForm" ></li>
			</ul>
			<button id="notice_write_btn">작성</button>
			<br>
		</div>
	</form>
</body>
</html>	