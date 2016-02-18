package com.hotel.member.service;

import com.hotel.common.service.ServiceInterface;
import com.hotel.member.dao.MemberDao;
import com.hotel.member.model.Member;

public class MemberFindPwProcessService implements ServiceInterface {

	private MemberDao memberDao;

	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	@Override
	public Object service(Object obj) throws Exception {
		return memberDao.findPw((Member) obj);
	}

}
