
package com.hotel.common.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.hotel.common.service.ServiceInterface;

@Controller
public class IndexController {

	private ServiceInterface noticeMainListService, roomMainListService;

	public void setNoticeMainListService(ServiceInterface noticeMainListService) {
		this.noticeMainListService = noticeMainListService;
	}

	public void setRoomMainListService(ServiceInterface roomMainListService) {
		this.roomMainListService = roomMainListService;
	}

	@RequestMapping("/main/index.do")
	public String main(HttpSession session, Model model) throws Exception {
		model.addAttribute("noticeList", noticeMainListService.service(null));
		model.addAttribute("roomList", roomMainListService.service(null));
		return "main/index";
	}
}
