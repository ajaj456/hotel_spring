<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>게시판 글보기</h2>
	<br>
	<table>
		<tr><th>글번호</th><td>${board.no }</td></tr>
		<tr><th>글제목</th><td>${board.title }</td></tr>
		<tr><th>글내용</th><td><pre>${board.content }</pre></td></tr>
		<tr><th>글쓴이</th><td>${board.writer }</td></tr>
		<tr><th>작성일</th><td>${board.wdate }</td></tr>
		<tr><th>조회수</th><td>${board.hit }</td></tr>
		<tr><td colspan="2">
		<a href="update.do?no=${board.no }"><button>글수정</button></a>
		<a href="delete.do?no=${board.no }"><button>글삭제</button></a>
		<a href="list.do"><button>글리스트</button></a>
		</td></tr>
	</table>
</body>
</html>