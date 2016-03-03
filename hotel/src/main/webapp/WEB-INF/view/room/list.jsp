<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/room/list.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div id="section">
		<div id="section_title">
		객실 리스트
		</div>
		<div id="room_list_btn">
			<a onclick="location='list.do?floor=1'"><button>1층</button></a> <a
				onclick="location='list.do?floor=2'"><button>2층</button></a> <a
				onclick="location='list.do?floor=3'"><button>3층</button></a>
			
			<div>
			<c:if test="${login.grade eq 'master'}">
				<a href="write.do"><button>객실 추가</button></a>
			</c:if>
			</div>
		</div>
		
		
		<c:forEach var="room" items="${list}">
			<div id="content">
				<div id="content_info">
					${room.roomNo }호<br> <br>
<%-- 					<a href="view.do?no=${room.roomNo }">${room.rName}</a><br> --%>
<%-- 					${room.roomInfo}<br>  --%>
<%-- 					${room.rSize}명<br>  --%>
<%-- 					${room.price}원<br> --%>
<%-- 					${room.floor }층 --%>
				</div>
				
				<div class="content_img">
						<c:if test="${!empty room.fileName }">
							<a href="view.do?no=${room.roomNo }">
							 <img src="../images/room/${room.fileName}" /></a>
						</c:if>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>