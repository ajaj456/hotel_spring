package com.hotel.board.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.hotel.board.model.Board;

public class BoardDao {
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	// 글리스트 
	public Object list() {
		// TODO Auto-generated method stub
		System.out.println("BoardDao.list()");
		return sqlSessionTemplate.selectList("dao.Board.list");
	}
	// 글보기 - 글수정
	public Object view(Object obj) {
		System.out.println("BoardDao.view()");
		return sqlSessionTemplate.selectOne("dao.Board.view", obj);
	}
	
	// 글쓰기
	public Object write(Board board) {
		System.out.println("BoardDao.write()");
		return sqlSessionTemplate.insert("dao.Board.write",board);
	}

	// 글수정처리
	public Object update(Board board) {
		System.out.println("BoardDao.update()");
		return sqlSessionTemplate.update("dao.Board.update", board);
	}

	// 글삭제
	public Object delete(Object obj) {
		System.out.println("BoardDao.delete()");
		return sqlSessionTemplate.delete("dao.Board.delete",obj);
	}
}
