package com.hotel.qna.service;

import com.hotel.common.service.ServiceInterface;
import com.hotel.qna.dao.QnaDao;

public class QnaViewService implements ServiceInterface{
private QnaDao qnaDao;
	
	public void setQnaDao(QnaDao qnaDao) {
		this.qnaDao = qnaDao;
	}

	@Override
	public Object service(Object obj) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("QnaViewService.service()");
		qnaDao.hitUp(obj);
		return qnaDao.view(obj);
	}



}
