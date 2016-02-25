<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
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
	<img src="" width="370px" height="90px" id="loginimg">
	<br />
	<br />
	<br />
	<br />
	<div id="divlogin">
		<h4>
			<b>로그인 정보 입력</b> <a href="../member/findId.do"><button id="btn">id
					찾기</button></a> <a href="../member/findPw.do"><button id="btn">pw
					찾기</button></a>
		</h4>
	</div>
	<div id="logindiv">
		<form action="login.do" method="post" id="loginForm">
			<hr>
			<ul>
				<li><label for="id">id</label> <input type="text" name="id"
					id="id" maxlength="15" class="input" /></li>
				<li><label for="pw">pw</label> <input type="password" id="pw"
					name="pw" class="input" /></li>
			</ul>
			<hr>
			<br />
			<button id="lo">로그인</button>
		</form>
	</div>
</body>
</html>