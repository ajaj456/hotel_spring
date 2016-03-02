<%@page import="com.hotel.member.model.Member"%>
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
<title>마이 페이지</title>
<script type="text/javascript">
	$(document).ready(function() {
		// submit될 때 빈 데이터 있으면 팝업 표시
		$("#loginForm").submit(function() {
			if ($("#name").val() == "") {
				alert("이름을 입력하셔야 됩니다.");
				$("#name").focus();
				return false;
			}
			;
			if ($("#birth").val() == "") {
				alert("생년월일을 입력하셔야 됩니다.");
				$("#birth").focus();
				return false;
			}
			;
			if ($("#email").val() == "") {
				alert("이메일을 입력하셔야 됩니다.");
				$("#email").focus();
				return false;
			}
			;
			if ($("#tel2").val() == "") {
				alert("전화번호를 입력하셔야 됩니다.");
				$("#tel2").focus();
				return false;
			}
			;
			if ($("#tel3").val() == "") {
				alert("전화번호를 입력하셔야 됩니다.");
				$("#tel3").focus();
				return false;
			}
			;
			alert("회원정보 수정! 다시 로그인 하세요!");
		});
	});
</script>
</head>
<body>
	<br />
	<br />
	<h2>개인정보 수정</h2>
	<h4>회원님의 정보를 수정하실 수 있습니다.</h4>
	<br />
	<br />
	<br />
	<div id="divlogin">
		<h4>
			<b>기본정보입력</b> <a href="../member/pwupdate.do">
				<button id="btn">pw 변경</button>
			</a> <a href="../member/delete.do">
				<button id="btn">회원탈퇴</button>
			</a>
		</h4>
	</div>
	<div id="logindiv">
		<form action="update.do?id" method="post" id="loginForm">
			<hr>
			<ul>
				<!-- session에서 넘겨받은 member 데이터를 각각의 input에 데이터 셋팅 -->
				<li><label for="id">id</label> <input type="text" name="id"
					id="id" maxlength="15" class="input" value="${member.id }"
					readonly="readonly" /></li>
				<li><label for="name">이름</label> <input type="text" id="name"
					name="name" size="10" maxlength="6" class="input"
					value="${member.name }" /></li>
				<li><label>생년월일</label> <input type="date" id="birth"
					name="birth" class="input" value="${member.birth }" /></li>
				<li><label>email</label> <input type="email" id="email"
					name="email" class="input" value="${member.email }" /></li>
				<li><label>연락처</label> <select id="tel1" name="tel1"
					class="input">
						<option <c:if test="${tel1 == '010'}">selected="selected"</c:if>>010</option>
						<option <c:if test="${tel1 == '016'}">selected="selected"</c:if>>016</option>
						<option <c:if test="${tel1 == '017'}">selected="selected"</c:if>>017</option>
						<option <c:if test="${tel1 == '018'}">selected="selected"</c:if>>018</option>
						<option <c:if test="${tel1 == '019'}">selected="selected"</c:if>>019</option>
				</select> - <input name="tel2" id="tel2" size="4" maxlength="4"
					value="${tel2 }" /> - <input name="tel3" id="tel3" size="4"
					maxlength="4" value="${tel3 }" /></li>
			</ul>
			<hr>
			<br />
			<button id="update">수정</button>
		</form>
	</div>

</body>
</html>