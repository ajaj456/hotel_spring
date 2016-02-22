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
<link href="../css/deleteMember.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		// 계정 삭제시 아이디와 패스워드 비워 있을 때 삭제 안된다는 팝업 호출
		$("#loginForm").submit(function() {
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
		});
	});
</script>
</head>
<body>
	<br />
	<br />
	<img src="../images/deleteMember.png" width="370px" height="100px"
		id="loginimg">
	<br />
	<br />
	<br />
	<br />
	<div id="divlogin">
		<h4>
			<b>회원정보입력</b>
		</h4>
	</div>
	<div id="logindiv">
		<form action="delete.do" method="post" id="loginForm">
			<hr>
			<ul>
				<li><label for="id">id</label> <input type="text" name="id"
					id="id" maxlength="15" class="input" /></li>
				<li><label for="pw">pw</label> <input type="password" id="pw"
					name="pw" class="input" /></li>
			</ul>
			<hr>
			<br />
			<button id="del">탈퇴</button>
		</form>
	</div>

</body>
</html>