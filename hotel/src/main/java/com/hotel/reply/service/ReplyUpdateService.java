package com.hotel.reply.service;

import com.hotel.common.service.ServiceInterface;
import com.hotel.room.dao.RoomDao;

public class ReplyUpdateService implements ServiceInterface {
	private RoomDao roomDao;

	public void setRoomDao(RoomDao roomDao) {
		this.roomDao = roomDao;
	}

	@Override
	public Object service(Object obj){
		System.out.println("RoomUpdateService.service()");
		// TODO Auto-generated method stub
		return roomDao.view(obj); 
	}

}
