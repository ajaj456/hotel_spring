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
<title>아이디 확인 결과</title>
<link href="../css/resultIdPw.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	// 	$(document).ready(function(){

	// 	});
</script>
</head>
<body>
	<br />
	<br />
	<a href="../member/findIdPw.jsp"> <img src="../images/idpw.png"
		width="570px" height="90px" id="loginimg">
	</a>
	<br />
	<br />
	<br />
	<hr>
	<br />
	<%
		if (session.getAttribute("_Pw_") != null) {
	%>
	<div id="idpw">
		<h1>추적 60인분 회원님의 비밀번호를 알려드립니다!</h1>
		회원님의 비밀번호는 <b>${param.Pw}</b> 입니다.<br /> 위 정보로 로그인 바랍니다.<br /> <br />
		추적 60인분은 웹사이트를 통하여 회원님께<br /> 더욱 좋은 정보와 혜택을 드릴 것을 약속드립니다.<br /> 회원님의
		많은 이용 부탁드립니다.<br /> <br />
		<h5>회원관련 문의연락처 : 7979-8282</h5>
		<br />
	</div>
	<%
		} else {
	%>
	<div id="idpw">
		<h1>회원님의 가입정보가 기억나지 않으세요?</h1>
		<br /> 죄송합니다.<br />고객님은 추적 60인분 홈페이지에 가입된 회원이 아닙니다.<br /> 회원가입 버튼을
		눌러 가입해주시기 바랍니다.<br /> <br />
		<h5>회원관련 문의연락처 : 7979-8282</h5>
		<br />
	</div>
	<%
		}
	%>

	<br />
	<hr>
	<br />
	<button type="button" id="btn1">
		<a href="../member/join.jsp">회원가입</a>
	</button>
	<button type="button" id="btn2">
		<a href="../member/login.jsp">로그인</a>
	</button>
</body>
</html>