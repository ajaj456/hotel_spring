<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/room/view.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	$(document).ready(function() {
		$(delete_btn).click(function() {
			var answer = confirm("정말 삭제하시겠습니까?");
			if (answer) {
				var form = $(this).parents('form');
				form.submit();
				alert("삭제되었습니다.");
			} else {
				return false;
			}
		});
	});
</script>
</head>
<body>
<div id="all">
	<div id="MainCotent_title">객실 보기</div>

	<div id="MainCotent">
		<div id="MainContent_info">
		<ul>
			<li id="content_roomNo"><span>객실번호</span><span>${room.roomNo}</span></li>
			<li id="content_rName"><span>객실이름</span><span>${room.rName}</span></li>
			<li id="content_roomInfo"><span>객실정보</span><span>${room.roomInfo}</span></li>
			<li id="content_floor"><span>층수</span><span>${room.floor}</span></li>
			<li id="content_people"><span>수용인원</span><span>${room.rSize}</span></li>
			<li id="content_price"><span>숙박비용</span><span>${room.price}</span></li>
		</ul>
		</div>

		<div id="MainContent_image">
			<c:if test="${!empty room.fileName }">
				<img alt="${room.fileName}" src="../images/room/${room.fileName}">
			</c:if>
		</div>
	</div>
		<div id="btn_wrapper">
			<c:if test="${login.grade eq 'master'}">
				<a href="update.do?no=${room.roomNo }"><button>객실 바꾸기</button></a>
				<a href="delete.do?no=${room.roomNo }"><button id="delete_btn">객실
						지우기</button></a>
				<a href="list.do?floor=${room.floor }"><button>다른 객실보기</button></a>
			</c:if>
		</div>
</div>
</body>
</html>