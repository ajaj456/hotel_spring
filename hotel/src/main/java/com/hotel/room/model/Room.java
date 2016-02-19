package com.hotel.room.model;

public class Room {
private int roomNo, rSize, floor, price;
private String rName, roomInfo;

public int getRoomNo() {
	return roomNo;
}
public void setRoomNo(int roomNo) {
	this.roomNo = roomNo;
}
public int getrSize() {
	return rSize;
}
public void setrSize(int rSize) {
	this.rSize = rSize;
}
public int getFloor() {
	return floor;
}
public void setFloor(int floor) {
	this.floor = floor;
}
public int getPrice() {
	return price;
}
public void setPrice(int price) {
	this.price = price;
}
public String getrName() {
	return rName;
}
public void setrName(String rName) {
	this.rName = rName;
}
public String getRoomInfo() {
	return roomInfo;
}
public void setRoomInfo(String roomInfo) {
	this.roomInfo = roomInfo;
}
@Override
public String toString() {
	return "Room [roomNo=" + roomNo + ", rSize=" + rSize + ", floor=" + floor + ", price=" + price + ", rName=" + rName
			+ ", roomInfo=" + roomInfo + "]";
}
}
