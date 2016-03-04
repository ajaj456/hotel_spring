<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="../css/notice/notice_write.css">
<title>Insert title here</title>
</head>
<body>
	<div id="notice_write_title">공지사항 글쓰기</div>
	<br>
	<br>
	<form action="write.do" method="post" enctype="multipart/form-data"
		class="writeForm">
		<div id="form_wrapper">
			<ul>
				<li><label>제목</label> <input id="title" class="writeForm"
					name="title" size="" /></li>
				<li><label for="content">내용</label> <textarea name="content"
						id="content" class="writeForm"></textarea></li>
				<li><label for="startDate">공지시작일</label> <input type="date"
					name="startDate" id="startDate" class="writeForm" /></li>
				<li><label for="endDate">공지종료일</label> <input type="date"
					name="endDate" id="endDate" class="writeForm" /></li>
				<li><label>우선사항</label> <select id="title" name="firstYn"
					class="writeForm">
						<option value="1">일반공지</option>
						<option value="2">우선공지</option>
				</select>
				<li><label for="file">첨부파일</label> <input type="file"
					name="file" id="file" class="writeForm"></li>
			</ul>
			<div id="btn">
			<button id="notice_write_btn">작성</button>
			<a href="list.do" onclick="history.back()"><button id="notice_write_btn">취소</button></a>
			</div>
			<br>
		</div>
	</form>
</body>
</html>