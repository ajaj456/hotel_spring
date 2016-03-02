<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/findIdPw.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	$(document).ready(function() {
		$("#findPwForm").submit(function() {
			if ($("#id").val() == "") {
				alert("아이디를 입력하셔야 됩니다.");
				$("#id").focus();
				return false;
			}
			;
			if ($("#birth").val() == "") {
				alert("생년월일을 입력하셔야 됩니다.");
				$("#birth").focus();
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
	<img src="../images/idpw.png" width="570px" height="100px"
		id="loginimg">
	<br />
	<br />
	<br />
	<br />
	<div id="IdPw">
		<form action="findPw.do" method="post" id="findPwForm">
			<fieldset>
				<legend> 비밀번호 찾기</legend>
				<ul>
					<li><label for="id">id</label><input type="text" id="id"
						name="id" placeholder="id" class="input" /></li>
					<li><label for="birth">생년월일</label> <input type="date"
						id="birth" name="birth" class="input" /></li>
				</ul>
				<button class="findIdPw">비밀번호 찾기</button>
			</fieldset>
			<br />
		</form>
	</div>
</body>
</html>