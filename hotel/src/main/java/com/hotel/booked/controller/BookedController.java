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
import com.hotel.booked.model.Booking;
import com.hotel.common.service.ServiceInterface;

@Controller
public class BookedController {
	private ServiceInterface bookedListService, bookedViewService, bookedWriteProcessService, bookedUpdateService,
			bookedUpdateProcessService, bookedDeleteProcessService, bookedRoomListService, bookingWriteService,
			bookedConfirmService;



	public void setBookedRoomListService(ServiceInterface bookedRoomListService) {
		this.bookedRoomListService = bookedRoomListService;
	}

	public void setBookedListService(ServiceInterface bookedListService) {
		this.bookedListService = bookedListService;
	}

	public void setBookedViewService(ServiceInterface bookedViewService) {
		this.bookedViewService = bookedViewService;
	}

	public void setBookedWriteProcessService(ServiceInterface bookedWriteProcessService) {
		this.bookedWriteProcessService = bookedWriteProcessService;
	}

	public void setBookedUpdateService(ServiceInterface bookedUpdateService) {
		this.bookedUpdateService = bookedUpdateService;
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

	// 글리스트
	@RequestMapping("/booked/list.do")
	public String list(@RequestParam(value = "page", required = false, defaultValue = "1") int page, Model model)
			throws Exception {
		System.out.println("bookedController.list()");
		model.addAttribute("list", bookedListService.service(page));
		model.addAttribute("room", bookedRoomListService.service(null));
		return "booked/list";
	}

	// 글보기
	@RequestMapping("/booked/view.do")
	public String view(@RequestParam("no") String roomNo, Model model) throws Exception {
		System.out.println("bookedController.view()");
		model.addAttribute("booked", bookedViewService.service((Integer.parseInt(roomNo))));
		return "booked/view";
	}

	// 글쓰기 처리 - POST
	@RequestMapping(value = "/booked/write.do", method = RequestMethod.POST)
	public String write(@RequestParam(value = "roomNo", required = false) int roomNo, HttpServletResponse response,
			Booked booked, Booking booking, Model model) throws Exception {
		System.out.println("bookedController.write-post()");
		DateFormat df = new SimpleDateFormat("yyyy-mm-dd");
		Date date = null;
		String dat;
		Calendar cal = Calendar.getInstance();
		booked.setRoomNo(roomNo);
		System.out.println(booked);
		bookedWriteProcessService.service(booked);

		for (int i = 0; i < booked.getStay(); i++) {
			booking = new Booking();
			booking.setId(booked.getId());
			booking.setRoomNo(roomNo);
			booking.setPeople(booked.getPeople());
			booking.setBno(1);
			date = df.parse(booked.getStartDate());
			cal.setTime(date);
			cal.add(Calendar.DATE, i);
			dat = df.format(cal.getTime());
			booking.setStayDate(dat);
			bookingWriteService.service(booking);
		}
		return "redirect:list.do";
	}

	// 글수정 폼 - get
	@RequestMapping(value = "/booked/update.do", method = RequestMethod.GET)
	public String update(@RequestParam(value = "no", required = false) String roomNo, Model model) throws Exception {
		System.out.println("bookedController.update-get()");
		model.addAttribute("booked", bookedUpdateService.service((Integer.parseInt(roomNo))));
		return "booked/update";
	}

	// 글수정 처리 - POST
	@RequestMapping(value = "/booked/update.do", method = RequestMethod.POST)
	public String update(Booked booked) throws Exception {
		System.out.println("bookedController.update-post()");
		bookedUpdateProcessService.service(booked);
		return "redirect:view.do?no=" + booked.getBno();
	}

	// 글삭제 처리
	@RequestMapping("/booked/delete.do")
	public String delete(@RequestParam("bno") String bno) throws Exception {
		System.out.println("bookedController.delete()");
		bookedDeleteProcessService.service(bno);
		return "redirect:list.do";
	}

	// 예약중복체크
	@RequestMapping("/booked/bookCheck.do")
	public void bookCheck(@RequestParam(value = "startDate", required = false) String startDate,
			@RequestParam(value = "roomNo", required = false) int roomNo,
			@RequestParam(value = "stay", required = false) int stay, HttpServletResponse response, Booking booking,
			Booked booked) throws Exception {

		DateFormat df = new SimpleDateFormat("yyyy-mm-dd");
		Date date = null;
		String dat;
		Calendar cal = Calendar.getInstance();
		String result = "<span style='color:yellow'>[ 예약가능합니다. ]</span>";

		for (int i = 0; i < stay; i++) {
			booking.setRoomNo(roomNo);
			date = df.parse(startDate);
			cal.setTime(date);
			cal.add(Calendar.DATE, i);
			dat = df.format(cal.getTime());
			booking.setStayDate(dat);
			if ((Booking) bookedConfirmService.service(booking) != null) {
				if (bookedConfirmService.service(booking) != null)
					result = "<span style='color:white'>[ 이미 예약이 되어있습니다. 다른 날짜를 선택해주세요. ]</span>";
			}
		}

		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.print(result);
	}
}
