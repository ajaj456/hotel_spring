package com.hotel.booked.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.hotel.room.model.Room;

public class BookedDao {
	private SqlSessionTemplate sqlSessionTemplate;

	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	// 예약리스트
	public Object list() {
		// TODO Auto-generated method stub
		System.out.println("Booked.lsit()");
	
		return null;
	}

	// 예약보기
	public Object view(Object obj) {
		// TODO Auto-generated method stub
		System.out.println("Booked.view()");
		return null;
	}
	
	// 예약하기
	public Object write(Room obj) {
		// TODO Auto-generated method stub
		System.out.println("Booked.write()");
		return null;
	}
	
	// 예약변경
	public void update(Room obj) {
		// TODO Auto-generated method stub
		System.out.println("Booked.update()");
		
	}
	
	// 예약취소 
	public void delete(Object obj) {
		// TODO Auto-generated method stub
		System.out.println("Booked.delete()");
		
	}

}
