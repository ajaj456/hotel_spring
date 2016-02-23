package com.hotel.board.service;

import com.hotel.board.dao.BoardDao;
import com.hotel.common.service.ServiceInterface;

public class BoardViewService implements ServiceInterface{
	private BoardDao boardDao;

	public void setRoomDao(BoardDao boardDao) {
		this.boardDao = boardDao;
	}

	@Override
	public Object service(Object obj) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("BoardViewService.service()");
		return boardDao.view(obj); 
	}
}
