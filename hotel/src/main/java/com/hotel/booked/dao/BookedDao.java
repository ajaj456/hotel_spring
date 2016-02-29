package com.hotel.booked.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.hotel.booked.model.Booked;
import com.hotel.booked.model.Booking;

public class BookedDao {
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	// 예약리스트
	public Object list() {
		// TODO Auto-generated method stub
		System.out.println("Booked.lsit()");
		return sqlSessionTemplate.selectList("dao.Booked.list");
	}

	// 예약보기
	public Object view(Object obj) {
		// TODO Auto-generated method stub
		System.out.println("Booked.view()");
		return sqlSessionTemplate.selectOne("dao.Booked.view", obj);
	}

	// 예약하기
	public Object write(Booked booked) {
		// TODO Auto-generated method stub
		System.out.println("Booked.write()");
		return sqlSessionTemplate.insert("dao.Booked.write", booked);
	}

	// 예약하기2
	public Object bookingwrite(Booking booking) {
		// TODO Auto-generated method stub
		System.out.println("Booking.write()");
		return sqlSessionTemplate.insert("dao.Booked.bookingwrite", booking);
	}

	// 예약변경
	public Object update(Booked booked) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("dao.Booked.update", booked);

	}

	// 예약취소
	public Object delete(Object obj) {
		// TODO Auto-generated method stub
		System.out.println("Booked.delete()");
		return sqlSessionTemplate.delete("dao.Booked.delete", obj);
	}

	// 예약리스트
	public Object roomList() {
		// TODO Auto-generated method stub
		System.out.println("Booked.list()");
		return sqlSessionTemplate.selectList("dao.Booked.roomList");
	}

	// 예약확인
	public Object confirm(Booking booking) {
		return sqlSessionTemplate.selectOne("dao.Booked.confirm", booking);
	}

}
