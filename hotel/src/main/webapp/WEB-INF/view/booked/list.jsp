<%@page import="com.hotel.booked.model.Booking"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	$(document).ready(function() {
	});
</script>
<style type="text/css">
#alink {
	color: white;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div>
		<h2>예약 하기</h2>
		<form action="write.do">
			<input type="hidden" name="id" id="id" maxlength="15" class="input"
				value="${member.id }" />
			<ul>
				<li><label>예약일자</label> <input type="date" name="stayDate" /></li>
				<li><label>예약일수</label> <input type="text" name="stayDate"
					size="1" maxlength="3" /></li>
				<li><label>호실</label> <select name="roomNo">
						<c:forEach var="room" items="${room }">
							<option>${room.roomNo }</option>
						</c:forEach>
				</select></li>
				<li><label>인원수</label> <input type="text" name="people"
					size="1" maxlength="2" /></li>
			</ul>
			<button>예약</button>
		</form>
	</div>
	<div>
		<h2>예약 현황</h2>
		<%
			@SuppressWarnings("unchecked")
			List<Booking> list = (List<Booking>) request.getAttribute("list");

			Calendar cal = Calendar.getInstance(); //Calendar객체 cal생성
			int currentYear = cal.get(Calendar.YEAR); //현재 날짜 기억
			int currentMonth = cal.get(Calendar.MONTH);
			int currentDate = cal.get(Calendar.DATE);
			String Year = request.getParameter("year"); //나타내고자 하는 날짜
			String Month = request.getParameter("month");
			int year, month;
			if (Year == null && Month == null) { //처음 호출했을 때
				year = currentYear;
				month = currentMonth;
			} else { //나타내고자 하는 날짜를 숫자로 변환
				year = Integer.parseInt(Year);
				month = Integer.parseInt(Month);
				if (month < 0) {
					month = 11;
					year = year - 1;
				} //1월부터 12월까지 범위 지정.
				if (month > 11) {
					month = 0;
					year = year + 1;
				}
			}
		%>
		<table>
			<tr>
				<td align=left width=100>
					<!-- 년 도--> <a
					href="list.do?year=<%out.print(year - 1);%>&month=<%out.print(month);%>">◀</a>
					<%
						out.print(year);
					%>년 <a
					href="list.do?year=<%out.print(year + 1);%>&month=<%out.print(month);%>">▶</a>
				</td>
				<td align=center width=200>
					<!-- 월 --> <a
					href="list.do?year=<%out.print(year);%>&month=<%out.print(month - 1);%>">◀</a>
					<%
						out.print(month + 1);
					%>월 <a
					href="list.do?year=<%out.print(year);%>&month=<%out.print(month + 1);%>">▶</a>
				</td>
				<td align=right width=200>
					<%
						out.print("오늘날짜 : " + currentYear + "-" + (currentMonth + 1) + "-" + currentDate);
					%>
				</td>
			</tr>
		</table>
		<table border=1 style="width: 90%;">
			<!-- 달력 부분 -->
			<tr>
				<td width="55" height="40" align="center" style="color: green">일요일</td>
				<td width="55" height="40" align="center">월요일</td>
				<td width="55" height="40" align="center">화요일</td>
				<td width="55" height="40" align="center">수요일</td>
				<td width="55" height="40" align="center">목요일</td>
				<td width="55" height="40" align="center">금요일</td>
				<td width="55" height="40" align="center" style="color: yellow">토요일</td>
			</tr>
			<tr height=55>
				<%
					cal.set(year, month, 1); //현재 날짜를 현재 월의 1일로 설정
					int startDay = cal.get(Calendar.DAY_OF_WEEK); //현재날짜(1일)의 요일
					int end = cal.getActualMaximum(Calendar.DAY_OF_MONTH); //이 달의 끝나는 날
					int br = 0; //7일마다 줄 바꾸기
					for (int i = 0; i < (startDay - 1); i++) { //빈칸출력
						out.println("<td>&nbsp;</td>");
						br++;
						if ((br % 7) == 0) {
							out.println("<br>");
						}
					}
					for (int i = 1; i <= end; i++) { //날짜출력
						if ((br % 7) == 0) { // 일요일 색깔 출력
							out.println("<div><td valign='top' align='right' width='70' height='55' style='color: green;'>" + i
									+ "<br></div>");
						} else if ((br % 7) == 6) { // 토요일 색깔 출력
							out.println("<div><td valign='top' align='right' width='70' height='55' style='color: yellow;'>" + i
									+ "<br></div>");
						} else {
							out.println("<div><td valign='top' align='right' width='70' height='55'>" + i + "<br></div>");
						}

						for (Booking booking : list) { // 달력내 내용표시
							if (year == booking.getYear() && month + 1 == booking.getMonth() && i == booking.getDay())
								out.print("<div align='left' style='display:block; text-overflow:ellipsis; overflow:hidden;'>"
										+ booking.getRoomNo());
						}

						out.println("</td>");

						br++;
						if ((br % 7) == 0 && i != end) { // 7일이후 줄바꿈
							out.println("</tr><tr height=30>");
						}
					}
					while ((br++) % 7 != 0) //말일 이후 빈칸출력
						out.println("<td>&nbsp;</td>");
				%>
			</tr>
		</table>
	</div>
	<br>
	<br>
</body>
</html>