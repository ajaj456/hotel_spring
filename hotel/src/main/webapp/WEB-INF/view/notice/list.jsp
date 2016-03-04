<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
#firstYn {
	color: yellow;
}
</style>
<link rel="stylesheet" type="text/css"
	href="../css/notice/notice_list.css">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet" />
</head>
<body>
	<section>
		<div id="all">
			<div id="list_head">공지사항</div>
			<br><br>
			<div id="list_btn">
				<c:if test="${login.grade eq 'master' }">
					<div id="btn_wrapper"></div>
					<br>

					<div id="notice_list_pbtn">
						<a onclick="location='list.do?pri=cur'"><button>현재공지</button></a>
						<a onclick="location='list.do?pri=old'"><button>과거공지</button></a>
						<a onclick="location='list.do?pri=res'"><button>미래공지</button></a>
						<a onclick="location='list.do?pri=all'"><button>모든공지</button></a>
					</div>
				</c:if>
			</div>
			<div id="content">
				<table>
					<tr>
						<th>글번호</th>
						<th class="table_title" >글제목</th>
						<th>작성일</th>
						<th>작성자</th>
						<th>조회수</th>
					</tr>
					<c:forEach var="notice" items="${list}">
						<c:choose>
							<c:when test="${notice.firstYn == '2'}">
								<tr class="Active_hoover" id="fistYn">
									<td id="firstYn">☆</td>
									<td class="table_title"><c:if test="${empty param.page }">
											<a href="view.do?no=${notice.no}">${notice.title}</a>
										</c:if> <c:if test="${!empty param.page }">
											<a href="view.do?no=${notice.no}&page=${param.page }">${notice.title}</a>
										</c:if></td>
									<td id="firstYn">${notice.wdate}</td>
									<td id="firstYn">관리자</td>
									<td id="firstYn"><pre>${notice.hit}</pre></td>
								<tr>
							</c:when>
							<c:otherwise>
								<tr class="Active_hoover">
									<td>${notice.no}</td>
									<td class="table_title"><c:if test="${empty param.page }">
											<a href="view.do?no=${notice.no}">${notice.title}</a>
										</c:if> <c:if test="${!empty param.page }">
											<a href="view.do?no=${notice.no}&page=${param.page }">${notice.title}</a>
										</c:if></td>
									<td>${notice.wdate}</td>
									<td>관리자</td>
									<td><pre>${notice.hit}</pre></td>
								<tr>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</table>
				<c:if test="${login.grade eq 'master' }">

					<td><a href="write.do"><button>글쓰기</button></a></td>

				</c:if>

			</div>
			<br>
			<div id="pageMove">
				<!-- 	페이지 처리 = 반복문 처리-->
				<a href="list.do?page=1"><i class="fa fa-step-backward"></i></a> <a
					href="list.do?page=${jspData.startPage >1?jspData.startPage-jspData.pagesPerGroup:1 }"><i
					class="fa fa-chevron-left"></i><i class="fa fa-chevron-left"></i></a> <a
					href="list.do?page=${jspData.page >1?jspData.page-1:1 }"><i
					class="fa fa-chevron-left"></i></a>

				<c:forEach var="i" begin="${jspData.startPage }"
					end="${jspData.endPage }">
					<c:choose>
						<c:when test="${jspData.page eq i }">
							<span id="cpage">${i }</span>
						</c:when>
						<c:otherwise>
							<a href="list.do?page=${i }">${i }</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<a
					href="list.do?page=${jspData.totalPage > jspData.endPage ? jspData.page + 1 : jspData.totalPage }"><i
					class="fa fa-chevron-right"></i></a> <a
					href="list.do?page=${jspData.totalPage > jspData.endPage ? jspData.endPage + 1 : jspData.totalPage }"><i
					class="fa fa-chevron-right"></i><i class="fa fa-chevron-right"></i></a>
				<a href="list.do?page=${jspData.totalPage }"><i
					class="fa fa-step-forward"></i></a>
			</div>
		</div>
	</section>
</body>
</html>