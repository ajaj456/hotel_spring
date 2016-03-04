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
	$(document)
			.ready(
					function() {
						//$("#priceA").hide();
						$("#chkprice").click(
								function() {
									var roomNo = $("#roomNo").val();
									var stay = $("#stay").val();
									var people = $("#people").val();
									$("#priceA").load(
											"price.do?roomNo=" + roomNo
													+ "&stay=" + stay
													+ "&people=" + people);
								});

						$("#cancel").click(function() {
							if ($("#stayDate").val() == null) {
								alert("취소할 내용이 없습니다.");
								return false;
							}
							;
							var answer = confirm("예약을 취소하시겠습니까?");
							if (answer) {
								var form = $(this).parents('form');
								form.submit();
								alert("예약이 취소되었습니다.");
							} else {
								return false;
							}
							;
						});

						$("#chkbook").click(
								function() {
									var today = $('#today').val();
									var roomNo = $("#roomNo").val();
									var stay = $("#stay").val();
									var startDate = $("#startDate").val();
									$("#checkresult")
											.load(
													"bookCheck.do?roomNo="
															+ roomNo + "&stay="
															+ stay + "&today="
															+ today
															+ "&startDate="
															+ startDate);
								});
						// 날짜 입력란에 키인하면 중복체크하라는 메세지 표시
						$("#startDate").click(function() {
							$("#checkresult").text("[ 예약 중복체크를 하셔야 합니다. ]")
						});
						$("#bookbtn")
								.submit(
										function() {
											if ($("#checkresult").text() == "[ 오늘 이전의 날짜로는 예약이 불가능합니다. ]") {
												alert("오늘 이전의 날짜로는 예약이 불가능 합니다. 날짜를 변경해주세요.")
												return false;
											}
											;
											if ($("#checkresult").text() == "[ 이미 예약이 되어있습니다. 다른 날짜를 선택해주세요. ]") {
												alert("예약시간 중복입니다. 날짜를 변경해주세요.")
												return false;
											}
											;
											if ($("#checkresult").text() == "[ 예약 중복체크를 하셔야 합니다. ]") {
												alert("예약시간 중복체크하세요.")
												return false;
											}
											;
											if ($("#startDate").val() == "") {
												alert("예약일자를 선택하세요.");
												$("#startDate").focus();
												return false;
											}
											;
											if ($("#stay").val() == "") {
												alert("예약일수를 입력하세요.");
												$("#stay").focus();
												return false;
											}
											;
											if ($("#stay").val() == "1"
													|| $("#stay").val() == "2"
													|| $("#stay").val() == "3"
													|| $("#stay").val() == "4"
													|| $("#stay").val() == "5"
													|| $("#stay").val() == "6"
													|| $("#stay").val() == "7"
													|| $("#stay").val() == "8"
													|| $("#stay").val() == "9"
													|| $("#stay").val() == "10"
													|| $("#stay").val() == "11"
													|| $("#stay").val() == "12"
													|| $("#stay").val() == "13"
													|| $("#stay").val() == "14"
													|| $("#stay").val() == "15") {
											} else {
												alert("예약일수를 확인해주세요.(최대 15일 사이로 입력해주세요.)");
												$("#stay").focus();
												return false;
											}
											;
											if ($("#people").val() == "") {
												alert("인원수를 입력하세요.");
												$("#people").focus();
												return false;
											}
											;
											alert("예약이 완료되었습니다.");
										});
					});
</script>
<title>Insert title here</title>
<link href="../css/booked/list.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div id="allBook">
		<div id="insertBook">
			<h2>예약 하기</h2>
			<form action="write.do" method="post" id="bookbtn">
				<input type="hidden" maxlength="15" class="input" name="id"
					value="${login.id }" /> <label>예약일자</label> <input type="date"
					id="startDate" name="startDate" /><br> <label>예약일수</label> <input
					type="text" id="stay" name="stay" size="1" maxlength="3" />일간 ( 최대
				15일까지 예약가능합니다. )<br> <label>호실</label> <select name="roomNo"
					id="roomNo">
					<c:forEach var="room" items="${room }">
						<option value="${room.roomNo }">${room.roomNo }(${room.rSize }명,
							${room.price }원)</option>
					</c:forEach>
				</select>호<br> <label>인원수</label> <input type="text" id="people"
					name="people" size="1" maxlength="2" />명 ( 해당 호실 정원수 초과시 추가요금 발생
				[인당 만원] )<br> <label>결제금액</label> <span id="priceA"><input
					type="text" name="totalPrice" readonly="readonly" size="5"
					id="totalPrice">원</span>
				<button type="button" id="chkprice">가격조회</button>
				<br>
				<button type="button" id="chkbook">예약확인</button>
				<button>예약</button>
				<span id=checkresult>[ 예약 중복체크를 하셔야 합니다. ]</span>

			</form>
		</div>

		<div id="deleteBook">
			<h2>예약 취소</h2>
			<form action="delete.do">
				<input type="hidden" maxlength="15" class="input" name="id"
					value="${login.id }" /> <label>예약일자</label> <select
					name="stayDate" id="stayDate">
					<c:forEach var="bookinglist" items="${bookinglist }">
						<option value="${bookinglist.startDate }">${bookinglist.startDate }
							(${bookinglist.roomNo }호, ${bookinglist.stay }일간)</option>
					</c:forEach>
				</select>
				<button id="cancel">예약 취소</button>
			</form>
		</div>
	</div>

	<div id="booked_inform">
		<br />
		<h2>예약 현황</h2>
		<div>
			<a onclick="location='list.do?list=1&id=${login.id }'" id="btn1"><button
					type="button">전체 현황</button></a> <a
				onclick="location='list.do?list=2&id=${login.id}'" id="btn2"><button
					type="button">나의 현황</button></a> <a
				onclick="location='mylist.do?id=${login.id}&page=1'"><button
					type="button">나의 예약 확인</button></a>
		</div>
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
		<table class="tab">
			<tr>
				<td align=left width=100 class="tdye">
					<!-- 년 도--> <a
					href="list.do?id=${login.id}&year=<%out.print(year - 1);%>&month=<%out.print(month);%>">◀</a>
					<%
						out.print(year);
					%>년 <a
					href="list.do?id=${login.id}&year=<%out.print(year + 1);%>&month=<%out.print(month);%>">▶</a>
				</td>
				<td align=center width=200 class="tdmo">
					<!-- 월 --> <a
					href="list.do?id=${login.id}&year=<%out.print(year);%>&month=<%out.print(month - 1);%>">◀</a>
					<%
						out.print(month + 1);
					%>월 <a
					href="list.do?id=${login.id}&year=<%out.print(year);%>&month=<%out.print(month + 1);%>">▶</a>
				</td>
				<td align=right width=200 class="tdda">
					<%
						out.print("오늘날짜 : " + currentYear + "-" + (currentMonth + 1) + "-" + currentDate);
					%>
				</td>
			</tr>
		</table>
		<input type="hidden" id="today"
			value="<%out.print(currentYear + "-" + (currentMonth + 1) + "-" + currentDate);%>">
		<table border=1>
			<!-- 달력 부분 -->
			<tr>
				<td height="40" align="center" style="color: yellow">일요일</td>
				<td height="40" align="center">월요일</td>
				<td height="40" align="center">화요일</td>
				<td height="40" align="center">수요일</td>
				<td height="40" align="center">목요일</td>
				<td height="40" align="center">금요일</td>
				<td height="40" align="center" style="color: yellow">토요일</td>
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
							out.println("<div><td valign='top' align='right' width='150' height='55' style='color: yellow;'>"
									+ i + "<br></div>");
						} else if ((br % 7) == 6) { // 토요일 색깔 출력
							out.println("<div><td valign='top' align='right' width='150' height='55' style='color: yellow;'>"
									+ i + "<br></div>");
						} else {
							out.println("<div><td valign='top' align='right' width='150' height='55'>" + i + "<br></div>");
						}

						for (Booking booking : list) { // 달력내 내용표시
							if (year == booking.getYear() && month + 1 == booking.getMonth() && i == booking.getDay())
								out.print("<div align='left' style='display:block; text-overflow:ellipsis; overflow:hidden;'>"
										+ booking.getRoomNo() + "호 예약(" + booking.getPeople() + "명)");
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