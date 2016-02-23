package com.hotel.booked.model;

public class Booked {
private int bno,payck,inoutck,roomNo,stay;
private String id,startDate;
public int getBno() {
	return bno;
}
public void setBno(int bno) {
	this.bno = bno;
}
public int getPayck() {
	return payck;
}
public void setPayck(int payck) {
	this.payck = payck;
}
public int getInoutck() {
	return inoutck;
}
public void setInoutck(int inoutck) {
	this.inoutck = inoutck;
}
public int getRoomNo() {
	return roomNo;
}
public void setRoomNo(int roomNo) {
	this.roomNo = roomNo;
}
public int getStay() {
	return stay;
}
public void setStay(int stay) {
	this.stay = stay;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getStartDate() {
	return startDate;
}
public void setStartDate(String startDate) {
	this.startDate = startDate;
}
@Override
public String toString() {
	return "Booked [bno=" + bno + ", payck=" + payck + ", inoutck=" + inoutck + ", roomNo=" + roomNo + ", stay=" + stay
			+ ", id=" + id + ", startDate=" + startDate + "]";
}

}
