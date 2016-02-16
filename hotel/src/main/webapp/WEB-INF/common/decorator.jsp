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
<link href="/decorator.css" rel="stylesheet" type="text/css" />
<decorator:head />
</head>
<body>
	<header>
		<div id="login">
			<a href="../member/login.jsp" id="text1">LOGIN</a> | <a
				href="../member/join.jsp" id="text1">JOIN US </a>
		</div>

	</header>
	<section id="body">
		<!-- section 안에 메뉴별 각각 폼 호출 -->
		<section id="menu">
			<br /> <br /> <br /> <a href="" id="menutext">메뉴 </a> <br /> <br />
			<a href="" id="menutext">메뉴1 </a> <br /> <br /> <a href=""
				id="menutext">메뉴2 </a> <br /> <br /> <a href="" id="menutext">메뉴3
			</a> <br /> <br /> <a href="" id="menutext">메뉴4 </a> <br /> <br /> <br />
			<br />
		</section>
		<section>
			<decorator:body />
		</section>
	</section>
	<footer>
		<!-- footer 바닥글 구현 -->
		<br /> <label id="label">회사소개 | 개인정보취급방침 | 이메일무단수집거부 | 오시는길 </label>
		<br /> <br /> 상호명 (주)웅이 | 대표이사 롱스톤 | 서울특별시 송파구 가락2동 행운빌딩2층 | 대표번호 :
		7979-8282 | 패스 02-555-5000 <br />대표 이메일 : Ritght@common.com COPYRIGHT
		(C) 2016 BY TRACE 60DISH.ALL RIGHTS RESERVED.<br />
	</footer>
</body>
</html>