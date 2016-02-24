package com.hotel.reply.service;

import com.hotel.common.service.ServiceInterface;
import com.hotel.reply.dao.ReplyDao;
import com.hotel.reply.model.Reply;

public class ReplyUpdateService implements ServiceInterface {
	private ReplyDao replyDao;

	public void setReplyDao(ReplyDao replyDao) {
		this.replyDao = replyDao;
	}

	@Override
	public Object service(Object obj) {
		System.out.println("RoomUpdateService.service()");
		// TODO Auto-generated method stub
		return replyDao.view((Reply) obj);
	}

}
