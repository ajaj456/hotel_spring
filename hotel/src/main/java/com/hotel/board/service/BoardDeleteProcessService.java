package com.hotel.board.service;

import com.hotel.board.dao.BoardDao;
import com.hotel.common.service.ServiceInterface;

public class BoardDeleteProcessService implements ServiceInterface{
	private BoardDao boardDao;

	public void setBoardDao(BoardDao boardDao) {
		this.boardDao= boardDao;
	}

	@Override
	public Object service(Object obj) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("BoardDeleteService.service()");
		boardDao.delete(obj);	
		return null;
	}
}
