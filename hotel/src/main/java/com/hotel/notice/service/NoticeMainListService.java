package com.hotel.notice.service;

import com.hotel.common.service.ServiceInterface;
import com.hotel.notice.dao.NoticeDao;

public class NoticeMainListService implements ServiceInterface {

	private NoticeDao noticeDao;

	public void setNoticeDao(NoticeDao noticeDao) {
		this.noticeDao = noticeDao;
	}

	@Override
	public Object service(Object obj) throws Exception {
		System.out.println("NoticeMainListService.service()");
		return noticeDao.mainlist(obj);
	}

}
