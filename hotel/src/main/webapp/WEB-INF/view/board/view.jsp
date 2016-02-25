<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
		$(".replyUp").hide();
		$(".replyUpCancel").hide();
		$(".replybtn").click(function() {
			$(".replyUp").toggle();
			$(".replyDelete").toggle();
			$(".replybtn").toggle();
			$(".replyUpCancel").toggle();
		});
		$(".replyUpCancel").click(function() {
			$(".replyUp").toggle();
			$(".replyDelete").toggle();
			$(".replybtn").toggle();
			$(".replyUpCancel").toggle();
		});
	});
</script>
<style type="text/css">
</style>
</head>
<body>

	<h2>리뷰게시판 보기</h2>
	<br>
	<table>
		<tr>
			<th>번호</th>
			<td>${review.no }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${review.title}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><pre>${review.content}</pre></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${review.hit}</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${review.wdate}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${review.id }</td>
		</tr>
		<tr>
			<th>평가</th>
			<td>${review.grade }점</td>
		</tr>
		<tr>
			<td><img alt="${review.fileName}"
				src="../upload/review/${review.fileName}"></td>

		</tr>
		<tr>
			<td colspan="2"><a href="update.do?no=${review.no }"><button>글수정</button></a>
				<a href="delete.do?no=${review.no }"><button>객실 지우기</button></a> <a
				href="list.do"><button>리뷰게시판 리스트로</button></a></td>
		</tr>
	</table>
	<br>
	<br>

	<form action="replyWrite.do" method="post">
		<textarea rows="4" cols="50" name="content"></textarea>
		<input type="hidden" name="no" value="${review.no}"> <input
			type="hidden" name="id" value="${login.id}">
		<button>확인</button>
	</form>
	<table>
		<c:forEach var="relist" items="${relist}">
			<tr>
				<td>${relist.reno }</td>
				<td>${relist.content }</td>
				<td>${relist.wdate }</td>
				<td>${relist.id }</td>
				<td class="replybtn"><button>수정</button></td>
				<td class="replyUpCancel"><button>수정취소</button></td>
				<td class="replyUp"><form action="replyUpdate.do" method="post">
						<input type="hidden" value="${relist.reno }" name="reno">
						<input type="hidden" value="${review.no }" name="no">
						<textarea rows="1" cols="50" name="content">${relist.content }</textarea>
						<button>완료</button>
					</form></td>


				<td class="replyDelete"><a
					href="replyDelete.do?reno=${relist.reno }&no=${review.no}"><button>삭제</button></a></td>
			<tr>
		</c:forEach>
		<%-- 		<a href="replyUpdate.do?reno=${relist.reno }&no=${review.no}"></a> --%>
	</table>
</body>
</html>