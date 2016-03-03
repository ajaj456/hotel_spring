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
<link href="../css/member/resultFail.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<br />
	<br />
	<h2>ID/PW 찾기</h2>
	<h4>아래의 정보를 입력하시면 회원님의 아이디와 비밀번호를 확인하실 수 있습니다.</h4>
	<br />
	<br />
	<div id="logindiv">
		<hr>
		<br />
		<h1>회원님의 가입정보가 기억나지 않으세요?</h1>
		<br /> 죄송합니다.<br />고객님은 추적 60인분 홈페이지에 가입된 회원이 아닙니다.<br /> 회원가입 버튼을
		눌러 가입해주시기 바랍니다.<br /> <br />
		<h5>회원관련 문의연락처 : 7979-8282</h5>
		<br />
		<hr>
		<br /> <a href="../member/join.do">
			<button type="button" id="btn">회원가입</button>
		</a> <a href="../member/login.do">
			<button type="button" id="btn">로그인</button>
		</a>
	</div>
</body>
</html>