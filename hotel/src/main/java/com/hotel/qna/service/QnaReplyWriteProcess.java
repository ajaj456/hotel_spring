//	답변 글쓰기
package com.hotel.qna.service;

import com.hotel.common.service.ServiceInterface;
import com.hotel.qna.dao.QnaDao;
import com.hotel.qna.model.Qna;

public class QnaReplyWriteProcess implements ServiceInterface{
private QnaDao qnaDao;
	
	public void setQnaDao(QnaDao qnaDao) {
		this.qnaDao = qnaDao;
	}

	@Override
	public Object service(Object obj) throws Exception {
		// TODO Auto-generated method stub
		return qnaDao.reply((Qna) obj);
	}

	

}
