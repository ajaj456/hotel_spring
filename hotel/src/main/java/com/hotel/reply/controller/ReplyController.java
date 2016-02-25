package com.hotel.reply.controller;

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
	private ServiceInterface replyListService, replyWriteProcessService, replyUpdateProcessService,
			replyDeleteProcessService;

	public void setReplyListService(ServiceInterface replyListService) {
		this.replyListService = replyListService;
	}

	public void setReplyWriteProcessService(ServiceInterface replyWriteProcessService) {
		this.replyWriteProcessService = replyWriteProcessService;
	}

	public void setReplyUpdateProcessService(ServiceInterface replyUpdateProcessService) {
		this.replyUpdateProcessService = replyUpdateProcessService;
	}

	public void setReplyDeleteProcessService(ServiceInterface replyDeleteProcessService) {
		this.replyDeleteProcessService = replyDeleteProcessService;
	}

	// 글리스트
	@RequestMapping("/board/view.do")
	public String list(@RequestParam(value = "no", required = false) int no, Model model)
			throws Exception {
		System.out.println("replyController.list()");
		model.addAttribute("relist", replyListService.service(no));
		return "reply/list";
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

	// 글수정 처리 - POST
	@RequestMapping(value = "/reply/update.do")
	public String updateProcess(Reply reply, Board board, Model model, HttpServletRequest request) throws Exception {
		System.out.println("replyController.update-post()");
		System.out.println(reply);
		replyUpdateProcessService.service(reply);
		return "/board/view.do" + "?no=" + board.getNo();
	}

	// 글삭제 처리
	@RequestMapping("/reply/delete.do")
	public String delete(Reply reply ) throws Exception {
		System.out.println("replyController.delete()");
		System.out.println(reply);
		replyDeleteProcessService.service(reply.getReno());
		return "/board/view.do" + "?no=" + reply.getNo();
	}

}
