
package com.hotel.common.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotel.booked.model.Booked;
import com.hotel.common.service.ServiceInterface;
import com.hotel.member.model.Member;

@Controller
public class IndexController {

	private ServiceInterface noticeMainListService, roomMainListService, bookedMainListService;

	public void setNoticeMainListService(ServiceInterface noticeMainListService) {
		this.noticeMainListService = noticeMainListService;
	}

	public void setRoomMainListService(ServiceInterface roomMainListService) {
		this.roomMainListService = roomMainListService;
	}

	public void setBookedMainListService(ServiceInterface bookedMainListService) {
		this.bookedMainListService = bookedMainListService;
	}

	@RequestMapping("/main/index.do")
	public String main(HttpSession session, Model model, Booked booked) throws Exception {
		Member member = (Member) session.getAttribute("login");
		if (member != null) {
			booked.setId(member.getId());
			model.addAttribute("bookedList", bookedMainListService.service(booked));
		}
		model.addAttribute("noticeList", noticeMainListService.service(null));
		model.addAttribute("roomList", roomMainListService.service(null));
		return "main/index";
	}
}
