package com.hotel.member.service;

import com.hotel.common.service.ServiceInterface;
import com.hotel.member.dao.MemberDao;

public class MemberJoinIdCheckService implements ServiceInterface {

	private MemberDao memberDao;

	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	@Override
	public Object service(Object obj) throws Exception {
		return memberDao.joinCheckId(obj);
	}

}
