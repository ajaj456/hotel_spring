package com.hotel.board.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hotel.board.model.Board;
import com.hotel.common.service.ServiceInterface;
import com.hotel.util.DuplicateFile;

public class BoardController {
	private ServiceInterface boardListService, boardViewService, boardUpdateService, boardWriteProcessService,
	boardUpdateProcessService, boardDeleteProcessService;

	public void setBoardListService(ServiceInterface boardListService) {
		this.boardListService = boardListService;
	}

	public void setBoardViewService(ServiceInterface boardViewService) {
		this.boardViewService = boardViewService;
	}

	public void setBoardUpdateService(ServiceInterface boardUpdateService) {
		this.boardUpdateService = boardUpdateService;
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
	
	// 글리스트
	@RequestMapping("/board/list.do")
	public String list(@RequestParam(value = "page", required = false, defaultValue = "1") int page, Model model)
			throws Exception {
		System.out.println("boardController.list()");
		model.addAttribute("list", boardListService.service(page));

		return "board/list";
	}
	// 글보기
	@RequestMapping("/board/view.do")
	public String view(@RequestParam("no") String roomNo, Model model) throws Exception {
		System.out.println("boardController.view()");
		model.addAttribute("room", boardViewService.service((Integer.parseInt(roomNo))));
		return "room/view";
	}

	// 글쓰기폼 - GET
	@RequestMapping(value = "/board/write.do", method = RequestMethod.GET)
	public String write() {
		System.out.println("boardController.write-get()");
		return "board/write";
	}
	// 파일 첨부가된 게시판 글쓰기 완료 후 처리
	@RequestMapping(value = "/board/write.do", method = RequestMethod.POST)
	public String write(Board board, Model model,
			HttpServletRequest request) throws Exception {
		System.out.println("BoardController.write():post");

		// 서버에 올라갈 실제 폴더 찾기
		String realPath = request.getServletContext().getRealPath("upload/board");
		System.out.println(realPath);
		if (!board.getFile().isEmpty()) {
			String fileName = board.getFile().getOriginalFilename();
			File file = DuplicateFile.getFile(realPath, board.getFile());
			board.getFile().transferTo(file); // 파일 이동
			board.setFileName(file.getName());
			boardWriteProcessService.service(board);

			return "redirect:list.do";
		}
		System.out.println(realPath);
		return "redirect:list.do";

	}

	// 글수정 폼 - get
	@RequestMapping(value = "/board/update.do", method = RequestMethod.GET)
	public String update(@RequestParam(value = "no", required = false) String no, Model model) throws Exception {
		System.out.println("boardController.update-get()");
		model.addAttribute("board", boardViewService.service((Integer.parseInt(no))));
		return "board/update";
	}

	// 글수정 처리 - POST
	@RequestMapping(value = "/room/update.do", method = RequestMethod.POST)
	public String updateProcess(Board board, Model model,
			HttpServletRequest request) throws Exception {
		System.out.println("boardController.update-post()");
		System.out.println(board);
		// 서버에 올라갈 실제 폴더 찾기
		String realPath = request.getServletContext().getRealPath("upload/room");
		System.out.println(realPath);
		if (!board.getFile().isEmpty()) {
			String fileName = board.getFile().getOriginalFilename();
			File file = DuplicateFile.getFile(realPath, board.getFile());
			board.getFile().transferTo(file); // 파일 이동
			board.setFileName(file.getName());
			boardUpdateProcessService.service(board);
			
			return "redirect"
			+ ":view.do" + "?no=" + board.getNo();

		}else {
			System.out.println(realPath);
			boardUpdateProcessService.service(board);
			return "redirect"
			+ ":view.do" + "?no=" + board.getNo();
		}
	}
			

	// 글삭제 처리
	@RequestMapping("/board/delete.do")
	public String delete(@RequestParam("no") String no) throws Exception {
		System.out.println("roomController.delete()");
		boardDeleteProcessService.service(no);
		return "redirect:list.do";
	}
}
