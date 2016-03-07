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
	$("#logout").click(function() {
		alert("로그아웃처리되었습니다.")
	});
</script>
<title>hotel <decorator:title />
</title>
<link href="../css/common/decorator.css" rel="stylesheet"
	type="text/css" />
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
				<br /> <a href="../hotel/info.do" id="menutext">호텔소개</a> <a
					href="../room/list.do" id="menutext">객실소개</a> <a
					href="../notice/list.do" id="menutext">공지사항</a> <a
					href="../board/list.do" id="menutext">후기게시판</a> <a
					href="../qna/list.do" id="menutext">질의응답</a>
				<c:choose>
					<c:when test="${login.grade eq 'master'}">
						<a href="../member/list.do" id="menutext">회원리스트</a>
						<a href="../booked/list.do?id=${login.id }" id="menutext">예약현황</a>
					</c:when>
					<c:when test="${login != null}">
						<a href="../booked/list.do?id=${login.id }" id="menutext">예약</a>
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