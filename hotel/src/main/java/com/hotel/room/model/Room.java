package com.hotel.room.model;

import org.springframework.web.multipart.MultipartFile;

public class Room {
	private int roomNo, rSize, price;
	private String rName, roomInfo, fileName;
	private MultipartFile file;
	// 페이지 처리를 위한 변수 선언
	private int page, floor;

	public int getRoomNo() {
		return roomNo;
	}

	public int getrSize() {
		return rSize;
	}

	public int getPrice() {
		return price;
	}

	public String getrName() {
		return rName;
	}

	public String getRoomInfo() {
		return roomInfo;
	}

	public String getFileName() {
		return fileName;
	}

	public MultipartFile getFile() {
		return file;
	}

	public int getPage() {
		return page;
	}

	public int getFloor() {
		return floor;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public void setrSize(int rSize) {
		this.rSize = rSize;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public void setrName(String rName) {
		this.rName = rName;
	}

	public void setRoomInfo(String roomInfo) {
		this.roomInfo = roomInfo;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public void setFloor(int floor) {
		this.floor = floor;
	}

	@Override
	public String toString() {
		return "Room [roomNo=" + roomNo + ", rSize=" + rSize + ", price=" + price + ", rName=" + rName + ", roomInfo="
				+ roomInfo + ", fileName=" + fileName + ", file=" + file + ", page=" + page + ", floor=" + floor + "]";
	}

}
