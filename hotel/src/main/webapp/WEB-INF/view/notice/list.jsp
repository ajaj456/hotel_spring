<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>공지사항</h2>
		<div>
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
		</div>
</body>
</html>