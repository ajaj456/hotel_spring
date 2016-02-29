package com.hotel.booked.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

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
			bookedUpdateProcessService, bookedDeleteProcessService, roomListService, bookingWriteService,
			bookedConfirmService;

	public void setRoomListService(ServiceInterface roomListService) {
		this.roomListService = roomListService;
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
		model.addAttribute("room", roomListService.service(null));
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
	@RequestMapping(value = "/booked/write.do")
	public String write(@RequestParam(value = "roomNo", required = false) int roomNo, Booked booked, Booking booking)
			throws Exception {
		System.out.println("bookedController.write-post()");

		DateFormat df = new SimpleDateFormat("yyyy-mm-dd");
		Date date = null;
		String dat;
		Calendar cal = Calendar.getInstance();

		for (int i = 0; i < booked.getStay(); i++) {
			booking.setRoomNo(roomNo);
			date = df.parse(booked.getStartDate());
			cal.setTime(date);
			cal.add(Calendar.DATE, i);
			dat = df.format(cal.getTime());
			booking.setStayDate(dat);
			if ((Booking) bookedConfirmService.service(booking) != null)
				return "redirect:list.do";
		}
		bookedWriteProcessService.service(booked);

		for (int i = 0; i < booked.getStay(); i++) {
			booking = new Booking();
			booking.setId(booked.getId());
			booking.setRoomNo(roomNo);
			booking.setPeople(booked.getPeople());
			booking.setBno(9);
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

}
