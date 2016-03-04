package com.hotel.room.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.hotel.room.model.Room;

public class RoomDao {
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	// 글리스트
	public Object list(Object obj) {
		// TODO Auto-generated method stub
		System.out.println("RoomDao.list()");
		System.out.println("obj111");
		return sqlSessionTemplate.selectList("dao.Room.list", obj);
	}

	// 글보기 - 글수정
	public Object view(Object obj) {
		System.out.println("RoomDao.view()");
		return sqlSessionTemplate.selectOne("dao.Room.view", obj);
	}

	// 글쓰기
	public Object write(Room room) {
		System.out.println("RoomDao.write()");
		return sqlSessionTemplate.insert("dao.Room.write", room);
	}

	// 글수정처리
	public Object update(Room room) {
		System.out.println("RoomDao.update()");
		return sqlSessionTemplate.update("dao.Room.update", room);
	}

	// 글삭제
	public Object delete(Object obj) {
		System.out.println("RoomDao.delete()");
		return sqlSessionTemplate.delete("dao.Room.delete", obj);
	}

	// 메인 리스트
	public Object mainlist(Object obj) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("dao.Room.mainlist", obj);
	}
}
