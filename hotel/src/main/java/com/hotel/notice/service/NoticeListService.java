package com.hotel.notice.service;

import com.hotel.common.service.ServiceInterface;
import com.hotel.notice.dao.NoticeDao;

public class NoticeListService implements ServiceInterface{
	private NoticeDao noticeDao;

	public void setNoticeDao(NoticeDao noticeDao) {
		this.noticeDao = noticeDao;
	}

	@Override
	public Object service(Object obj) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("NoticeListService.service()");
		return noticeDao.list(); 
	}
}
