<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/board/board_write.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript">
	$(document).ready(function() {
		$($("#form")).submit(function() {
			if ($("#title").val() == "") {
				alert("제목을 입력해주세요.");
				$("#roomNo").focus();
				return false;
			}
			if ($("#content").val() == "") {
				alert("내용을 입력해주세요.");
				$("#rName").focus();
				return false;
			}
			if ($("#grade").val() == "") {
				alert("점수를 입력해주세요.");
				$("#floor").focus();
				return false;
				}
			if ($("#fileName").val() == "") {
				alert("이미지를 등록해 주세요.");
				$("#fileName").focus();
				return false;
			}
		});
	});
</script>
</head>
<body>
	<div id="all">
		<div id="MainContent_title">리뷰 올리기</div>
		<div id="Content_form">
			<form id="form" action="write.do" method="post" enctype="multipart/form-data">
				<ul>
					<li><label for="title">글제목 </label><input type="text"
						name="title" id="title"></li>
					<li><label for="content">글내용</label> <textarea rows="6"
							cols="40" name="content" id="content"></textarea></li>

					<li><label for="id">아이디 </label><input type="text" name="id"
						id="id" value="${login.id }" readonly="readonly"> <input
						type="hidden" name="bno" id="bno" value="${param.bno} "></li>

					<li><label for="grade">평가</label><select id="grade"
						name="grade" class="grade">
							<option value="1">1점</option>
							<option value="2">2점</option>
							<option value="3">3점</option>
							<option value="4">4점</option>
							<option value="5">5점</option>
					</select></li>
					<li><label for="fileName">이미지 사진 </label><input type="file"
						name="file" id="fileName"></li>
				</ul>

				<input type="hidden" name="startDate" value="${param.startDate }">
				<input type="hidden" name="roomNo" value="${param.roomNo }">

				<button>작성</button>
				<button type="button" onclick="history.back()">취소</button>
			</form>
		</div>
	</div>
</body>
</html>