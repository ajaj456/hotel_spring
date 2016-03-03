package com.hotel.booked.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.hotel.booked.model.Booked;
import com.hotel.booked.model.Booking;
import com.hotel.common.model.JspData;

public class BookedDao {
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	// 예약리스트
	public Object list(Booked booked) {
		// TODO Auto-generated method stub
		System.out.println("Booked.lsit()");
		return sqlSessionTemplate.selectList("dao.Booked.list", booked);
	}

	// 예약보기
	public Object view(Object obj) {
		// TODO Auto-generated method stub
		System.out.println("Booked.view()");
		return sqlSessionTemplate.selectList("dao.Booked.view", obj);
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
	public Object delete(Booking booking) {
		// TODO Auto-generated method stub
		System.out.println("Booked.delete()");
		return sqlSessionTemplate.delete("dao.Booked.delete", booking);
	}

	// 예약방리스트
	public Object roomList() {
		// TODO Auto-generated method stub
		System.out.println("Booked.list()");
		return sqlSessionTemplate.selectList("dao.Booked.roomList");
	}

	// 예약확인
	public Object confirm(Booking booking) {
		return sqlSessionTemplate.selectOne("dao.Booked.confirm", booking);
	}

	// 예약 취소리스트
	public Object bookingRoomList(Object obj) {
		System.out.println("BookedDao.bookingRoomList()");
		return sqlSessionTemplate.selectList("dao.Booked.bookingRoomList", obj);
	}

	// 회원예약리스트
	public Object mangelist(JspData jspData) {
		return sqlSessionTemplate.selectList("dao.Booked.mangelist", jspData);
	}

	// 총개수
	public int totalRow() {
		return sqlSessionTemplate.selectOne("dao.Booked.totalCount");
	}

	// ck업데이트
	public Object ckUpdate(Booked booked) {
		sqlSessionTemplate.update("dao.Booked.ckUpdate", booked);
		return null;
	}

	// mylist보기
	public Object mylist(JspData jspData) {
		// TODO Auto-generated method stub
		System.out.println("bookedmylist()");
		return sqlSessionTemplate.selectList("dao.Booked.mylist", jspData);
	}

	// 나의 리뷰 상태 변경
	public Object myReviewUpdate(Booked booked) {
		sqlSessionTemplate.update("dao.Booked.myReviewUpdate", booked);
		return null;
	}

	// 예약 번호 가져오기
	public Object bnoConfirm(Booked booked) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.Booked.bnoConfirm", booked);
	}

	public Object roomInfo(Object obj) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.Booked.roomInfo", obj);
		
	}
}
