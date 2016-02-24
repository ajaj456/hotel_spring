package com.hotel.reply.service;

import com.hotel.common.service.ServiceInterface;
import com.hotel.room.dao.RoomDao;
import com.hotel.room.model.Room;

public class ReplyUpdateProcessService implements ServiceInterface {
	private RoomDao roomDao;

	public void setRoomDao(RoomDao roomDao) {
		this.roomDao = roomDao;
	}

	@Override
	public Object service(Object obj) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("RoomUpdateProcessService.service()");
		roomDao.update((Room)obj);
		return null;
	}
}
