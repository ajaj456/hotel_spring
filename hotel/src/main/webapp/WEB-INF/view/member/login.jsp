<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/member/login.css" rel="stylesheet" type="text/css" />
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
	<h2>로그인</h2>
	<h4>중앙호텔에 오신 것을 환영합니다.</h4>
	<br />
	<br />
	<br />
	<div id="logindiv">
		<h3>
			<b>로그인 정보 입력</b> <a href="../member/findPw.do"><button id="btn">패스워드
					찾기</button></a> <a href="../member/findId.do"><button id="btn">아이디
					찾기</button></a>
		</h3>
	</div>
	<div id="logindiv">
		<form action="login.do" method="post" id="loginForm">
			<hr>
			<ul>
				<li><label for="id">아이디</label> <input type="text" name="id"
					id="id" maxlength="15" class="input" /></li>
				<li><label for="pw">패스워드</label> <input type="password" id="pw"
					name="pw" class="input" /></li>
			</ul>
			<hr>
			<br />
			<button id="btn">로그인</button>
		</form>
	</div>
</body>
</html>