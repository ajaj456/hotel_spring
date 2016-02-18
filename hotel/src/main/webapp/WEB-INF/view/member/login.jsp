<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-1.12.0.min.js"></script>
<script type="text/javascript"></script>
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
			<b>로그인 정보 입력</b> <a href="findIdPw.do"><button id="btn">id,pw
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
			<button id="login">로그인</button>
		</form>
	</div>
</body>
</html>
