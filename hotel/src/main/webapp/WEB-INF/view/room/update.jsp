<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
		$(update_btn).click(function() {
			var answer = confirm("진정 수정하시겠습니까?");
			if (answer) {
				var form = $(this).parents('form');
				form.submit();
				alert("수정되었습니다.");
			} else {
				return false;
			}
		});
	});
</script>
</head>
<body>
	<h2>객실 수정</h2>
	<form action="update.do" method="post" enctype="multipart/form-data">
		<label for="roomNo">객실 번호 </label><input type="text" name="roomNo"
			id="roomNo" class="input" size="4" value="${room.roomNo }"
			readonly="readonly">호 <br> <label for="rName">객실
			이름</label><input type="text" name="rName" id="rName" class="input"
			value="${room.rName }"> <br> <label for="roomInfo">객실
			정보 </label>
		<textarea rows="7" cols="60" name="roomInfo" id="roomInfo"
			class="input">${room.roomInfo }"</textarea>
		<br> <label for="floor">층수</label><input type="text" name="floor"
			id="floor" size="3" class="input" value="${room.floor }">층 <br>
		<label for="rSize">수용인원</label><input type="text" name="rSize"
			id="rSize" size="3" class="input" value="${room.rSize }">명<br>
		<label for="price">객실 가격</label><input type="text" name="price"
			id="price" size="5" class="input" value="${room.price }">원 <br>
		<img alt="" src="../upload/room/${room.fileName}"><br /> <label
			for="OldfileName">기존 이미지</label><span id="OldfileName">${room.fileName}</span><br>
		<label for="NewFile">변경될 이미지 사진 </label><input type="file" name="file"
			id="NewFile"> <br>
		<button id="update_btn">작성</button>
		<button type="button" onclick="history.back()">취소</button>
	</form>

</body>
</html>
