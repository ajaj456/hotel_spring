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
<link href="../css/updatePw.css" rel="stylesheet" type="text/css" />
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
			if ($("#pw1").val() != $("#pw2").val()) {
				alert("바꿀 패스워드를 확인하셔야 됩니다.");
				$("#pw1").focus();
				return false;
			}
			;
			alert("패스워드가 변경되었습니다. 다시 로그인하세요!")
		});
	});
</script>
</head>
<body>
	<br />
	<br />
	<img src="../images/mypage.png" width="370px" height="100px"
		id="loginimg">
	<br />
	<br />
	<br />
	<br />
	<div id="divlogin">
		<h4>
			<b>비밀번호수정</b>
		</h4>
	</div>
	<div id="logindiv">
		<form action="pwupdate.do" method="post" id="loginForm">
			<hr>
			<ul>
				<li><input type="hidden" name="id" id="id" maxlength="15"
					class="input" value="${member.id }" /></li>
				<li><label for="pw">현재 pw</label> <input type="password"
					name="pw" id="pw" maxlength="15" class="input" /></li>
				<li><label for="pw">바꿀 pw</label> <input type="password"
					name="pw1" id="pw1" maxlength="15" class="input" /></li>
				<li><label for="pw">pw 확인</label> <input type="password"
					name="pw2" id="pw2" maxlength="15" class="input" /></li>
			</ul>
			<hr>
			<br />
			<button id="pwup">수정</button>
		</form>
	</div>

</body>
</html>