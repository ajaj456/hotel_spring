package com.hotel.common.service;

import com.hotel.room.dao.RoomDao;

public class RoomListService implements ServiceInterface {

	private RoomDao roomDao;

	public void setRoomDao(RoomDao roomDao) {
		this.roomDao = roomDao;
	}

	@Override
	public Object service(Object obj) throws Exception {
		return roomDao.mainlist();
	}

}
