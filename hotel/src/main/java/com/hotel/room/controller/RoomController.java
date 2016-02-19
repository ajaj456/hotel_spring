package com.hotel.room.controller;

import org.springframework.stereotype.Controller;

import com.hotel.common.service.ServiceInterface;

@Controller
public class RoomController {
	private ServiceInterface roomListService,roomViewService,
	roomWriteProcessService,roomUpdateProcessService,roomDeleteProcessService;

	public void setRoomListService(ServiceInterface roomListService) {
		this.roomListService = roomListService;
	}

	public void setRoomViewService(ServiceInterface roomViewService) {
		this.roomViewService = roomViewService;
	}

	public void setRoomWriteProcessService(ServiceInterface roomWriteProcessService) {
		this.roomWriteProcessService = roomWriteProcessService;
	}

	public void setRoomUpdateProcessService(ServiceInterface roomUpdateProcessService) {
		this.roomUpdateProcessService = roomUpdateProcessService;
	}

	public void setRoomDeleteProcessService(ServiceInterface roomDeleteProcessService) {
		this.roomDeleteProcessService = roomDeleteProcessService;
	}

}


