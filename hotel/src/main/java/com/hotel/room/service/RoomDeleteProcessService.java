package com.hotel.room.service;

import com.hotel.common.service.ServiceInterface;
import com.hotel.room.dao.RoomDao;

public class RoomDeleteProcessService implements ServiceInterface {
	private RoomDao roomDao;

	public void setRoomDao(RoomDao roomDao) {
		this.roomDao = roomDao;
	}

	@Override
	public Object service(Object obj) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("RoomDeleteService.service()");
		roomDao.delete(obj);	
		return null;
	}

}
