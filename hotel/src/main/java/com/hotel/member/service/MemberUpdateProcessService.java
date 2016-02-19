package com.hotel.member.service;

import com.hotel.common.service.ServiceInterface;
import com.hotel.member.dao.MemberDao;
import com.hotel.member.model.Member;

public class MemberUpdateProcessService implements ServiceInterface {

	private MemberDao memberDao;

	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	@Override
	public Object service(Object obj) throws Exception {
		System.out.println(memberDao.update((Member) obj));
		return memberDao.update(obj);
	}

}
