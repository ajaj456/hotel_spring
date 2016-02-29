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
	public Object service(Object obj) {
		Qna qna = (Qna)obj;
		// refNo가 같고 답변 대상글 보다 ordNo가 크면서
		// levNo가 같거나 작은 게시물 중에서 최소 ordNo값을 확인한다.
		// 원본글에 바로 답변을 다는 경우 minOrdNo는 1의 값을 가진다.
		if((Integer)qnaDao.minOrdNo(qna)==1)
			qna.setOrdNo((Integer)qnaDao.maxOrdNo(qna.getRefNo())+1);
		else{
			qna.setOrdNo(qna.getOrdNo()+1);
			// 같은 parentNo를 갖는 답변글이 이미 있을 때
			if((Integer)qnaDao.countParentNo(qna.getParentNo())>=1)
				qna.setOrdNo((Integer)qnaDao.parentMaxOrdNo(qna.getParentNo())+1);
			// 밀어낼 글이 작성중인 글보다 levNo가 높을 때 건너뛰는 처리
			if((Integer)qnaDao.nextLevNo(qna.getOrdNo())>qna.getLevNo())
				qna.setOrdNo((Integer)qnaDao.nextLevMaxOrdNo(qna.getOrdNo())+1);
			qnaDao.ordNoIncrease(qna);
			}
		qna.setLevNo(qna.getLevNo() + 1);
		qnaDao.reply(qna);
		return null;
	}
	

}
