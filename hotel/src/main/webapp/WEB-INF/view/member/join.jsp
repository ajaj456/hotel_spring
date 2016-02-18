<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="../css/join.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery-1.12.0.min.js"></script>
<script type="text/javascript"></script>
<div id="joindiv">
	<br /> <br /> <img src="" width="400px" height="100px"><br />
	<br /> <br /> <br />
	<form action="join.do" method="post" id="loginform">
		<h4>
			<b>기본 정보 입력</b>
		</h4>
		<hr>
		<fieldset>
			<ul>
				<li><label for="id">id</label> <input type="text" name="id"
					id="id" maxlength="15" class="input" /></li>
				<li><label for="pw">pw</label> <input type="password" id="pw"
					name="pw" class="input" /></li>
				<li><label for="name">이름</label> <input type="text" id="name"
					name="name" size="10" maxlength="6" class="input" /></li>
				<li><label>생년월일</label> <input type="date" id="birth"
					name="birth" class="input" /></li>
				<li><label>email</label> <input type="email" id="email"
					name="email" class="input" /></li>
				<li><label>연락처</label> <select id="tel1" name="tel1">
						<option>010</option>
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