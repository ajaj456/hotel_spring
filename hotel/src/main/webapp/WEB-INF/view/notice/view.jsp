<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="../css/notice/notice_view.css">
<title>Insert title here</title>
</head>
<body>
	<div id="articleTop">
		<div id="articleTitle">${notice.title }</div>
		<div id="articleWdate">
			<b>공지날짜</b> ${notice.startDate} ~ ${notice.endDate}
		</div>
		<div id="articleContent">${notice.content}</div>
		<div id="articleImage">
			<c:if test="${!empty notice.fileName }">

				<img src="../upload/notice/${notice.fileName}" />
			</c:if>
		</div>
	</div>
	<div id="btn_wrapper">
		<c:if test="${empty param.page }">
			<a class="view_btn" href="list.do"><button>글목록</button></a>
			<c:if test="${login.grade eq 'master' }">
				<a class="view_btn"
					href="update.do?no=${notice.no }"><button>글수정</button></a>
				<a class="view_btn" id="delete_btn"
					href="delete.do?no=${notice.no }"><button>글삭제</button></a>
			</c:if>
		</c:if>
		
		<c:if test="${!empty param.page}">
			<a class="view_btn" href="list.do?page=${param.page}"><button>글목록</button></a>
			<c:if test="${login.grade eq 'master' }">
				<a class="view_btn"
					href="update.do?no=${notice.no }&page=${param.page}"><button>글수정</button></a>
				<a class="view_btn" id="delete_btn"
					href="delete.do?no=${notice.no }&page=${param.page}"><button>글삭제</button></a>
			</c:if>
		</c:if>
		
	</div>
</body>
</html>