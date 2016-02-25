<%@page import="com.hotel.member.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript" src="../js/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#logout").click(function() {
			alert("로그아웃처리되었습니다.")
		});
	});
</script>
<title>hotel <decorator:title />
</title>
<style type="text/css">
header {
	height: 86px;
	border: 1px solid #ccc;
	background: #3b312a;
	color: white;
}

footer {
	border: 1px solid #ccc;
	clear: both;
	text-align: center;
	font-size: 13px;
	height: auto;
	margin-bottom: 2px;
	background: #3b312a;
	color: #867a6f;
}

a {
	text-decoration: none !important;
}

#menu {
	height: 53px;
	background: #3b312a;
}

#menu2 {
	margin-right: 150px;
	background: #3b312a;
	text-align: right;
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
	height: 740px;
	background: #3b312a;
	color: #867a6f;
}

#body2 {
	width: 1019;
	heigth: auto;
	margin-top: 10px;
	margin-left: 100px;
	margin-right: 100px;
	margin-left: 100px;
	margin-top: 10px;
}

#head {
	margin-top: 1px;
	background: black;
	height: 24px;
	text-align: right;
	margin-top: 1px;
}

#login {
	float: right;
	margin-right: 100px;
	margin-top: 1px;
	text-align: right;
	margin-right: 100px;
	width: 719px;
}

#logo {
	float: left;
	margin-right: 50px;
	width: 300px;
	margin-right: 50px;
}

#text {
	font-size: 12px;
	color: white;
}

#logout {
	font-size: 12px;
	color: white;
}

#menutext {
	color: white;
	font-size: 18px;
	margin-right: 18px;
}

#padding {
	width: 250px;
}
</style>
<decorator:head />
</head>
<body>
	<header>
		<div id="head">
			<div id="logo">
				<a href="../main/index.do"><img src="../images/logo.png"
					height="120px" width="200px"></a>
			</div>
			<div id="login">
				<c:choose>
					<c:when test="${login != null}">
						<a href="../member/update.do?id=${login.id }" id="text">
							${login.name } </a> 님 [${login.grade }] 환영합니다. <a
							href="../member/logout.do" id="logout">LOGOUT </a>
					</c:when>
					<c:otherwise>
						<a href="../member/login.do" id="text">LOGIN</a> | <a
							href="../member/join.do" id="text">JOIN US </a>
						<br />
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<!-- section 안에 메뉴별 각각 폼 호출 -->
		<div id="menu">
			<div id="menu2">
				<br /> <a href="" id="menutext">호텔소개</a> <a href="../room/list.do"
					id="menutext">객실소개</a> <a href="" id="menutext">공지사항</a> <a
					href="../board/list.do" id="menutext">후기게시판</a> <a href=""
					id="menutext">Qna</a>
				<c:choose>
					<c:when test="${login.grade eq 'master'}">
						<a href="../member/update.do?id=${login.id }" id="menutext">마이페이지</a>
						<a href="../member/list.do" id="menutext">회원리스트</a>
					</c:when>
					<c:when test="${login != null}">
						<a href="../member/update.do?id=${login.id }" id="menutext">마이페이지</a>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</header>
	<section id="body">
		<section id="body2">
			<br />
			<decorator:body />
		</section>
	</section>
	<footer>
		<!-- footer 바닥글 구현 -->
		<br /> 상호명 (주)웅이 | 대표이사 혜연혜연열매 | 서울특별시 송파구 가락2동 행운빌딩2층 | 대표번호 :
		7979-8282 | 팩스 02-555-5000 <br />대표 이메일 : Ritght@common.com COPYRIGHT
		(C) 2016 BY TRACE 60DISH.ALL RIGHTS RESERVED.<br /> <br />
	</footer>
</body>
</html>