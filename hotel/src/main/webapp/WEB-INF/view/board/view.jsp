<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="../css/board/board_view.css">
<script type="text/javascript">
	$(document).ready(function() {
		$($("#replyForm")).submit(function() {
			if ($("#replyContent").val() == "") {
				alert("댓글 내용을 입력해주세요.");
				$("#replyContent").focus();
				return false;
			}
		});

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
	<div id="articleT">리뷰게시판</div>
	<div id="all">
		<div id="mainContent">
			<div id="articleTop">
				<div id="articleTitle">${review.title}</div>
				<div id="articleWdate">${review.wdate}</div>
				<div id="articleNo">${review.no}</div>
				<div id="articleContent">${review.content}</div>
				<div id="articleImage">
					<c:if test="${!empty review.fileName }">

						<img src="../upload/review/${review.fileName}" />
					</c:if>
				</div>
			</div>
			<div id="btn_wrapper">
				<c:if test="${login.id eq review.id }">
					<a href="delete.do?no=${review.no }&bno=${review.bno}"><button>리뷰
							지우기</button></a>
				</c:if>
				<a href="list.do"><button>리뷰게시판 리스트로</button></a>
			</div>
		</div>
		<div id="reply">
			<table>
				<tr>
					<td>내용</td>
					<td>작성일</td>
					<td>아이디</td>
				</tr>
				<c:forEach var="relist" items="${relist.list}">
					<tr>
						<td id="replycontent">${relist.content }</td>
						<td id="replywdate">${relist.wdate }</td>
						<td id="replyid">${relist.id }</td>
						<c:if test="${login.id eq relist.id}">
							<td class="replybtn" id="replybtn"><button>수정</button></td>
							<td class="replyUpCancel" id="replybtn"><button>수정취소</button></td>
							<td class="replyUp" id="replybtn"><form
									action="replyUpdate.do" method="post">
									<input type="hidden" value="${relist.reno }" name="reno">
									<input type="hidden" value="${review.no }" name="no"> <input
										name="content" value="${relist.content }" />
									<button>완료</button>
								</form></td>
							<td class="replyDelete"><a
								href="replyDelete.do?reno=${relist.reno }&no=${review.no}"><button>삭제</button></a></td>
						</c:if>
					<tr>
				</c:forEach>
			</table>
			<c:if test="${!empty login }">
				<form action="replyWrite.do" method="post" id="replyForm">
					<label>댓글쓰기</label><input name="content" size="50"
						id="replyContent"> <input type="hidden" name="no"
						value="${review.no}"> <input type="hidden" name="id"
						value="${login.id}">
					<button>확인</button>
				</form>
			</c:if>


			<div id="pageMove">
				<!-- 	페이지 처리 = 반복문 처리-->
				<a href="view.do?no=${review.no}&page=1"><i
					class="fa fa-step-backward"></i></a> <a
					href="view.do?no=${review.no}&page=${jspData.startPage >1?jspData.startPage-jspData.pagesPerGroup:1 }"><i
					class="fa fa-chevron-left"></i><i class="fa fa-chevron-left"></i></a> <a
					href="view.do?no=${review.no}&page=${jspData.page >1?jspData.page-1:1 }"><i
					class="fa fa-chevron-left"></i></a>

				<c:forEach var="i" begin="${jspData.startPage }"
					end="${jspData.endPage }">
					<c:choose>
						<c:when test="${jspData.page eq i }">
							<span id="cpage">${i }</span>
						</c:when>
						<c:otherwise>
							<a href="view.do?no=${review.no}&page=${i }">${i }</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<a
					href="view.do?no=${review.no}&page=${jspData.totalPage > jspData.endPage ? jspData.page + 1 : jspData.totalPage }"><i
					class="fa fa-chevron-right"></i></a> <a
					href="view.do?no=${review.no}&page=${jspData.totalPage > jspData.endPage ? jspData.endPage + 1 : jspData.totalPage }"><i
					class="fa fa-chevron-right"></i><i class="fa fa-chevron-right"></i></a>
				<a href="view.do?no=${review.no}&page=${jspData.totalPage }"><i
					class="fa fa-step-forward"></i></a>
			</div>

		</div>
	</div>
</body>
</html>