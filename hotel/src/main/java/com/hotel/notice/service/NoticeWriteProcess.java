package com.hotel.notice.service;

import com.hotel.common.service.ServiceInterface;
import com.hotel.notice.dao.NoticeDao;
import com.hotel.notice.model.Notice;

public class NoticeWriteProcess implements ServiceInterface{
	private NoticeDao noticeDao;

	public void setNoticeDao(NoticeDao noticeDao) {
		this.noticeDao = noticeDao;
	}

	@Override
	public Object service(Object obj) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("NoticeWritrProcessService.service()");
		return noticeDao.write((Notice)obj);
		
	}
}
