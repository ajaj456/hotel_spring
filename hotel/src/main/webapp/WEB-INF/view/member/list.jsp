<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
	});
</script>
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
				<td><a href="view.do?id=${member.id }">${member.name }</a></td>
				<td>${member.tel }</td>
				<td>${member.wdate }</td>
				<td>${member.grade }</td>
			</tr>
		</c:forEach>
		<!-- 	반복의 끝 -->
	</table>
</body>
</html>