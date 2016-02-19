package com.hotel.room.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hotel.common.service.ServiceInterface;

@Controller
public class RoomController {
	private ServiceInterface roomListService,roomViewService,
	roomWriteProcessService,roomUpdateProcessService,roomDeleteProcessService;

	public void setRoomListService(ServiceInterface roomListService) {
		this.roomListService = roomListService;
	}

	public void setRoomViewService(ServiceInterface roomViewService) {
		this.roomViewService = roomViewService;
	}

	public void setRoomWriteProcessService(ServiceInterface roomWriteProcessService) {
		this.roomWriteProcessService = roomWriteProcessService;
	}

	public void setRoomUpdateProcessService(ServiceInterface roomUpdateProcessService) {
		this.roomUpdateProcessService = roomUpdateProcessService;
	}

	public void setRoomDeleteProcessService(ServiceInterface roomDeleteProcessService) {
		this.roomDeleteProcessService = roomDeleteProcessService;
	}
	// 글리스트
		@RequestMapping("/board/list.do")
		public String list(@RequestParam(value = "page", required = false, defaultValue = "1") int page, Model model)
				throws Exception {
			System.out.println("boardController.list()");
			model.addAttribute("list", roomListService.service(page));

			return "board/list";
		}

		// 글보기
		@RequestMapping("/board/view.do")
		public String view(int no, Model model) throws Exception {
			System.out.println("boardController.view()");
			model.addAttribute("board", roomViewService.service(no));
			return "board/view";
		}

		// 글쓰기폼 - GET
		@RequestMapping(value = "/board/write.do", method = RequestMethod.GET)
		public String write() {
			System.out.println("boardController.write-get()");
			return "board/write";
		}

		// 글쓰기 처리 - POST
		@RequestMapping(value = "/board/write.do", method = RequestMethod.POST)
		public String write(Board board) throws Exception {
			System.out.println("boardController.write-post()");
			roomWriteProcessService.service(board);
			return "redirect:list.do";
		}

		// 글수정 폼 - get
		@RequestMapping(value = "/board/update.do", method = RequestMethod.GET)
		public String update(@RequestParam(value = "no", required = false) int no, Model model) throws Exception {
			System.out.println("boardController.update-get()");
			model.addAttribute("board", roomUpdateService.service(no));
			return "board/update";
		}

		// 글수정 처리 - POST
		@RequestMapping(value = "/board/update.do", method = RequestMethod.POST)
		public String update(Board board) throws Exception {
			System.out.println("boardController.update-post()");
			roomUpdateProcessService.service(board);
			return "redirect:view.do"
			+ "?no=" + board.getNo();
		}

		// 글삭제 처리
		@RequestMapping("/board/delete.do")
		public String delete(int no) throws Exception {
			System.out.println("boardController.delete()");
			roomDeleteProcessService.service(no);
			return "redirect:list.do";
		}

	}


