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
	<h2>회원 정보보기</h2>
	<table>
		<tr>
			<th>id</th>
			<td>${member.id }</td>
		</tr>
		<tr>
			<th>pw</th>
			<td>${member.pw }</td>
		</tr>
		<tr>
			<th>name</th>
			<td>${member.name }</td>
		</tr>
		<tr>
			<th>birth</th>
			<td>${member.birth }</td>
		</tr>
		<tr>
			<th>email</th>
			<td>${member.email }</td>
		</tr>
		<tr>
			<th>tel</th>
			<td>${member.tel }</td>
		</tr>
		<tr>
			<th>wdate</th>
			<td>${member.wdate }</td>
		</tr>
		<tr>
			<th>grade</th>
			<td>
				<form action="grade.do?id">
					<select id="grade" name="grade" class="input">
						<option
							<c:if test="${member.grade == 'bronze'}">selected="selected"</c:if>>bronze</option>
						<option
							<c:if test="${member == 'silver'}">selected="selected"</c:if>>silver</option>
						<option
							<c:if test="${member == 'gold'}">selected="selected"</c:if>>gold</option>
						<option
							<c:if test="${member == 'platinum'}">selected="selected"</c:if>>platinum</option>
					</select>
				</form>
			</td>
		</tr>
		<tr>
			<td colspan="2"><a href="update.do?id=${member.id }"><button>회원정보수정</button></a>
				<a href="list.do"><button>회원리스트</button></a></td>
		</tr>
	</table>
</body>
</html>