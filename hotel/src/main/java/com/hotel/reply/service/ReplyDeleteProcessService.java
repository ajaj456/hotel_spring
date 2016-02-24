package com.hotel.reply.service;

import com.hotel.common.service.ServiceInterface;
import com.hotel.reply.dao.ReplyDao;
import com.hotel.reply.model.Reply;

public class ReplyDeleteProcessService implements ServiceInterface {
	private ReplyDao replyDao;

	public void setReplyDao(ReplyDao replyDao) {
		this.replyDao = replyDao;
	}

	@Override
	public Object service(Object obj) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("ReplyDaoDeleteService.service()");
		replyDao.delete((Reply) obj);
		return null;
	}

}
