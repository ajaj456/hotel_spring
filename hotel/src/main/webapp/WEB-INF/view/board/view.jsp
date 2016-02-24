<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>리뷰게시판 보기</h2>
	<br>
	<table>
		<tr>
			<th>번호</th>
			<td>${review.no }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${review.title}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><pre>${review.content}</pre></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${review.hit}</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${review.wdate}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${review.id }</td>
		</tr>
		<tr>
			<th>평가</th>
			<td>${review.grade }</td>
		</tr>
		<tr>
			<td><img alt="${review.fileName}"
				src="../upload/review/${review.fileName}"></td>
		</tr>

		<c:forEach var="relist" items="${relist}">
			<tr>
				<td>${relist.reno }</td>
			<tr>
		</c:forEach>
		
		<tr>
			<td colspan="2"><a href="update.do?no=${review.no }"><button>글수정</button></a>
				<a href="delete.do?no=${review.no }"><button>객실 지우기</button></a> <a
				href="list.do"><button>리뷰게시판 리스트로</button></a></td>
		</tr>
	</table>

</body>
</html>