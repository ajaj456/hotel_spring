package com.hotel.qna.service;

import com.hotel.common.service.ServiceInterface;
import com.hotel.qna.dao.QnaDao;

public class QnaUpdateService implements ServiceInterface {
private QnaDao qnaDao;
	
	public void setQnaDao(QnaDao qnaDao) {
		this.qnaDao = qnaDao;
	}

	@Override
	public Object service(Object obj){
		// TODO Auto-generated method stub
		System.out.println("QnaUpdateService.service()");
		
		return qnaDao.view(obj);
	}



}
