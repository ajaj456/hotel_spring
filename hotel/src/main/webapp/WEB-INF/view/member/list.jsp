<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet" />
<link href="../css/member/list.css" rel="stylesheet"
	type="text/css" />
</head>
<body>
<div id="all">
	<h2>회원 리스트</h2>
	<table>
		<tr id="topTable">
			<th>아이디</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>가입일</th>
			<th>등급</th>
		</tr>
		<!-- 	반복의 시작 -->
		<c:forEach var="member" items="${list }">
			<tr>
				<td>${member.id }</td>
				<td>${member.name }</td>
				<td>${member.tel }</td>
				<td>${member.wdate }</td>
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
		<!-- 	반복의 끝 -->
	</table>
	<br>
	<br>
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
	</div>
</body>
</html>