<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet" />

</head>
<body>
	${qna }
	<h2>질문답변리스트</h2>
	<br>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>아이디</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="qna" items="${list}">
			<tr>
		<td><a href="view.do?no=${qna.no }"><font color="white">${qna.no }</font></a></td>
		<td><a href="view.do?no=${qna.no }"><font color="white">${qna.title }</font></a></td>
		<td>${qna.id}</td>
		<td>${qna.wdate}</td>
		<td>${qna.hit}</td>
		<tr>
		</c:forEach>
		<tr>
			<td><a href="write.do"><button>글쓰기</button></a></td>
		</tr>
	</table>
	<div id="pageMove">
		<!-- 	페이지 처리 = 반복문 처리-->
		<a href="list.do?page=1"><i class="fa fa-step-backward"></i></a> <a
			href="list.do?page=${jspData.startPage >1?jspData.startPage-jspData.pagesPerGroup:1 }"><i
			class="fa fa-chevron-left"></i><i class="fa fa-chevron-left"></i></a> <a
			href="list.do?page=${jspData.page >1?jspData.page-1:1 }"><i
			class="fa fa-chevron-left"></i></a>

		<c:forEach var="i" begin="${jspData.startPage }"
			end="${jspData.endPage }">
			<c:choose>
				<c:when test="${jspData.page eq i }">
					<span id="cpage">${i }</span>
				</c:when>
				<c:otherwise>
					<a href="list.do?page=${i }">${i }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<a
			href="list.do?page=${jspData.totalPage > jspData.endPage ? jspData.page + 1 : jspData.totalPage }"><i
			class="fa fa-chevron-right"></i></a> <a
			href="list.do?page=${jspData.totalPage > jspData.endPage ? jspData.endPage + 1 : jspData.totalPage }"><i
			class="fa fa-chevron-right"></i><i class="fa fa-chevron-right"></i></a> <a
			href="list.do?page=${jspData.totalPage }"><i
			class="fa fa-step-forward"></i></a>
	</div>
	<br>
	<br>
</body>
</html>