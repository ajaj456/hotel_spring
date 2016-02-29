package com.hotel.booked.model;

public class Booking {
	private int roomNo, bno, bookingNo, people;
	private String id, stayDate;
	private int year, month, day;

	public int getPeople() {
		return people;
	}

	public void setPeople(int people) {
		this.people = people;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public int getBookingNo() {
		return bookingNo;
	}

	public void setBookingNo(int bookingNo) {
		this.bookingNo = bookingNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getStayDate() {
		return stayDate;
	}

	public void setStayDate(String stayDate) {
		this.stayDate = stayDate;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	@Override
	public String toString() {
		return "Booking [roomNo=" + roomNo + ", bno=" + bno + ", bookingNo=" + bookingNo + ", id=" + id + ", stayDate="
				+ stayDate + ", year=" + year + ", month=" + month + ", day=" + day + "]";
	}

}
