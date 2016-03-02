package com.hotel.board.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.hotel.board.model.Board;

public class BoardDao {
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	// 글리스트 
	public Object list(Object obj) {
		// TODO Auto-generated method stub
		System.out.println("BoardDao.list()");
		return sqlSessionTemplate.selectList("dao.Board.list", obj);
	}
	// 글보기 - 글수정
	public Object view(Object obj) {
		System.out.println("BoardDao.view()");
		return sqlSessionTemplate.selectOne("dao.Board.view", obj);
	}
	
	// 글쓰기
	public Object write(Board board) {
		System.out.println("BoardDao.write()");
		return sqlSessionTemplate.insert("dao.Board.write", board);
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
	
	// 총 글의 갯수
	public int totalRow() {
		// TODO Auto-generated method stub
		System.out.println("BoardDao.totalRow()");
		return sqlSessionTemplate.selectOne("dao.Board.totalCount");
		
	}
	// 조회수 증가 
	public void hitUp(Object obj) {
		// TODO Auto-generated method stub
		System.out.println("BoardDao.hitUp()");
		sqlSessionTemplate.update("dao.Board.hitUp", obj);
	}
	
	// 회원 체크인 유무 변경
	public Object myReviewDeleteUpdateService(Object obj) {
		// TODO Auto-generated method stub
		System.out.println("BoardDao.update()");
		return sqlSessionTemplate.update("dao.Board.myReviewDeleteUpdate", obj);
		
	}
	
}
