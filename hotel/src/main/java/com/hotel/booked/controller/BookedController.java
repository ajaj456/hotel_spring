package com.hotel.booked.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hotel.booked.model.Booked;
import com.hotel.common.service.ServiceInterface;

@Controller
public class BookedController {
	private ServiceInterface bookedListService, bookedViewService, bookedWriteProcessService, bookedUpdateService,
			bookedUpdateProcessService, bookedDeleteProcessService;

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

	// 글리스트
	@RequestMapping("/booked/list.do")
	public String list(@RequestParam(value = "page", required = false, defaultValue = "1") int page, Model model)
			throws Exception {
		System.out.println("bookedController.list()");
		model.addAttribute("list", bookedListService.service(page));
		return "booked/list";
	}

	// 글보기
	@RequestMapping("/booked/view.do")
	public String view(@RequestParam("no") String roomNo, Model model) throws Exception {
		System.out.println("bookedController.view()");
		model.addAttribute("booked", bookedViewService.service((Integer.parseInt(roomNo))));
		return "booked/view";
	}

	// 글쓰기폼 - GET
	@RequestMapping(value = "/booked/write.do", method = RequestMethod.GET)
	public String write() {
		System.out.println("bookedController.write-get()");
		return "booked/write";
	}

	// 글쓰기 처리 - POST
	@RequestMapping(value = "/booked/write.do", method = RequestMethod.POST)
	public String write(Booked booked) throws Exception {
		System.out.println("bookedController.write-post()");
		bookedWriteProcessService.service(booked);
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
