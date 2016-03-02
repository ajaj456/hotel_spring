<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
		$(delete_btn).click(function() {
			var answer = confirm("진정 삭제하시겠습니까?");
			if (answer) {
				var form = $(this).parents('form');
				form.submit();
				alert("삭제되었습니다.");
			} else {
				return false;
			}
		});
	});
</script>
</head>
<body>
	<h2>객실 보기</h2>
	<br>
	<table>
		<tr>
			<th>방 번호</th>
			<td>${room.roomNo }</td>
		</tr>
		<tr>
			<th>방 이름</th>
			<td>${room.rName}</td>
		</tr>
		<tr>
			<th>방 정보</th>
			<td><pre>${room.roomInfo}</pre></td>
		</tr>
		<tr>
			<th>수용 인원</th>
			<td>${room.rSize}명</td>
		</tr>
		<tr>
			<th>가격</th>
			<td>${room.price}</td>
		</tr>
		<tr>
			<th>층수</th>
			<td>${room.floor }</td>
		</tr>
		<tr>
			<td><img alt="${room.fileName}"
				src="../upload/room/${room.fileName}"></td>
		</tr>

		<c:if test="${login.grade eq 'master'}">
			<tr>
				<td colspan="2">
				<a href="update.do?no=${room.roomNo }"><button>객실 바꾸기</button></a> 
				<a href="delete.do?no=${room.roomNo }"><button id="delete_btn">객실	지우기</button></a> 
				<a href="list.do?floor=${room.floor }"><button>다른 객실보기</button></a></td>
			</tr>
		</c:if>
	</table>
</body>
</html>