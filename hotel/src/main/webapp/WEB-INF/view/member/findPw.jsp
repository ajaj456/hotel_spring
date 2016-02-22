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
		<form action="../member/findPwProcess.jsp" method="post"
			id="findPwForm">
			<fieldset>
				<legend> 비밀번호 찾기</legend>
				<ul>
					<li><label for="id">id</label><input type="text" id="id"
						name="id" placeholder="id" class="input" /></li>
					<li><label for="birth">생년월일</label> <input type="date"
						id="birth" name="birth" class="input" /></li>
				</ul>
				<input type="submit" value="비밀번호 찾기" class="findIdPw" />
			</fieldset>
			<br />
		</form>
	</div>
</body>
</html>