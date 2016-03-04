package com.hotel.booked.service;

import com.hotel.booked.dao.BookedDao;
import com.hotel.booked.model.Booked;
import com.hotel.common.service.ServiceInterface;

public class BookedMainListService implements ServiceInterface {
	private BookedDao bookedDao;

	public void setBookedDao(BookedDao bookedDao) {
		this.bookedDao = bookedDao;
	}

	@Override
	public Object service(Object obj) throws Exception {
		return bookedDao.mainlist((Booked) obj);
	}

}