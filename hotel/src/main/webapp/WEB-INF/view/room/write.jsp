<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/room/write.css" rel="stylesheet" type="text/css" />
<title>Insert title here</title>
<script type="text/javascript" src="../js/util/onlyNum.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$($(".roomWrite")).submit(function(){
		if($("#roomNo").val()==""){
			alert("객실 번호를 입력해주세요.");
			$("#roomNo").focus();
			return false;
		}
		if($("#rName").val()==""){
			alert("객실 이름을 입력해주세요.");
			$("#rName").focus();
			return false;
		}
		if($("#roomInfo").val()==""){
			alert("객실 정보를 입력해주세요.");
			$("#roomInfo").focus();
			return false;
		}
		if($("#floor").val()==""){
			alert("객실 정보를 입력해주세요.");
			$("#floor").focus();
			return false;
		}
		if($("#rSize").val()==""){
			alert("객실 정보를 입력해주세요.");
			$("#rSize").focus();
			return false;
		}
		if($("#price").val()==""){
			alert("객실 정보를 입력해주세요.");
			$("#price").focus();
			return false;
		}
		if($("#file").val()==""){
			alert("이미지를 등록해 주세요.");
			$("#file").focus();
			return false;
		}
	});
});
</script>
</head>
<body>
	<div id="all">
	<div id="MainContent_title">객실 올리기</div>
	<div id="Content_form">
	<form action="write.do" method="post" enctype="multipart/form-data" class="roomWrite">
	<ul>
		<li><label for="roomNo">객실 번호 </label><input type="text" name="roomNo" id="roomNo" class="onlynum" placeholder="only Number" >&nbsp;호</li>
		<li><label for="rName">객실 이름</label><input type="text" name="rName" id="rName" class="input" >&nbsp;방</li>		 
		<li><label for="roomInfo">객실 정보 </label><textarea rows="6" cols="40" name="roomInfo" id="roomInfo" class="input"></textarea></li> 
		<li><label for="floor">층수</label>
			<select name="floor" id="content_floor"> 
				<option value="1">1층
				<option value="2">2층
				<option value="3">3층
			</select></li>
		<li><label for="rSize">수용 인원</label><input type="text" name="rSize" id="rSize" class="onlynum" placeholder="only Number" >&nbsp;명</li>
		<li><label for="price">객실 가격</label><input type="text" name="price" id="price"  class="onlynum"placeholder="only Number" >&nbsp;원 </li>
		<li><label for="file">이미지 사진 </label><input type="file" name="file" id="file" class="input"></li>
	</ul>
	<br>
	<div id="btn">
		<button>작성</button>
		<button type="button" onclick="history.back()">취소</button>
		</div>
	</form>
	</div>
	</div>
</body>
</html>