<%@page import="com.hotel.member.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>hotel <decorator:title />
</title>
<script type="text/javascript" src="../js/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
	});
</script>
<style type="text/css">
header {
	height: 50px;
	border: 1px solid #ccc;
	text-align: right;
	background: #e1e1e1;
}

footer {
	border: 1px solid #ccc;
	clear: both;
	text-align: center;
	font-size: 13px;
	height: auto;
	margin-bottom: 2px;
}

a {
	text-decoration: none !important;
}

section#menu {
	margin-right: 300px;
}

img {
	cursor: pointer;
}

#label {
	color: orange;
	font-size: 14px;
}

#body {
	border: 1px solid #ccc;
	height: 745px;
}

#login {
	margin-right: 50px;
	margin-top: 1px;
}

#text1 {
	font-size: 12px;
}

#text2 {
	font-size: 12px;
}

#menutext {
	color: black;
	font-size: 18px;
}
</style>
<decorator:head />
</head>
<body>
	<header>
		<div id="login">
			<%
				// session의 member에 정보가 있으면 회원정보 및 logout 호출
				if (session.getAttribute("login") != null) {
			%>
			<a href="../member/view.do?id=${login.id }" id="text1">
				${login.name } </a> 님[${login.grade }] 환영합니다. <a
				href="../member/logout.do" id="text2">LOGOUT </a>
			<%
				// session의 member에 정보가 없으면 login과 join us 호출
				} else {
			%>
			<a href="../member/login.do" id="text1">LOGIN</a> | <a
				href="../member/join.do" id="text1">JOIN US </a><br />
			<%
				}
			%>
		</div>
		<!-- section 안에 메뉴별 각각 폼 호출 -->
		<section id="menu">
			<a href="" id="menutext">메뉴   </a> <a href="" id="menutext">메뉴1   </a> <a
				href="" id="menutext">메뉴2   </a> <a href="" id="menutext">메뉴3   </a> <a
				href="" id="menutext">메뉴4   </a>
		</section>


	</header>
	<section id="body">
		<section>
			<decorator:body />
		</section>
	</section>
	<footer>
		<!-- footer 바닥글 구현 -->
		<br /> <label id="label">회사소개 | 개인정보취급방침 | 이메일무단수집거부 | 오시는길 </label>
		<br /> <br /> 상호명 (주)웅이 | 대표이사 롱스톤 | 서울특별시 송파구 가락2동 행운빌딩2층 | 대표번호 :
		7979-8282 | 패스 02-555-5000 <br />대표 이메일 : Ritght@common.com COPYRIGHT
		(C) 2016 BY TRACE 60DISH.ALL RIGHTS RESERVED.<br /><br />
	</footer>
</body>
</html>