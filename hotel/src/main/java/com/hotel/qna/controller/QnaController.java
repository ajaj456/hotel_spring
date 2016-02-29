package com.hotel.qna.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hotel.common.service.ServiceInterface;
import com.hotel.qna.model.Qna;

@Controller
public class QnaController {
	private ServiceInterface qnaListService, qnaViewService, qnaWriteProcessService, qnaUpdateProcessService, qnaUpdateService,
			qnaDeleteProcessService, qnaReplyWriteProcess, qnaReplyWrite;

	public void setQnaReplyWrite(ServiceInterface qnaReplyWrite) {
		this.qnaReplyWrite = qnaReplyWrite;
	}

	public void setQnaListService(ServiceInterface qnaListService) {
		this.qnaListService = qnaListService;
	}

	public void setQnaViewService(ServiceInterface qnaViewService) {
		this.qnaViewService = qnaViewService;
	}

	public void setQnaWriteProcessService(ServiceInterface qnaWriteProcessService) {
		this.qnaWriteProcessService = qnaWriteProcessService;
	}

	public void setQnaUpdateProcessService(ServiceInterface qnaUpdateProcessService) {
		this.qnaUpdateProcessService = qnaUpdateProcessService;
	}

	public void setQnaDeleteProcessService(ServiceInterface qnaDeleteProcessService) {
		this.qnaDeleteProcessService = qnaDeleteProcessService;
	}

	public void setQnaReplyWriteProcess(ServiceInterface qnaReplyWriteProcess) {
		this.qnaReplyWriteProcess = qnaReplyWriteProcess;
	}
	

	public void setQnaUpdateService(ServiceInterface qnaUpdateService) {
		this.qnaUpdateService = qnaUpdateService;
	}

	// 글리스트
	@RequestMapping("/qna/list.do")
	public String list(@RequestParam(value = "page", required = false, defaultValue = "1") int page, Model model)
			throws Exception {
		System.out.println("qnaController.list()");
		model.addAttribute("list", qnaListService.service(page));
		return "qna/list";
	}

	// 글보기
	@RequestMapping("/qna/view.do")
	public String view(@RequestParam("no") String no, Model model) throws Exception {
		System.out.println("qnaController.view()");
		model.addAttribute("qna", qnaViewService.service((Integer.parseInt(no))));
		return "qna/view";
	}

	// 글쓰기폼 - GET
	@RequestMapping(value = "/qna/write.do", method = RequestMethod.GET)
	public String write() {
		System.out.println("qnaController.write-get()");
		return "qna/write";
	}

	// 글쓰기 처리 - POST
	@RequestMapping(value = "/qna/write.do", method = RequestMethod.POST)
	public String write(Qna qna) throws Exception {
		System.out.println("qnaController.write-post()");
		qnaWriteProcessService.service(qna);
		return "redirect:list.do";
	}


	// 글수정 폼 - get
	@RequestMapping(value = "/qna/update.do", method = RequestMethod.GET)
	public String update(@RequestParam(value = "no", required = false) int no, Model model) throws Exception {
		System.out.println("qnaController.update-get()");
		model.addAttribute("qna", qnaViewService.service(no));
		return "qna/update";
	}

	// 글수정 처리 - POST
	@RequestMapping(value = "/qna/update.do", method = RequestMethod.POST)
	public String qnaUpdateService(Qna qna, Model model, HttpServletRequest request) throws Exception {
		System.out.println("qnaController.update-post()");
		qnaUpdateProcessService.service(qna);
		return "redirect" + ":view.do" + "?no=" + qna.getNo();
		
	}

	// 글삭제 처리
	@RequestMapping("/qna/delete.do")
	public String delete(@RequestParam("no") int no) throws Exception {
		System.out.println("qnaController.delete()");
		qnaDeleteProcessService.service(no);
		return "redirect:list.do";
	}

	// 답변 글쓰기폼 - GET
	@RequestMapping(value = "/qna/reply.do", method = RequestMethod.GET)
	public String reply(int no, Model model) throws Exception{
		Qna qna = (Qna)qnaReplyWrite.service(no);
		if(qna.getLevNo()>=1)
			return "redirect:list.do";
					model.addAttribute("qna", qnaReplyWrite.service(no));
		System.out.println("qnaController.reply-get()");
		return "qna/reply";
	}

	// 답변글쓰기 처리 - POST
	@RequestMapping(value = "/qna/reply.do", method = RequestMethod.POST)
	public String reply(Qna qna) throws Exception {
		System.out.println("qnaController.reply-post()");
		qnaReplyWriteProcess.service(qna);
		return "redirect:list.do";
	}

	
}
