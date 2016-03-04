
package com.hotel.common.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotel.common.service.ServiceInterface;
import com.hotel.member.model.Member;

@Controller
public class IndexController {

	private ServiceInterface noticeListService, roomListService;

	public void setNoticeListService(ServiceInterface noticeListService) {
		this.noticeListService = noticeListService;
	}

	public void setRoomListService(ServiceInterface roomListService) {
		this.roomListService = roomListService;
	}

	@RequestMapping("/main/index.do")
	public String main(HttpSession session, Model model) throws Exception {
		model.addAttribute("noticeList", noticeListService.service(null));
		model.addAttribute("roomList", roomListService.service(null));
		return "main/index";
	}
}
