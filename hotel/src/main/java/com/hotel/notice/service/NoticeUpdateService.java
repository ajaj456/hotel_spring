package com.hotel.notice.service;

import com.hotel.common.service.ServiceInterface;
import com.hotel.notice.dao.NoticeDao;

public class NoticeUpdateService implements ServiceInterface{
	private NoticeDao noticeDao;

	public void setNoticeDao(NoticeDao noticeDao) {
		this.noticeDao = noticeDao;
	}

	@Override
	public Object service(Object obj){
		System.out.println("NoticeUpdateService.service()");
		// TODO Auto-generated method stub
		return noticeDao.view(obj); 
	}
}
