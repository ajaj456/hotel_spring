<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/findIdPw.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery-1.12.0.min.js"></script>
<script type="text/javascript"></script>
</head>
<body>
	<br />
	<br />
	<img src="" width="570px" height="100px" id="loginimg">
	<br />
	<br />
	<br />
	<br />
	<div id="IdPw">
		<form action="findId.do" method="post" id="findIdForm">
			<fieldset>
				<legend> 아이디 찾기</legend>
				<ul>
					<li><label for="name">이름</label> <input type="text" id="name"
						name="name" placeholder="이름" class="input" maxlength="15" /></li>
					<li><label for="email">email</label> <input type="email"
						id="email" name="email" placeholder="email" class="input" /></li>
				</ul>
				<button class="findIdPw">아이디 찾기</button>
			</fieldset>
			<br />
		</form>
	</div>
</body>
</html>