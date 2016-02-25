<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원 리스트</h2>
	<table>
		<tr>
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
							value="${member.id }"> <select id="grade" name="grade"
							class="input">
							<option
								<c:if test="${member.grade == 'bronze'}">selected="selected"</c:if>>bronze</option>
							<option
								<c:if test="${member.grade == 'silver'}">selected="selected"</c:if>>silver</option>
							<option
								<c:if test="${member.grade == 'gold'}">selected="selected"</c:if>>gold</option>
							<option
								<c:if test="${member.grade == 'platinum'}">selected="selected"</c:if>>platinum</option>
							<option
								<c:if test="${member.grade == 'master'}">selected="selected"</c:if>>master</option>

						</select>
						<button>등급변경</button>
					</form>
				</td>
			</tr>
		</c:forEach>
		<!-- 	반복의 끝 -->
	</table>
</body>
</html>