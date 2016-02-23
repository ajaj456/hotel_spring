package com.hotel.board.service;

import com.hotel.board.dao.BoardDao;
import com.hotel.common.service.ServiceInterface;
import com.hotel.room.dao.RoomDao;

public class boardDeleteProcessService implements ServiceInterface{
	private BoardDao boardDao;

	public void setRoomDao(RoomDao roomDao) {
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
