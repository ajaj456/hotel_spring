<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이 페이지</title>
<link href="../css/member/delete.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	$(document).ready(function() {
		// 계정 삭제시 아이디와 패스워드 비워 있을 때 삭제 안된다는 팝업 호출
		$("#btn").click(function() {
			if ($("#id").val() == "") {
				alert("아이디를 입력하셔야 됩니다.");
				$("#id").focus();
				return false;
			}
			;
			if ($("#pw").val() == "") {
				alert("패스워드를 입력하셔야 됩니다.");
				$("#pw").focus();
				return false;
			}
			;
			if ($("#oldid").val() != $("#id").val()) {
				alert("현재 아이디를 확인하셔야 됩니다.");
				$("#id").focus();
				return false;
			}
			;
			if ($("#oldpw").val() != $("#pw").val()) {
				alert("현재 패스워드를 확인하셔야 됩니다.");
				$("#pw").focus();
				return false;
			}
			;
			var answer = confirm("정말 탈퇴하시겠습니까?");
			if (answer) {
				var form = $(this).parents('form');
				form.submit();
				alert("회원 탈퇴 처리되었습니다.");
			} else {
				return false;
			}
		});
	});
</script>
</head>
<body>
	<br />
	<br />
	<h2>회원탈퇴처리</h2>
	<h4>회원님의 정보를 안전하게 삭제하겠습니다.</h4>
	<br />
	<br />
	<br />
	<div>
		<h3>
			<b>회원정보입력</b>
		</h3>
	</div>
	<div id="logindiv">
		<form action="delete.do" method="post" id="loginForm">
			<hr>
			<input type="hidden" name="oldid" id="oldid" value="${login.id }" />
			<input type="hidden" name="oldpw" id="oldpw" value="${login.pw }" />
			<ul>
				<li><label for="id">아이디</label> <input type="text" name="id"
					id="id" maxlength="15" class="input" /></li>
				<li><label for="pw">패스워드</label> <input type="password" id="pw"
					name="pw" class="input" /></li>
			</ul>
			<hr>
			<br />
			<button id="btn">탈퇴</button>
		</form>
	</div>

</body>
</html>