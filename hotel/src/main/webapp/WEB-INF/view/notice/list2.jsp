<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section>
		<div>
			<div>공지사항</div>
			<div>
			<a href="write.jsp">글쓰기</a>
			</div><br>
			
				<div>
					<a onclick="location='list.jsp?pri=cur'">현재공지</a>
					<a onclick="location='list.jsp?pri=old'">지난공지</a>
					<a onclick="location='list.jsp?pri=res'">미래공지</a>
					<a onclick="location='list.jsp?pri=all'">모든공지</a>
				</div>
			<ul>
			<c:forEach var="notice" items="${list }">
				<li>
					<div>
						<div><a href="view.jsp?no=${notice.no}">${notice.title }</a>
						</div><br><br>
						<div id="list_content" class="textOver">${notice.content}</div><br>
						<div id="list_startDate">공지기간  :  ${notice.wdate} ~ ${notice.endDate }</div><br>
					</div>	
					
					<div class="list_img">
						<c:if test="${!empty notice.fileName }">
							<a href="view.jsp?no=${notice.no }"><img src="../upload/${notice.fileName }" /></a>
						</c:if>
					</div>
				</li>
			</c:forEach>
			</ul>
		</div>
<!-- 		<div id="pageMove"> -->
<!-- 			<a href="list.jsp?page=1"><span class="fa fa-step-backward"></span></a> -->
<%-- 			<a href="list.jsp?page=${jspData.startPage > 1 ? jspData.startPage-jspData.pagesPerGroup : 1 }"><span class="fa fa-chevron-left"></span><span class="fa fa-chevron-left"></span></a> --%>
<%-- 			<a href="list.jsp?page=${jspData.page > 1 ? jspData.page-1 : 1 }"><span class="fa fa-chevron-left"></span></a> --%>
		
<%-- 			<c:forEach var="i" begin="${jspData.startPage }" end="${jspData.endPage }"> --%>
<%-- 				<c:choose> --%>
<%-- 					<c:when test="${jspData.page eq i }"> --%>
<%-- 						<span id="cpage">${i }</span> --%>
<%-- 					</c:when> --%>
<%-- 					<c:otherwise> --%>
<%-- 						<a href="list.jsp?page=${i }">${i }</a> --%>
<%-- 					</c:otherwise> --%>
<%-- 				</c:choose> --%>
<%-- 			</c:forEach> --%>
		
<%-- 			<a href="list.jsp?page=${jspData.totalPage > jspData.endPage ? jspData.page+1 : jspData.totalPage }"><span class="fa fa-chevron-right"></span></a> --%>
<%-- 			<a href="list.jsp?page=${jspData.totalPage > jspData.endPage ? jspData.endPage+1 : jspData.totalPage }"><span class="fa fa-chevron-right"></span><span class="fa fa-chevron-right"></span></a> --%>
<%-- 			<a href="list.jsp?page=${jspData.totalPage }"><span class="fa fa-step-forward"></span></a> --%>
<!-- 		</div> -->
		<br> <br>

	</section>
	
<!-- 	<h2>공지사항</h2> -->
<!-- 	<br> -->
<!-- 	<table> -->
<!-- 		<tr> -->
<!-- 			<th>글번호</th> -->
<!-- 			<th>글제목</th> -->
<!-- 			<th>조회수</th> -->
<!-- 			<th>작성일</th> -->
<!-- 			<th>아이디</th> -->
			
<!-- 		</tr> -->
<%-- 		<c:forEach var="board" items="${list}"> --%>
<!-- 			<tr> -->
<%-- 		<td><a href="view.do?no=${board.no}">${board.no}</a></td> --%>
<%-- 		<td>${board.title}</td> --%>
<%-- 		<td><pre>${board.hit}</pre></td> --%>
<%-- 		<td>${board.wdate}</td> --%>
<%-- 		<td>${board.id}</td> --%>
<!-- 		<tr> -->
<%-- 		</c:forEach> --%>
<!-- 		<tr> -->
<!-- 			<td><a href="write.do"><button>글쓰기</button></a></td> -->
<!-- 		</tr> -->
<!-- 	</table> -->
<!-- 	<br> -->
<!-- 	<br> -->
</body>
</html>