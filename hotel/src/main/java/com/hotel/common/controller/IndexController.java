package com.hotel.common.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotel.common.service.ServiceInterface;
import com.hotel.member.model.Member;

@Controller
public class IndexController {

	private ServiceInterface qnaListService, boardListService, roomListService, bookedListService;

	public void setQnaListService(ServiceInterface qnaListService) {
		this.qnaListService = qnaListService;
	}

	public void setBoardListService(ServiceInterface boardListService) {
		this.boardListService = boardListService;
	}

	public void setRoomListService(ServiceInterface roomListService) {
		this.roomListService = roomListService;
	}

	public void setBookedListService(ServiceInterface bookedListService) {
		this.bookedListService = bookedListService;
	}

	@RequestMapping("/main/index.do")
	public String main(HttpSession session, Model model) throws Exception {
		// Member member = (Member) session.getAttribute("login");
		// model.addAttribute("qnaList", qnaListService.service(null));
		// model.addAttribute("boardList", boardListService.service(null));
		// model.addAttribute("roomList", roomListService.service(null));
		// model.addAttribute("bookedList",
		// bookedListService.service(member.getId()));
		return "main/index";
	}
}
