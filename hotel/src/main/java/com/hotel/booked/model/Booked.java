package com.hotel.booked.model;

public class Booked {
	private int bno, inoutck, roomNo, stay, page, people, totalPrice;
	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	private String id, startDate;
	private int year, month, day;

	public int getPeople() {
		return people;
	}

	public void setPeople(int people) {
		this.people = people;
	}

	public int getYear() {
		return year;
	}

	public int getMonth() {
		return month;
	}

	public int getDay() {
		return day;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
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

	public void setYear(int year) {
		this.year = year;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public void setDay(int day) {
		this.day = day;
	}

	@Override
	public String toString() {
		return "Booked [bno=" + bno + ", inoutck=" + inoutck + ", roomNo=" + roomNo + ", stay=" + stay + ", page="
				+ page + ", people=" + people + ", totalPrice=" + totalPrice + ", id=" + id + ", startDate=" + startDate
				+ ", year=" + year + ", month=" + month + ", day=" + day + "]";
	}

	
}
