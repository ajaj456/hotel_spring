<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/room/update.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/util/onlyNum.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#update_btn").click(function() {
			var answer = confirm("정말 수정하시겠습니까?");
			if ($("#roomNo").val() == "") {
				alert("객실 번호를 입력하셔야 됩니다.");
				$("#roomNo").focus();
				return false;
			}
			;
			if ($("#rName").val() == "") {
				alert("객실 이름을 입력하셔야 됩니다.");
				$("#rName").focus();
				return false;
			}
			;
			if ($("#roomInfo").val() == "") {
				alert("객실 정보를 입력하셔야 됩니다.");
				$("#roomInfo").focus();
				return false;
			}
			;
			if ($("#rSize").val() == "") {
				alert("수용 인원을 입력하셔야 됩니다.");
				$("#rSize").focus();
				return false;
			}
			;
			if ($("#price").val() == "") {
				alert("객실 가격을 입력하셔야 됩니다.");
				$("#price").focus();
				return false;
			}
			;
			if (answer) {
				var form = $(this).parents('form');
				form.submit();
				alert("수정되었습니다.");
			} else {
				return false;
			}
			;
		});
	});
</script>
</head>

<body>
	<div id="all">
		<div id="MainContent_title">객실 수정</div>
		<form action="update.do" method="post" enctype="multipart/form-data"
			id="updateform">
			<div id="Content_form">
				<ul>
					<li><label for="roomNo">객실 번호 </label><input type="text"
						name="roomNo" id="roomNo" class="onlynum"
						placeholder="only Number" value="${room.roomNo}">&nbsp;호</li>
					<li><label for="rName">객실 이름</label><input type="text"
						name="rName" id="rName" class="input" value="${room.rName}">&nbsp;방</li>
					<li><label for="roomInfo">객실 정보 </label> <textarea rows="6"
							cols="40" name="roomInfo" id="roomInfo" class="input">${room.roomInfo}</textarea></li>
					<li><label for="floor">층수</label> <select name="floor"
						id="content_floor">
							<option value="1" ${room.floor == 1?"selected='selected'":""}>1층</option>
							<option value="2" ${room.floor == 2?"selected='selected'":""}>2층</option>
							<option value="3" ${room.floor == 3?"selected='selected'":""}>3층</option>
					</select></li>
					<li><label for="hot">핫방유무</label> <select name="hot"
						id="content_hot">
							<option value="1" ${room.hot == 1?"selected='selected'":""}>일반</option>
							<option value="2" ${room.hot == 2?"selected='selected'":""}>핫방</option>
					</select></li>
					<li><label for="rSize">수용 인원</label><input type="text"
						name="rSize" id="rSize" class="onlynum" placeholder="only Number"
						value="${room.rSize}">&nbsp;명</li>
					<li><label for="price">객실 가격</label><input type="text"
						name="price" id="price" class="onlynum" placeholder="only Number"
						value="${room.price}">&nbsp;원</li>
					<li><label for="OldfileName">기존 이미지</label><span
						id="OldfileName">${room.fileName}</span></li>
					<li><img alt="" src="../images/room/${room.fileName}"></li>
					<li><label for="NewFile">변경될 이미지 사진 </label> <input
						type="file" name="file" id="NewFile"></li>
				</ul>
				<br>
				<div id="btn">
					<button id="update_btn">작성</button>
					<button type="button" onclick="history.back()">취소</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
