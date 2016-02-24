package com.hotel.board.service;

import com.hotel.board.dao.BoardDao;
import com.hotel.common.service.ServiceInterface;

public class BoardUpdateService implements ServiceInterface{
	private BoardDao boardDao;

	public void setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
	}

	@Override
	public Object service(Object obj){
		System.out.println("BoardUpdateService.service()");
		// TODO Auto-generated method stub
		return boardDao.view(obj); 
	}
}
