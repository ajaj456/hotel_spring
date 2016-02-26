package com.hotel.board.service;

import com.hotel.board.dao.BoardDao;
import com.hotel.common.service.ServiceInterface;

public class BoardViewService implements ServiceInterface{
	private BoardDao boardDao;

	public void setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
	}

	@Override
	public Object service(Object obj) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("BoardViewService.service()");
		boardDao.hitUp(obj);
		return boardDao.view(obj); 
	}
}
