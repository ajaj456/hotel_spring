package com.hotel.reply.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hotel.board.model.Board;
import com.hotel.common.service.ServiceInterface;
import com.hotel.reply.model.Reply;

@Controller
public class ReplyController {
	private ServiceInterface replyListService, replyViewService, replyWriteProcessService, replyUpdateService,
			replyUpdateProcessService, replyDeleteProcessService;

	public void setReplyListService(ServiceInterface replyListService) {
		this.replyListService = replyListService;
	}

	public void setReplyViewService(ServiceInterface replyViewService) {
		this.replyViewService = replyViewService;
	}

	public void setReplyWriteProcessService(ServiceInterface replyWriteProcessService) {
		this.replyWriteProcessService = replyWriteProcessService;
	}

	public void setReplyUpdateService(ServiceInterface replyUpdateService) {
		this.replyUpdateService = replyUpdateService;
	}

	public void setReplyUpdateProcessService(ServiceInterface replyUpdateProcessService) {
		this.replyUpdateProcessService = replyUpdateProcessService;
	}

	public void setReplyDeleteProcessService(ServiceInterface replyDeleteProcessService) {
		this.replyDeleteProcessService = replyDeleteProcessService;
	}

	// 글리스트
	@RequestMapping("/board/view.do")
	public String list(@RequestParam(value = "page", required = false, defaultValue = "1") int page, Model model)
			throws Exception {
		System.out.println("replyController.list()");
		model.addAttribute("list", replyListService.service(page));
		return "reply/list";
	}

	// 글보기
	@RequestMapping("/reply/view.do")
	public String view(@RequestParam("no") String reno, Model model) throws Exception {
		System.out.println("replyController.view()");
		model.addAttribute("reply", replyViewService.service((Integer.parseInt(reno))));
		return "reply/view";
	}

	// 글쓰기폼 - GET
	@RequestMapping(value = "/reply/write.do", method = RequestMethod.GET)
	public String write() {
		System.out.println("replyController.write-get()");
		return "reply/write";
	}

	// 글쓰기 처리 - POST
	@RequestMapping(value = "/reply/write.do", method = RequestMethod.POST)
	public String write(Reply reply) throws Exception {
		System.out.println("replyController.write-post()");
		replyWriteProcessService.service(reply);
		return "redirect:list.do";
	}

	// 글수정 폼 - get
	@RequestMapping(value = "/reply/update.do", method = RequestMethod.GET)
	public String update(@RequestParam(value = "no", required = false) String reno, Model model) throws Exception {
		System.out.println("replyController.update-get()");
		model.addAttribute("reply", replyViewService.service((Integer.parseInt(reno))));
		return "reply/update";
	}

	// 글수정 처리 - POST
	@RequestMapping(value = "/reply/update.do", method = RequestMethod.POST)
	public String updateProcess(Reply reply, Board board, Model model, HttpServletRequest request) throws Exception {
		System.out.println("replyController.update-post()");
		System.out.println(reply);
		replyUpdateProcessService.service(reply);
		return "redirect" + ":view.do" + "?no=" + board.getNo();
	}

	// 글삭제 처리
	@RequestMapping("/reply/delete.do")
	public String delete(@RequestParam("no") String reno) throws Exception {
		System.out.println("replyController.delete()");
		replyDeleteProcessService.service(reno);
		return "redirect:list.do";
	}

}
