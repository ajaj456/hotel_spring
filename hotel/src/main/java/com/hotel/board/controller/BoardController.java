package com.hotel.board.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.hotel.board.model.Board;
import com.hotel.board.model.BoardModel;
import com.hotel.booked.model.Booked;
import com.hotel.common.service.ServiceInterface;
import com.hotel.reply.model.Reply;
import com.hotel.reply.model.ReplyModel;
import com.hotel.util.DuplicateFile;

@Controller
public class BoardController {
	// board
	private ServiceInterface boardListService, boardViewService, boardWriteProcessService, boardUpdateProcessService,
			boardDeleteProcessService, myReviewUpdateService, myReviewDeleteUpdateService;

	public void setMyReviewDeleteUpdateService(ServiceInterface myReviewDeleteUpdateService) {
		this.myReviewDeleteUpdateService = myReviewDeleteUpdateService;
	}

	public void setMyReviewUpdateService(ServiceInterface myReviewUpdateService) {
		this.myReviewUpdateService = myReviewUpdateService;
	}

	public void setBoardListService(ServiceInterface boardListService) {
		this.boardListService = boardListService;
	}

	public void setBoardViewService(ServiceInterface boardViewService) {
		this.boardViewService = boardViewService;
	}

	public void setBoardWriteProcessService(ServiceInterface boardWriteProcessService) {
		this.boardWriteProcessService = boardWriteProcessService;
	}

	public void setBoardUpdateProcessService(ServiceInterface boardUpdateProcessService) {
		this.boardUpdateProcessService = boardUpdateProcessService;
	}

	public void setBoardDeleteProcessService(ServiceInterface boardDeleteProcessService) {
		this.boardDeleteProcessService = boardDeleteProcessService;
	}

	// reply
	private ServiceInterface replyListService, replyViewService, replyWriteProcessService, replyUpdateProcessService,
			replyDeleteProcessService, replyCountService;

	public void setReplyListService(ServiceInterface replyListService) {
		this.replyListService = replyListService;
	}

	public void setReplyViewService(ServiceInterface replyViewService) {
		this.replyViewService = replyViewService;
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

	public void setReplyCountService(ServiceInterface replyCountService) {
		this.replyCountService = replyCountService;
	}

	// 글리스트
	@RequestMapping("/board/list.do")
	public String list(@RequestParam(value = "page", required = false, defaultValue = "1") int page, Model model)
			throws Exception {
		System.out.println("boardController.list()");
		BoardModel boardModel = (BoardModel) boardListService.service(page);
		model.addAttribute("list", boardModel.getList());
		model.addAttribute("jspData", boardModel.getJspData());
		return "board/list";
	}

	// 글보기
	@RequestMapping("/board/view.do")
	public String view(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam("no") String no, Model model) throws Exception {
		System.out.println("boardController.view()");
		Reply reply = new Reply();
		reply.setPage(page);
		reply.setNo((Integer.parseInt(no)));
		ReplyModel replyModel = (ReplyModel) replyListService.service(reply);
		model.addAttribute("review", boardViewService.service((Integer.parseInt(no))));
		model.addAttribute("relist", replyListService.service(reply));
		model.addAttribute("jspData", replyModel.getJspData());
		return "board/view";
	}

	// 글쓰기폼 - GET
	@RequestMapping(value = "/board/write.do", method = RequestMethod.GET)
	public String write() {
		System.out.println("boardController.write-get()");
		return "board/write";
	}

	// 파일 첨부가된 게시판 글쓰기 완료 후 처리
	@RequestMapping(value = "/board/write.do", method = RequestMethod.POST)
	public String write(@RequestParam("startDate") String startDate, @RequestParam("roomNo") int roomNo,
			Board board, Booked booked ,Model model, HttpServletRequest request) throws Exception {
		System.out.println("BoardController.write():post");
		booked.setStartDate(startDate);
		booked.setRoomNo(roomNo);
		// 서버에 올라갈 실제 폴더 찾기
		String realPath = request.getServletContext().getRealPath("upload/review");
		if (!board.getFile().isEmpty()) {
			String fileName = board.getFile().getOriginalFilename();
			File file = DuplicateFile.getFile(realPath, board.getFile());
			board.getFile().transferTo(file); // 파일 이동
			board.setFileName(file.getName());
			myReviewUpdateService.service(booked);
			boardWriteProcessService.service(board);

			return "redirect:list.do";
		}
		return "redirect:list.do";

	}

	// 글삭제 처리
	@RequestMapping("/board/delete.do")
	public String delete(@RequestParam("no") String no,@RequestParam("bno") int bno ) throws Exception {
		System.out.println("Controller.delete()");
		myReviewDeleteUpdateService.service(bno);
		boardDeleteProcessService.service(no);
		return "redirect:list.do";
	}

	// 댓글달기
	@RequestMapping(value = "/board/replyWrite.do", method = RequestMethod.POST)
	public String replyWrite(Reply reply) throws Exception {
		replyWriteProcessService.service(reply);
		return "redirect" + ":view.do" + "?no=" + reply.getNo();
	}

	// 댓글 수정
	@RequestMapping(value = "/board/replyUpdate.do", method = RequestMethod.POST)
	public String replyUpdate(Reply reply) throws Exception {
		replyUpdateProcessService.service(reply);
		return "redirect" + ":view.do" + "?no=" + reply.getNo();
	}

	// 댓글 삭제
	@RequestMapping(value = "/board/replyDelete.do")
	public String replyDelete(Reply reply) throws Exception {
		int no = reply.getNo();
		replyDeleteProcessService.service(reply);
		return "redirect" + ":view.do" + "?no=" + no;
	}

}
