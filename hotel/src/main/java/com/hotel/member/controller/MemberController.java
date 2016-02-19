package com.hotel.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hotel.common.service.ServiceInterface;
import com.hotel.member.model.Member;

@Controller
public class MemberController {

	private ServiceInterface memberJoinProcessService, memberDeleteProcessService, memberUpdateService,
			memberUpdateProcessService, memberPwUpdateProcessService, memberFindIdProcessService,
			memberFindPwProcessService, memberListService, memberGradeUpdateService, memberGradeUpdateProcessService,
			memberLoginProcessService, memberViewService;

	public void setMemberJoinProcessService(ServiceInterface memberJoinProcessService) {
		this.memberJoinProcessService = memberJoinProcessService;
	}

	public void setMemberDeleteProcessService(ServiceInterface memberDeleteProcessService) {
		this.memberDeleteProcessService = memberDeleteProcessService;
	}

	public void setMemberUpdateService(ServiceInterface memberUpdateService) {
		this.memberUpdateService = memberUpdateService;
	}

	public void setMemberUpdateProcessService(ServiceInterface memberUpdateProcessService) {
		this.memberUpdateProcessService = memberUpdateProcessService;
	}

	public void setMemberPwUpdateProcessService(ServiceInterface memberPwUpdateProcessService) {
		this.memberPwUpdateProcessService = memberPwUpdateProcessService;
	}

	public void setMemberFindIdProcessService(ServiceInterface memberFindIdProcessService) {
		this.memberFindIdProcessService = memberFindIdProcessService;
	}

	public void setMemberFindPwProcessService(ServiceInterface memberFindPwProcessService) {
		this.memberFindPwProcessService = memberFindPwProcessService;
	}

	public void setMemberListService(ServiceInterface memberListService) {
		this.memberListService = memberListService;
	}

	public void setMemberGradeUpdateService(ServiceInterface memberGradeUpdateService) {
		this.memberGradeUpdateService = memberGradeUpdateService;
	}

	public void setMemberGradeUpdateProcessService(ServiceInterface memberGradeUpdateProcessService) {
		this.memberGradeUpdateProcessService = memberGradeUpdateProcessService;
	}

	public void setMemberLoginProcessService(ServiceInterface memberLoginProcessService) {
		this.memberLoginProcessService = memberLoginProcessService;
	}

	public void setMemberViewService(ServiceInterface memberViewService) {
		this.memberViewService = memberViewService;
	}

	// 회원가입 폼 - get
	@RequestMapping(value = "/member/join.do", method = RequestMethod.GET)
	public String join() {
		return "member/join";
	}

	// 회원가입 처리 - post
	@RequestMapping(value = "/member/join.do", method = RequestMethod.POST)
	public String join(Member member, @RequestParam("tel1") String tel1, @RequestParam("tel2") String tel2,
			@RequestParam("tel3") String tel3) throws Exception {
		String tel = tel1 + "-" + tel2 + "-" + tel3;
		member.setTel(tel);
		memberJoinProcessService.service(member);
		return "redirect:../main/index.do";
	}

	// 회원탈퇴 폼 - get
	@RequestMapping(value = "/member/delete.do", method = RequestMethod.GET)
	public String delete() {
		return "member/delete";
	}

	// 회원탈퇴 처리 - post
	@RequestMapping(value = "/member/delete.do", method = RequestMethod.POST)
	public String delete(Member member) throws Exception {
		memberDeleteProcessService.service(member);
		memberLoginProcessService.service(null);
		return "redirect:../main/index.do";
	}

	// 회원정보보기
	@RequestMapping("/member/view.do")
	public String view(String id, Model model) throws Exception {
		model.addAttribute("member", memberViewService.service(id));
		return "member/view";
	}

	// 회원정보수정 폼 - get
	@RequestMapping(value = "/member/update.do", method = RequestMethod.GET)
	public String update(@RequestParam(value = "id", required = false) String id, Model model) throws Exception {
		model.addAttribute("member", memberUpdateService.service(id));
		Member member = (Member) memberUpdateService.service(id);
		model.addAttribute("tel1", member.getTel().substring(0, 3));
		model.addAttribute("tel2", member.getTel().substring(4, 8));
		model.addAttribute("tel3", member.getTel().substring(9, 13));
		return "member/update";
	}

	// 회원정보수정 처리 - post
	@RequestMapping(value = "/member/update.do", method = RequestMethod.POST)
	public String update(Member member, @RequestParam("tel1") String tel1, @RequestParam("tel2") String tel2,
			@RequestParam("tel3") String tel3) throws Exception {
		String tel = tel1 + "-" + tel2 + "-" + tel3;
		member.setTel(tel);
		System.out.println(member);
		memberUpdateProcessService.service(member);
		memberLoginProcessService.service(null);
		return "redirect:../main/index.do";
	}

	// 비밀번호변경 폼 - get
	@RequestMapping(value = "/member/pwupdate.do", method = RequestMethod.GET)
	public String pwUpdate() {
		return "member/pwupdate";
	}

	// 비밀번호변경 처리 - post
	@RequestMapping(value = "/member/pwupdate.do", method = RequestMethod.POST)
	public String pwUpdate(Member member) throws Exception {
		memberPwUpdateProcessService.service(member);
		memberLoginProcessService.service(null);
		return "redirect:../main/index.do";
	}

	// 아이디찾기 폼 - get
	@RequestMapping(value = "/member/findId.do", method = RequestMethod.GET)
	public String findId() {
		return "member/findIdPw";
	}

	// 아이디찾기 처리 - post
	@RequestMapping(value = "/member/findId.do", method = RequestMethod.POST)
	public String findId(Member member) throws Exception {
		memberFindIdProcessService.service(member);
		return "redirect:resultId.do";
	}

	// 아이디찾기 결과
	@RequestMapping("/member/resultId.do")
	public String resultId(Member member) throws Exception {
		return "member/resultId";
	}

	// 비밀번호찾기 폼 - get
	@RequestMapping(value = "/member/findPw.do", method = RequestMethod.GET)
	public String findPw() {
		return "member/findIdPw";
	}

	// 비밀번호찾기 처리 - post
	@RequestMapping(value = "/member/findPw.do", method = RequestMethod.POST)
	public String findPw(Member member) throws Exception {
		memberFindPwProcessService.service(member);
		return "redirect:resultPw.do";
	}

	// 비밀번호찾기 결과
	@RequestMapping("/member/resultPw.do")
	public String resultPw(Member member) throws Exception {
		return "member/resultPw";
	}

	// 회원리스트
	@RequestMapping("/member/list.do")
	public String list(@RequestParam(value = "page", required = false, defaultValue = "1") int page, Model model)
			throws Exception {
		model.addAttribute("list", memberListService.service(page));
		return "member/list";
	}

	// 회원등급변경 폼 - get
	@RequestMapping(value = "/member/grade.do", method = RequestMethod.GET)
	public String grade(@RequestParam(value = "id", required = false) String id, Model model) throws Exception {
		model.addAttribute("member", memberGradeUpdateService.service(id));
		return "member/grade";
	}

	// 회원등급변경 처리 - post
	@RequestMapping(value = "/member/grade.do", method = RequestMethod.POST)
	public String grade(Member member) throws Exception {
		memberGradeUpdateProcessService.service(member);
		return "redirect:list.do";
	}

	// 로그인처리 폼
	@RequestMapping(value = "/member/login.do", method = RequestMethod.GET)
	public String login() {
		return "member/login";
	}

	// 로그인처리 처리
	@RequestMapping(value = "/member/login.do", method = RequestMethod.POST)
	public String login(HttpSession session, Member member) throws Exception {
		session.setAttribute("login", memberLoginProcessService.service(member));
		return "redirect:../main/index.do";
	}

	// 로그아웃처리
	@RequestMapping("/member/logout.do")
	public String logout(HttpSession session, Member member) throws Exception {
		session.setAttribute("login", null);
		return "redirect:../main/index.do";
	}

}
