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
	<h2>보기</h2>
	<br>

	<table>
		<tr>
			<th><b>번호</b></th>
			<td>${qna.no }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${qna.title}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${qna.id}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${qna.content}</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${qna.wdate}</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${qna.hit }</td>
		</tr>
	</table>

	<table>
		<tr>
			<td colspan="4">
			<c:if test="${qna.id eq login.id || login.grade eq 'master'}"><a href="update.do?no=${qna.no }"><button>글수정</button></a></c:if>
				<a href="list.do"><button>게시판 리스트</button></a>
			<c:if test="${qna.id eq login.id || login.grade eq 'master'}"><a href="delete.do?no=${qna.no}"><button>글삭제</button></a></c:if>
			<c:if test="${login.grade eq 'master'}">
			<td> <a href="reply.do?no=${qna.no}"><button>답변달기</button></a>
			</td>
			</c:if>
			
		</tr>
	</table>

</body>
</html>