package com.hotel.notice.service;

import com.hotel.common.service.ServiceInterface;
import com.hotel.notice.dao.NoticeDao;

public class NoticeDeleteProcessService implements ServiceInterface{
	private NoticeDao noticeDao;

	public void setNoticeDao(NoticeDao noticeDao) {
		this.noticeDao= noticeDao;
	}

	@Override
	public Object service(Object obj) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("NoticeDeleteService.service()");
		noticeDao.delete(obj);	
		return null;
	}
}
