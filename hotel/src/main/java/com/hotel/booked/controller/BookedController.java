package com.hotel.booked.controller;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.hotel.booked.model.Booked;
import com.hotel.booked.model.BookedModel;
import com.hotel.booked.model.Booking;
import com.hotel.common.service.ServiceInterface;
import com.hotel.room.model.Room;

@Controller
public class BookedController {
	private ServiceInterface bookedListService, bookedWriteProcessService, bookedUpdateProcessService,
			bookedDeleteProcessService, bookedRoomListService, bookingWriteService, bookedConfirmService,
			bookingRoomListService, bookedMangeService, bookedCkUpdateProcessService, mylistService,
			bookedBnoConfirmService, roomInfoService;

	public void setRoomInfoService(ServiceInterface roomInfoService) {
		this.roomInfoService = roomInfoService;
	}

	public void setBookedBnoConfirmService(ServiceInterface bookedBnoConfirmService) {
		this.bookedBnoConfirmService = bookedBnoConfirmService;
	}

	public void setBookedRoomListService(ServiceInterface bookedRoomListService) {
		this.bookedRoomListService = bookedRoomListService;
	}

	public void setBookedListService(ServiceInterface bookedListService) {
		this.bookedListService = bookedListService;
	}

	public void setBookedWriteProcessService(ServiceInterface bookedWriteProcessService) {
		this.bookedWriteProcessService = bookedWriteProcessService;
	}

	public void setBookedUpdateProcessService(ServiceInterface bookedUpdateProcessService) {
		this.bookedUpdateProcessService = bookedUpdateProcessService;
	}

	public void setBookedDeleteProcessService(ServiceInterface bookedDeleteProcessService) {
		this.bookedDeleteProcessService = bookedDeleteProcessService;
	}

	public void setBookingWriteService(ServiceInterface bookingWriteService) {
		this.bookingWriteService = bookingWriteService;
	}

	public void setBookedConfirmService(ServiceInterface bookedConfirmService) {
		this.bookedConfirmService = bookedConfirmService;
	}

	public void setBookingRoomListService(ServiceInterface bookingRoomListService) {
		this.bookingRoomListService = bookingRoomListService;
	}

	public void setBookedMangeService(ServiceInterface bookedMangeService) {
		this.bookedMangeService = bookedMangeService;
	}

	public void setBookedCkUpdateProcessService(ServiceInterface bookedCkUpdateProcessService) {
		this.bookedCkUpdateProcessService = bookedCkUpdateProcessService;
	}

	public void setMylistService(ServiceInterface mylistService) {
		this.mylistService = mylistService;
	}

	// 글리스트
	@RequestMapping("/booked/list.do")
	public String list(@RequestParam(value = "list", required = true, defaultValue = "1") int list,
			@RequestParam(value = "id", required = false) String id, Model model, Booked booked) throws Exception {
		System.out.println("bookedController.list()");
		booked.setId(id);
		booked.setPage(list);
		model.addAttribute("list", bookedListService.service(booked));
		model.addAttribute("room", bookedRoomListService.service(null));
		model.addAttribute("bookinglist", bookingRoomListService.service(id));
		return "booked/list";
	}

	// 예약 처리 - POST
	@RequestMapping(value = "/booked/write.do", method = RequestMethod.POST)
	public String write(@RequestParam(value = "roomNo", required = false) int roomNo, HttpServletResponse response,
			Booked booked, Booking booking, Model model) throws Exception {
		System.out.println("bookedController.write-post()");
		DateFormat df = new SimpleDateFormat("yyyy-mm-dd");
		Date date = null;
		String dat;
		Calendar cal = Calendar.getInstance();
		booked.setRoomNo(roomNo);
		bookedWriteProcessService.service(booked);
		int bno = (Integer) bookedBnoConfirmService.service(booked);

		for (int i = 0; i < booked.getStay(); i++) {
			booking = new Booking();
			booking.setId(booked.getId());
			booking.setRoomNo(roomNo);
			booking.setPeople(booked.getPeople());
			booking.setBno(bno);
			date = df.parse(booked.getStartDate());
			cal.setTime(date);
			cal.add(Calendar.DATE, i);
			dat = df.format(cal.getTime());
			booking.setStayDate(dat);
			bookingWriteService.service(booking);
		}
		return "redirect:list.do?id=" + booking.getId();
	}

	// 예약 취소 처리
	@RequestMapping("/booked/delete.do")
	public String delete(@RequestParam(value = "stayDate", required = false) String stayDate,
			@RequestParam(value = "id", required = false) String id, Booked booked) throws Exception {
		System.out.println("bookedController.delete()");
		booked.setId(id);
		booked.setStartDate(stayDate);
		bookedDeleteProcessService.service(booked);
		return "redirect:list.do?id=" + booked.getId();
	}

	// 예약중복체크
	@RequestMapping("/booked/bookCheck.do")
	public void bookCheck(@RequestParam(value = "startDate", required = false) String startDate,
			@RequestParam(value = "today", required = false) String today,
			@RequestParam(value = "roomNo", required = false) int roomNo,
			@RequestParam(value = "stay", required = false) int stay, HttpServletResponse response, Booking booking,
			Booked booked) throws Exception {

		DateFormat df = new SimpleDateFormat("yyyy-mm-dd");
		Date date = null;
		Date todate = null;
		String dat;
		Calendar cal = Calendar.getInstance();
		String result = "<span style='color:yellow'>[ 예약가능합니다. ]</span>";

		for (int i = 0; i < stay; i++) {
			booking.setRoomNo(roomNo);
			date = df.parse(startDate);
			todate = df.parse(today);
			int compare = date.compareTo(todate);
			cal.setTime(date);
			cal.add(Calendar.DATE, i);
			dat = df.format(cal.getTime());
			booking.setStayDate(dat);
			if ((Booking) bookedConfirmService.service(booking) != null) {
				if (bookedConfirmService.service(booking) != null) {
					result = "<span style='color:white'>[ 이미 예약이 되어있습니다. 다른 날짜를 선택해주세요. ]</span>";
				} else if (compare < 0) {
					result = "<span style='color:white'>[ 오늘 이전의 날짜로는 예약이 불가능합니다. ]</span>";
				}
			} else if (compare < 0)
				result = "<span style='color:white'>[ 오늘 이전의 날짜로는 예약이 불가능합니다. ]</span>";
		}
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.print(result);
	}

	// 예약관리리스트
	@RequestMapping("/booked/bookedlist.do")
	public String list(@RequestParam(value = "page", required = false, defaultValue = "1") int page, Model model)
			throws Exception {
		BookedModel bookedModel = (BookedModel) bookedMangeService.service(page);
		model.addAttribute("list", bookedModel.getList());
		model.addAttribute("jspData", bookedModel.getJspData());
		return "booked/bookedlist";
	}

	// ck업데이트
	@RequestMapping(value = "/booked/inoutck.do")
	public String grade(@RequestParam(value = "page", required = true) int page, Booked booked) throws Exception {
		bookedCkUpdateProcessService.service(booked);
		return "redirect:bookedlist.do?page=" + page;
	}

	// 나의 예약 리스트
	@RequestMapping(value = "/booked/mylist.do")
	public String mylist(@RequestParam(value = "page", required = true) int page, Model model,
			@RequestParam(value = "id", required = false) String id, Booked booked) throws Exception {
		booked.setPage(page);
		booked.setId(id);
		BookedModel bookedModel = (BookedModel) mylistService.service(booked);
		model.addAttribute("mylist", bookedModel.getList());
		model.addAttribute("jspData", bookedModel.getJspData());
		return "booked/mylist";
	}

	// 가격조회
	@RequestMapping(value = "/booked/price.do")
	public void price(@RequestParam(value = "roomNo", required = true) int roomNo,
			@RequestParam(value = "stay", required = true) int stay,
			@RequestParam(value = "people", required = true) int people, Room room, HttpServletResponse response)
					throws Exception {
		room = (Room) roomInfoService.service(roomNo);
		int result = 0;
		int roomPeople = room.getrSize();
		int price = room.getPrice();
		if (roomPeople >= people) {
			if (stay != 0) {
				result = price * stay;
			} else {
				result = price;
			}
		} else {
			int gap = people - roomPeople;
			if (stay != 0) {
				result = (gap * 10000) * stay + (price * stay);
			} else {
				result = (gap * 10000) + price;
			}
		}

		String result1 = "<input type=\"text\" name=\"totalPrice\" readonly=\"readonly\" size=\"5\" "
				+ " id=\"totalPrice\" value=\"" + result + "\">원";

		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.print(result1);
	}
}
