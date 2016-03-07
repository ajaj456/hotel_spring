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
<link href="../css/board/board_list.css" rel="stylesheet"
	type="text/css" />
</head>
<body>
	<div id="all">
		<div id="list_head">후기 게시판</div>
		<br>
		<div id="content">
			<table>
				<tr id="table_title">
					<th>글번호</th>
					<th>글제목</th>
					<th>조회수</th>
					<th>작성일</th>
					<th>아이디</th>

				</tr>
				<c:forEach var="board" items="${list}">
					<tr class="Active_hoover">
						<td id="tdno">${board.no}</td>
						<td id="tdtitle"><a href="view.do?no=${board.no}">${board.title}(${board.cnt })</a></td>
						<td id="tdhit"><pre>${board.hit}</pre></td>
						<td id="tdwdate">${board.wdate}</td>
						<td id="tdId">${board.id}</td>
					<tr>
				</c:forEach>
			</table>
			<c:choose>
				<c:when test="${login != null}">
					<div id="btn_wrapper">
						<a href="../booked/mylist.do?id=${login.id }&page=1"><button
								type="button">나의 예약 확인</button></a>
					</div>
				</c:when>
			</c:choose>
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
					class="fa fa-chevron-right"></i><i class="fa fa-chevron-right"></i></a>
				<a href="list.do?page=${jspData.totalPage }"><i
					class="fa fa-step-forward"></i></a>
			</div>
		</div>
	</div>
</body>
</html>