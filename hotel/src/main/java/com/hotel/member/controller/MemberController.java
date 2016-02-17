package com.hotel.member.controller;

import org.springframework.stereotype.Controller;

import com.hotel.common.service.ServiceInterface;

@Controller
public class MemberController {

	private ServiceInterface memberJoinProcessService, memberDeleteProcessService, memberUpdateService,
			memberUpdateProcessService, memberPwUpdateService, memberPwUpdateProcessService, memberFindIdService,
			memberFindIdProcessService, memberFindPwService, memberFindPwProcessService, memberListService,
			memberGradeUpdateService, memberGradeUpdateProcessService, memberLoginService, memberLoginProcessService,
			memberLogoutProcessService;

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

	public void setMemberPwUpdateService(ServiceInterface memberPwUpdateService) {
		this.memberPwUpdateService = memberPwUpdateService;
	}

	public void setMemberPwUpdateProcessService(ServiceInterface memberPwUpdateProcessService) {
		this.memberPwUpdateProcessService = memberPwUpdateProcessService;
	}

	public void setMemberFindIdService(ServiceInterface memberFindIdService) {
		this.memberFindIdService = memberFindIdService;
	}

	public void setMemberFindIdProcessService(ServiceInterface memberFindIdProcessService) {
		this.memberFindIdProcessService = memberFindIdProcessService;
	}

	public void setMemberFindPwService(ServiceInterface memberFindPwService) {
		this.memberFindPwService = memberFindPwService;
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

	public void setMemberLoginService(ServiceInterface memberLoginService) {
		this.memberLoginService = memberLoginService;
	}

	public void setMemberLoginProcessService(ServiceInterface memberLoginProcessService) {
		this.memberLoginProcessService = memberLoginProcessService;
	}

	public void setMemberLogoutProcessService(ServiceInterface memberLogoutProcessService) {
		this.memberLogoutProcessService = memberLogoutProcessService;
	}

	// 회원가입

	
	// 회원탈퇴

	
	// 회원정보및수정

	
	// 비밀번호변경

	
	// 아이디찾기

	
	// 비밀번호찾기

	
	// 회원리스트

	
	// 회원등급변경

	
	// 로그인처리

	
	// 로그아웃처리

	
}
