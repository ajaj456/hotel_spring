package com.hotel.qna.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hotel.common.service.ServiceInterface;
import com.hotel.qna.model.Qna;
import com.hotel.room.model.Room;
import com.hotel.util.DuplicateFile;

@Controller
public class QnaController {
	private ServiceInterface qnaListService, qnaViewService, qnaWriteProcessService, qnaUpdateProcessService,
			qnaDeleteProcessService, qnaReplyWriteProcess;

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

	// 파일 첨부가된 게시판 글쓰기 완료 후 처리
	// @RequestMapping(value = "/qna/write.do", method = RequestMethod.POST)
	// public String write(Qna qna, Model model,
	// HttpServletRequest request) throws Exception {
	// System.out.println("QnaController.write():post");

	// 서버에 올라갈 실제 폴더 찾기
	// String realPath = request.getServletContext().getRealPath("upload/qna");
	// System.out.println(realPath);
	// if (!qna.getFile().isEmpty()) {
	// String fileName = qna.getFile().getOriginalFilename();
	// File file = DuplicateFile.getFile(realPath, qna.getFile());
	// qna.getFile().transferTo(file); // 파일 이동
	// qna.setFileName(file.getName());
	// qnaWriteProcessService.service(room);
	//
	// return "redirect:list.do";
	// }
	// System.out.println(realPath);
	// return "redirect:list.do";
	//
	// }

	// 글수정 폼 - get
	@RequestMapping(value = "/qna/update.do", method = RequestMethod.GET)
	public String update(@RequestParam(value = "no", required = false) String no, Model model) throws Exception {
		System.out.println("qnaController.update-get()");
		model.addAttribute("qna", qnaViewService.service((Integer.parseInt(no))));
		return "qna/update";
	}

	// 글수정 처리 - POST
	@RequestMapping(value = "/qna/update.do", method = RequestMethod.POST)
	public String qnaUpdateProcess(Qna qna, Model model, HttpServletRequest request) throws Exception {
		System.out.println("qnaController.update-post()");
		System.out.println(qna);
		// 서버에 올라갈 실제 폴더 찾기
		// String realPath =
		// request.getServletContext().getRealPath("upload/room");
		// System.out.println(realPath);
		// if (!qna.getFile().isEmpty()) {
		// String fileName = qna.getFile().getOriginalFilename();
		// File file = DuplicateFile.getFile(realPath, qna.getFile());
		// qna.getFile().transferTo(file); // 파일 이동
		// qna.setFileName(file.getName());
		// qnaUpdateProcessService.service(qna);
		//
		return "redirect" + ":view.do" + "?no=";
		//
		// }else {
		// System.out.println(realPath);
		// qnaUpdateProcessService.service(qna);
		// return "redirect"
		// + ":view.do" + "?no=" + qna.getQnaNo();
		// }
	}

	// 글삭제 처리
	@RequestMapping("/qna/delete.do")
	public String delete(@RequestParam("no") String no) throws Exception {
		System.out.println("qnaController.delete()");
		qnaDeleteProcessService.service(no);
		return "redirect:list.do";
	}

	// 답변 글쓰기폼 - GET
	@RequestMapping(value = "/qna/reply.do", method = RequestMethod.GET)
	public String reply() {
		System.out.println("qnaController.reply-get()");
		return "qna/reply";
	}

	// 글쓰기 처리 - POST
	@RequestMapping(value = "/qna/reply.do", method = RequestMethod.POST)
	public String reply(Qna qna) throws Exception {
		System.out.println("qnaController.reply-post()");
		qnaReplyWriteProcess.service(qna);
		return "redirect:list.do";
	}
}