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
	<div id="idpw">
		<h1>회원님의 가입정보가 기억나지 않으세요?</h1>
		<br /> 죄송합니다.<br />고객님은 추적 60인분 홈페이지에 가입된 회원이 아닙니다.<br /> 회원가입 버튼을
		눌러 가입해주시기 바랍니다.<br /> <br />
		<h5>회원관련 문의연락처 : 7979-8282</h5>
		<br />
	</div>
	<br />
	<hr>
	<br />
	<a href="../member/join.do">
		<button type="button" id="btn1">회원가입</button>
	</a>
	<a href="../member/login.do">
		<button type="button" id="btn2">로그인</button>
	</a>
</body>
</html>