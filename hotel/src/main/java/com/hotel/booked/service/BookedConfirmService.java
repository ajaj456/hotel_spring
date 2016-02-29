package com.hotel.booked.service;

import com.hotel.booked.dao.BookedDao;
import com.hotel.booked.model.Booking;
import com.hotel.common.service.ServiceInterface;

public class BookedConfirmService implements ServiceInterface {
	private BookedDao bookedDao;

	public void setBookedDao(BookedDao bookedDao) {
		this.bookedDao = bookedDao;
	}

	@Override
	public Object service(Object obj) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("BookedConfirmService.service()");
		return bookedDao.confirm((Booking) obj);
	}

}
