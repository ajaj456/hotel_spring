<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<title></title>
<head>
<script type="text/javascript">
	$(document).ready(function() {
		// 중복체크 버튼 클릭시
		$("#btnCheckId").click(function() {
			var id = $("#id").val();
			if (id != "") {
				$("#checkIdResult").load("idCheck.do?id=" + id);
			} else {
				alert("아이디를 입력하셔야 합니다.");
			}
		});

		// 아이디 입력란에 키인하면 중복체크하라는 메세지 표시
		$("#id").keydown(function() {
			$("#checkIdResult").text("아이디 중복체크를 하셔야 합니다.")
		});

		// submit될 때 빈 데이터 있으면 팝업 표시
		$("#loginform").submit(function() {
			if ($("#checkIdResult").text() == "아이디 중복체크를 하셔야 합니다.") {
				alert("아이디 중복체크를 하셔야 합니다.")
				return false;
			}
			;
			if ($("#checkIdResult").text() == "중복된 아이디입니다.") {
				alert("아이디를 변경해주세요.")
				return false;
			}
			;
			if ($("#id").val() == "") {
				alert("아이디를 입력하셔야 됩니다.");
				$("#id").focus();
				return false;
			}
			;
			if ($("#pw").val() == "") {
				alert("패스워드를 입력하셔야 됩니다.");
				$("#pw").val("");
				$("#pw").focus();
				return false;
			}
			;
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
			// 전화번호 4자이상 아닐 때 메세지 호출
			if ($("#tel2").val().length < 4) {
				alert("전화번호는 4자 이상이 되어야 합니다.");
				$("#tel2").focus();
				return false;
			}
			;
			if ($("#tel3").val().length < 4) {
				alert("전화번호는 4자 이상이 되어야 합니다.");
				$("#tel3").focus();
				return false;
			}
			;
			alert("회원가입 되었습니다.");
		});

		// tel2가 4개가 되면 tel3으로 자동이동
		$("#tel2").keyup(function() {
			if ($(this).val().length >= 4)
				$("#tel3").focus();
		});

		// tel3가 4개가 되면 가입버튼으로 자동이동
		$("#tel3").keyup(function() {
			if ($(this).val().length >= 4)
				$("#join").focus();
		});

	});
</script>
</head>
<body>
	<div id="joindiv">
		<br /> <br />
		<h2>회원가입</h2>
		<h4>중앙호텔의 풍성하고 알찬 혜택을 누리세요!</h4>
		<br /> <br /> <br />
		<form action="join.do" method="post" id="loginform">
			<h4>
				<b>기본 정보 입력</b>
			</h4>
			<hr>
			<fieldset>
				<ul>
					<li><label for="id">id</label> <input type="text" name="id"
						id="id" maxlength="15" class="input" />
						<button type="button" id="btnCheckId">중복체크</button> <span
						id="checkIdResult">아이디 중복체크를 하셔야 합니다.</span></li>
					<li><label for="pw">pw</label> <input type="password" id="pw"
						name="pw" class="input" /><span></span></li>
					<li><label for="name">이름</label> <input type="text" id="name"
						name="name" size="10" maxlength="6" class="input" /><span></span></li>
					<li><label>생년월일</label> <input type="date" id="birth"
						name="birth" class="input" /></li>
					<li><label>email</label> <input type="email" id="email"
						name="email" class="input" /></li>
					<li><label>연락처</label> <select id="tel1" name="tel1">
							<option selected="selected">010</option>
							<option>016</option>
							<option>017</option>
							<option>018</option>
							<option>019</option>
					</select> - <input name="tel2" id="tel2" size="4" maxlength="4" /> - <input
						name="tel3" id="tel3" size="4" maxlength="4" /></li>
				</ul>
			</fieldset>
			<hr>
			<br />
			<button id="join">가입</button>
			<br />
		</form>
	</div>
</body>
</html>