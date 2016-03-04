package com.hotel.common.service;

import com.hotel.notice.dao.NoticeDao;

public class NoticeListService implements ServiceInterface {

	private NoticeDao noticeDao;

	public void setNoticeDao(NoticeDao noticeDao) {
		this.noticeDao = noticeDao;
	}

	@Override
	public Object service(Object obj) throws Exception {
		return noticeDao.mainlist(obj);
	}

}
