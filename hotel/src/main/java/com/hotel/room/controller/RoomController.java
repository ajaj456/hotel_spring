package com.hotel.room.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hotel.common.service.ServiceInterface;
import com.hotel.notice.model.Notice;
import com.hotel.notice.model.NoticeModel;
import com.hotel.room.model.Room;
import com.hotel.util.DuplicateFile;

@Controller
public class RoomController {
	private ServiceInterface roomListService, roomViewService, roomUpdateService, roomWriteProcessService,
			roomUpdateProcessService, roomDeleteProcessService;

	public void setRoomUpdateService(ServiceInterface roomUpdateService) {
		this.roomUpdateService = roomUpdateService;
	}

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
	@RequestMapping("/room/list.do")
	public String list(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "floor", required = true, defaultValue = "1") int floor, Model model)
			throws Exception {
		System.out.println("roomController.list()");
		Room room= new Room();
		room.setFloor(floor);
		room.setPage(page);
		model.addAttribute("list", roomListService.service(room));
		return "room/list";
	}

	// 글보기
	@RequestMapping("/room/view.do")
	public String view(@RequestParam("no") String roomNo, Model model) throws Exception {
		System.out.println("roomController.view()");
		model.addAttribute("room", roomViewService.service((Integer.parseInt(roomNo))));
		return "room/view";
	}

	// 글쓰기폼 - GET
	@RequestMapping(value = "/room/write.do", method = RequestMethod.GET)
	public String write() {
		System.out.println("roomController.write-get()");
		return "room/write";
	}

	// // 글쓰기 처리 - POST
	// @RequestMapping(value = "/room/write.do", method = RequestMethod.POST)
	// public String write(Room room) throws Exception {
	// System.out.println("roomController.write-post()");
	// roomWriteProcessService.service(room);
	// return "redirect:list.do";
	// }

	// 파일 첨부가된 게시판 글쓰기 완료 후 처리
	@RequestMapping(value = "/room/write.do", method = RequestMethod.POST)
	public String write(Room room, Model model,
			HttpServletRequest request) throws Exception {
		System.out.println("RoomController.write():post");

		// 서버에 올라갈 실제 폴더 찾기
		String realPath = request.getServletContext().getRealPath("upload/room");
		System.out.println(realPath);
		if (!room.getFile().isEmpty()) {
			String fileName = room.getFile().getOriginalFilename();
			File file = DuplicateFile.getFile(realPath, room.getFile());
			room.getFile().transferTo(file); // 파일 이동
			room.setFileName(file.getName());
			roomWriteProcessService.service(room);

			return "redirect:list.do";
		}
		System.out.println(realPath);
		return "redirect:list.do";

	}

	// 글수정 폼 - get
	@RequestMapping(value = "/room/update.do", method = RequestMethod.GET)
	public String update(@RequestParam(value = "no", required = false) String roomNo, Model model) throws Exception {
		System.out.println("roomController.update-get()");
		model.addAttribute("room", roomViewService.service((Integer.parseInt(roomNo))));
		return "room/update";
	}

	// 글수정 처리 - POST
		@RequestMapping(value = "/room/update.do", method = RequestMethod.POST)
		public String updateProcess(Room room, Model model,
				HttpServletRequest request) throws Exception {
			System.out.println("roomController.update-post()");
			System.out.println(room);
			// 서버에 올라갈 실제 폴더 찾기
			String realPath = request.getServletContext().getRealPath("upload/room");
			System.out.println(realPath);
			if (!room.getFile().isEmpty()) {
				String fileName = room.getFile().getOriginalFilename();
				File file = DuplicateFile.getFile(realPath, room.getFile());
				room.getFile().transferTo(file); // 파일 이동
				room.setFileName(file.getName());
				roomUpdateProcessService.service(room);
				
				return "redirect"
				+ ":view.do" + "?no=" + room.getRoomNo();
	
			}else {
				System.out.println(realPath);
				roomUpdateProcessService.service(room);
				return "redirect"
				+ ":view.do" + "?no=" + room.getRoomNo();
			}
	}
			

	// 글삭제 처리
	@RequestMapping("/room/delete.do")
	public String delete(@RequestParam("no") String roomNo) throws Exception {
		System.out.println("roomController.delete()");
		roomDeleteProcessService.service(roomNo);
		return "redirect:list.do";
	}

}
