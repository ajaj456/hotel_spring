package com.hotel.booked.service;

import com.hotel.booked.dao.BookedDao;
import com.hotel.booked.model.Booked;
import com.hotel.common.service.ServiceInterface;

public class MyReviewUpdateService implements ServiceInterface {
	private BookedDao bookedDao;

	public void setBookedDao(BookedDao bookedDao) {
		this.bookedDao = bookedDao;
	}


	@Override
	public Object service(Object obj) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("BookedUpdateProcessService.service()");
		bookedDao.myReviewUpdate((Booked)obj);
		return null;
	}
}
