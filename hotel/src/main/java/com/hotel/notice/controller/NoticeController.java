package com.hotel.notice.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hotel.common.service.ServiceInterface;
import com.hotel.notice.model.Notice;
import com.hotel.notice.model.NoticeModel;
import com.hotel.util.DuplicateFile;

@Controller
public class NoticeController {
	private ServiceInterface noticeListService, noticeViewService, noticeWriteProcessService, noticeUpdateProcessService,
	noticeDeleteProcessService;

	public void setNoticeListService(ServiceInterface noticeListService) {
		this.noticeListService = noticeListService;
	}
	public void setNoticeViewService(ServiceInterface noticeViewService) {
		this.noticeViewService = noticeViewService;
	}
	public void setNoticeWriteProcessService(ServiceInterface noticeWriteProcessService) {
		this.noticeWriteProcessService = noticeWriteProcessService;
	}
	public void setNoticeUpdateProcessService(ServiceInterface noticeUpdateProcessService) {
		this.noticeUpdateProcessService = noticeUpdateProcessService;
	}
	public void setNoticeDeleteProcessService(ServiceInterface noticeDeleteProcessService) {
		this.noticeDeleteProcessService = noticeDeleteProcessService;
	}
	
	// 공지리스트
	@RequestMapping("/notice/list.do")
	public String list(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "pri", required = true, defaultValue = "cur") String pri,	Model model)
			throws Exception {
		System.out.println("noticeController.list()");
		Notice notice = new Notice();
		notice.setPeriod(pri);
		notice.setPage(page);
		NoticeModel noticeModel = (NoticeModel) noticeListService.service(notice);
		model.addAttribute("list", noticeModel.getList());
		model.addAttribute("jspData", noticeModel.getJspData());
		
		return "notice/list";
	}
	// 공지보기
	@RequestMapping("/notice/view.do")
	public String view(@RequestParam("no") String no, Model model) throws Exception {
		System.out.println("noticeController.view()");
		model.addAttribute("notice", noticeViewService.service((Integer.parseInt(no))));
		return "notice/view";
	}

	// 공지사항 글쓰기폼 - GET
	@RequestMapping(value = "/notice/write.do", method = RequestMethod.GET)
	public String write() {
		System.out.println("noticeController.write-get()");
		return "notice/write";
	}

	// 파일 첨부가된 게시판 글쓰기 완료 후 처리
	@RequestMapping(value = "/notice/write.do", method = RequestMethod.POST)
	public String write(Notice notice, Model model, HttpServletRequest request) throws Exception {
		System.out.println("NoticeController.write():post");
		// 서버에 올라갈 실제 폴더 찾기
		String realPath = request.getServletContext().getRealPath("upload/notice");
		if (!notice.getFile().isEmpty()) {
			String fileName = notice.getFile().getOriginalFilename();
			File file = DuplicateFile.getFile(realPath, notice.getFile());
			notice.getFile().transferTo(file); // 파일 이동
			notice.setFileName(file.getName());
			noticeWriteProcessService.service(notice);

			return "redirect:list.do";
		}
		return "redirect:list.do";

	}

	// 글수정 폼 - get
	@RequestMapping(value = "/notice/update.do", method = RequestMethod.GET)
	public String update(@RequestParam(value = "no", required = false) int no, Model model) throws Exception {
		System.out.println("noticeController.update-get()");
		Notice notice =  (Notice) noticeViewService.service(no);
		model.addAttribute("notice", notice);
		return "notice/update";
	}

	// 글수정 처리 - POST
	@RequestMapping(value = "/notice/update.do", method = RequestMethod.POST)
	public String updateProcess(Notice notice, Model model, HttpServletRequest request) throws Exception {
		System.out.println("noticeController.update-post()");
		// 서버에 올라갈 실제 폴더 찾기
		String realPath = request.getServletContext().getRealPath("upload/review");
		if (!notice.getFile().isEmpty()) {
			String fileName = notice.getFile().getOriginalFilename();
			File file = DuplicateFile.getFile(realPath, notice.getFile());
			notice.getFile().transferTo(file); // 파일 이동
			notice.setFileName(file.getName());
			noticeUpdateProcessService.service(notice);
			return "redirect" + ":view.do" + "?no=" + notice.getNo();

		} else {
			noticeUpdateProcessService.service(notice);
			return "redirect" + ":view.do" + "?no=" + notice.getNo();
		}
	}

	// 글삭제 처리
	@RequestMapping("/notice/delete.do")
	public String delete(@RequestParam("no") String no) throws Exception {
		System.out.println("Controller.delete()");
		noticeDeleteProcessService.service(no);
		return "redirect:list.do";
	}
}
