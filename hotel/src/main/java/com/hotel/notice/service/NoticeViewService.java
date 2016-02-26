package com.hotel.notice.service;

import com.hotel.common.service.ServiceInterface;
import com.hotel.notice.dao.NoticeDao;

public class NoticeViewService implements ServiceInterface{
	private NoticeDao noticeDao;

	public void setNoticeDao(NoticeDao noticeDao) {
		this.noticeDao = noticeDao;
	}

	@Override
	public Object service(Object obj) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("NoticeViewService.service()");
		return noticeDao.view(obj); 
	}
}
