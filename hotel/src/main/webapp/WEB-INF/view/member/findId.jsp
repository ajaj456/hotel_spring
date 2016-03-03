<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/member/findIdPw.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	$(document).ready(function() {
		$("#findIdForm").submit(function() {
			if ($("#name").val() == "") {
				alert("이름을 입력하셔야 됩니다.");
				$("#name").focus();
				return false;
			}
			;
			if ($("#email").val() == "") {
				alert("이메일을 입력하셔야 됩니다.");
				$("#email").focus();
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
	<h2>ID 찾기</h2>
	<h4>아래의 정보를 입력하시면 회원님의 아이디를 확인하실 수 있습니다.</h4>
	<br />
	<br />
	<div id="logindiv">
		<div>
			<h3>
				<b>아이디 찾기</b>
			</h3>
		</div>
		<form action="findId.do" method="post" id="findIdForm">
			<hr>
			<ul>
				<li><label for="name">이름</label> <input type="text" id="name"
					name="name" class="input" maxlength="15" /></li>
				<li><label for="email">이메일</label> <input type="email"
					id="email" name="email" class="input" /></li>
			</ul>
			<hr>
			<br />
			<button class="findIdPw" id="btn">아이디 찾기</button>
		</form>
	</div>
</body>
</html>