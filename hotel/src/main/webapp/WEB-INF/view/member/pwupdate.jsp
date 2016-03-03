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
<link href="../css/member/pwupdate.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	$(document).ready(function() {
		// submit될 때 빈 데이터 있으면 팝업 표시
		$("#loginForm").submit(function() {
			if ($("#pw").val() == "") {
				alert("현재 패스워드를 입력하셔야 됩니다.");
				$("#pw").focus();
				return false;
			}
			;
			if ($("#pw1").val() == "") {
				alert("바꿀 패스워드를 입력하셔야 됩니다.");
				$("#pw1").focus();
				return false;
			}
			;
			if ($("#pw2").val() == "") {
				alert("패스워드를 확인하셔야 됩니다.");
				$("#pw2").focus();
				return false;
			}
			;
			if ($("#oldpw").val() != $("#pw").val()) {
				alert("현재 패스워드를 확인하셔야 됩니다.");
				$("#pw").focus();
				return false;
			}
			;
			if ($("#pw1").val() != $("#pw2").val()) {
				alert("바꿀 패스워드를 확인하셔야 됩니다.");
				$("#pw1").focus();
				return false;
			}
			;
			alert("비밀번호 변경을 완료하였습니다. 새로 로그인해주세요.")
		});
	});
</script>
</head>
<body>
	<br />
	<br />
	<h2>개인정보 수정</h2>
	<h4>회원님의 정보를 수정하실 수 있습니다.</h4>
	<br />
	<br />
	<br />
	<div>
		<h3>
			<b>비밀번호수정</b>
		</h3>
	</div>
	<div id="logindiv">
		<form action="pwupdate.do" method="post" id="loginForm">
			<hr>
			<input type="hidden" name="oldpw" id="oldpw" value="${login.pw }" />
			<ul>
				<li><label>현재 패스워드</label> <input type="password" name="pw"
					id="pw" maxlength="15" class="input" /></li>
				<li><label>바꿀 패스워드</label> <input type="password" name="pw1"
					id="pw1" maxlength="15" class="input" /></li>
				<li><label>패스워드 확인</label> <input type="password" name="pw2"
					id="pw2" maxlength="15" class="input" /></li>
			</ul>
			<hr>
			<br />
			<button id="btn">수정</button>
		</form>
	</div>

</body>
</html>