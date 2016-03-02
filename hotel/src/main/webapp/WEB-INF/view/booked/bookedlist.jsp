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
			<th>숙박시작일</th>
			<th>숙박기간</th>
			<th>결제유무</th>
			<th>체크인유무</th>
		</tr>
<!-- 			반복의 시작 -->
		<c:forEach var="bookedmange" items="${list }">
			<tr>
				<td>${bookedmange.id }</td>
				<td>${bookedmange.startDate }</td>
				<td>${bookedmange.stay }</td>
				<td>${bookedmange.pacyck }</td>
				<td>${bookedmange.inoutck }</td>
				<td>
					<form action="grade.do">
						<input type="hidden" id="id" name="id" class="input"
							value="${member.id }"> <input type="hidden" id="page"
							name="page" class="input"
							<c:if test="${empty param.page }">
									value="1"
								</c:if>
							<c:if test="${!empty param.page }">
									value="${param.page }"
								</c:if>>
						<select id="grade" name="grade" class="input">
							<option
								<c:if test="${member.grade == 'bronze'}">selected="selected"</c:if>>bronze</option>
							<option
								<c:if test="${member.grade == 'silver'}">selected="selected"</c:if>>silver</option>
							<option
								<c:if test="${member.grade == 'gold'}">selected="selected"</c:if>>gold</option>
							<option
								<c:if test="${member.grade == 'platinum'}">selected="selected"</c:if>>platinum</option>
						</select>
						<button>등급변경</button>
					</form>
				</td>
			</tr>
		</c:forEach>
<!-- 			반복의 끝 -->
	</table>
	<br>
	<br>
	<div id="pageMove">
		<!-- 	페이지 처리 = 반복문 처리-->
		<a href="bookedlist.do?page=1"><i class="fa fa-step-backward"></i></a>
		<a
			href="bookedlist.do?page=${jspData.startPage >1?jspData.startPage-jspData.pagesPerGroup:1 }"><i
			class="fa fa-chevron-left"></i><i class="fa fa-chevron-left"></i></a> <a
			href="bookedlist.do?page=${jspData.page >1?jspData.page-1:1 }"><i
			class="fa fa-chevron-left"></i></a>

		<c:forEach var="i" begin="${jspData.startPage }"
			end="${jspData.endPage }">
			<c:choose>
				<c:when test="${jspData.page eq i }">
					<span id="cpage">${i }</span>
				</c:when>
				<c:otherwise>
					<a href="bookedlist.do?page=${i }">${i }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<a
			href="bookedlist.do?page=${jspData.totalPage > jspData.endPage ? jspData.page + 1 : jspData.totalPage }"><i
			class="fa fa-chevron-right"></i></a> <a
			href="bookedlist.do?page=${jspData.totalPage > jspData.endPage ? jspData.endPage + 1 : jspData.totalPage }"><i
			class="fa fa-chevron-right"></i><i class="fa fa-chevron-right"></i></a> <a
			href="bookedlist.do?page=${jspData.totalPage }"><i
			class="fa fa-step-forward"></i></a>
	</div>
</body>
</html>