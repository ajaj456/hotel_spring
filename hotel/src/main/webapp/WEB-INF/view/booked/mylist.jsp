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
	<h2>예약 리스트</h2>
	<table>
		<tr>
			<th>아이디</th>
			<th>객실번호</th>
			<th>숙박시작일</th>
			<th>숙박기간</th>
			<th>후기</th>
		</tr>
		<!-- 반복의 시작 -->
		<c:forEach var="mylist" items="${mylist }">
			<tr>
				<td>${mylist.id }</td>
				<td>${mylist.roomNo }호</td>
				<td>${mylist.startDate }</td>
				<td>${mylist.stay }일</td>
				<td><c:if test="${mylist.inoutck == '2' }">
						<a
							href="../board/write.do?startDate=${ mylist.startDate }
							&roomNo=${mylist.roomNo  }&bno=${mylist.bno  }">
							<button>후기 작성</button>
						</a>
					</c:if> <c:if test="${mylist.inoutck == '3' }">
						후기가 작성되었습니다.
					</c:if></td>
			</tr>
		</c:forEach>
		<!-- 반복의 끝 -->
	</table>
	<br>
	<br>
	<div id="pageMove">
		<!-- 	페이지 처리 = 반복문 처리-->
		<a href="mylist.do?id=${login.id}&page=1"><i class="fa fa-step-backward"></i></a>
		<a
			href="mylist.do?id=${login.id}&page=${jspData.startPage >1?jspData.startPage-jspData.pagesPerGroup:1 }"><i
			class="fa fa-chevron-left"></i><i class="fa fa-chevron-left"></i></a> <a
			href="mylist.do?id=${login.id}&page=${jspData.page >1?jspData.page-1:1 }"><i
			class="fa fa-chevron-left"></i></a>

		<c:forEach var="i" begin="${jspData.startPage }"
			end="${jspData.endPage }">
			<c:choose>
				<c:when test="${jspData.page eq i }">
					<span id="cpage">${i }</span>
				</c:when>
				<c:otherwise>
					<a href="mylist.do?page=${i }">${i }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<a
			href="mylist.do?id=${login.id}&page=${jspData.totalPage > jspData.endPage ? jspData.page + 1 : jspData.totalPage }"><i
			class="fa fa-chevron-right"></i></a> <a
			href="mylist.do?id=${login.id}&page=${jspData.totalPage > jspData.endPage ? jspData.endPage + 1 : jspData.totalPage }"><i
			class="fa fa-chevron-right"></i><i class="fa fa-chevron-right"></i></a> <a
			href="mylist.do?id=${login.id}&page=${jspData.totalPage }"><i
			class="fa fa-step-forward"></i></a>
	</div>
</body>
</html>