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
<link href="../css/qna/notice_list.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<section>
		<div id="all">
			<div id="list_head">질문답변 게시판</div>
			<br>
			<div id="content">
				<table>
					<tr id="table_title">
						<th>번호</th>
						<th>제목</th>
						<th>아이디</th>
						<th>날짜</th>
						<th>조회수</th>
					</tr>
					<c:forEach var="qna" items="${list}">


						<tr class="Active_hoover">
							<td>${qna.no }</td>
							<td><c:if test="${empty param.page }">
									<a href="view.do?no=${qna.no }"><font color="white">${qna.title }</font></a>
								</c:if> <c:if test="${!empty param.page }">
									<a href="view.do?no=${qna.no }&page=${param.page }"><font
										color="white">${qna.title }</font></a>
								</c:if></td>
							<td>${qna.id}</td>
							<td>${qna.wdate}</td>
							<td>${qna.hit}</td>
						<tr>
					</c:forEach>

				</table>
				<br> 
				<br> 
				<a href="write.do">
				<button id="notice_write_btn">글쓰기</button></a> <br>
				<br>
				<div id="pageMove">
					<!-- 	페이지 처리 = 반복문 처리-->
					<a href="list.do?page=1"><font color="white"> <i
							class="fa fa-step-backward"></i></font></a> <a
						href="list.do?page=${jspData.startPage >1?jspData.startPage-jspData.pagesPerGroup:1 }">
						<font color="white"><i class="fa fa-chevron-left"></i></font> <i
						class="fa fa-chevron-left"></i>
					</a> <a href="list.do?page=${jspData.page >1?jspData.page-1:1 }"> <font
						color="white"><i class="fa fa-chevron-left"></i></font></a>

					<c:forEach var="i" begin="${jspData.startPage }"
						end="${jspData.endPage }">
						<c:choose>
							<c:when test="${jspData.page eq i }">
								<span id="cpage"><font color="white">${i }</font></span>
							</c:when>
							<c:otherwise>
								<a href="list.do?page=${i }"><font color="white">${i }</font></a>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<a
						href="list.do?page=${jspData.totalPage > jspData.endPage ? jspData.page + 1 : jspData.totalPage }">
						<font color="white"><i class="fa fa-chevron-right"></i></font>
					</a> <a
						href="list.do?page=${jspData.totalPage > jspData.endPage ? jspData.endPage + 1 : jspData.totalPage }">
						<font color="white"><i class="fa fa-chevron-right"></i></font> <font
						color="white"> <i class="fa fa-chevron-right"></i></font>
					</a> <a href="list.do?page=${jspData.totalPage }"><font
						color="white"> <i class="fa fa-step-forward"></i></font></a>
				</div>
			</div>
		</div>
		<br> <br>
	</section>
</body>
</html>