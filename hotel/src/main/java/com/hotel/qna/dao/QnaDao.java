package com.hotel.qna.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.hotel.qna.model.Qna;



public class QnaDao {
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	//1글리스트
	public Object list() {
		// TODO Auto-generated method stub
		System.out.println("QnaDao.list()");
		return sqlSessionTemplate.selectList("dao.Qna.list");
	} 
//2글보기-글수정

	public Object update(Object obj) {
		// TODO Auto-generated method stub
		System.out.println("QnaDao.view()");
		return sqlSessionTemplate.selectOne("dao.Qna.view", obj);
		
	}
//3답변
	public Object reply(Qna qna) {
		// TODO Auto-generated method stub
		System.out.println("QnaDao.reply()");
		return sqlSessionTemplate.insert("dao.Qna.reply",qna);
	}
//4글삭제
	public Object delete(Object obj) {
		// TODO Auto-generated method stub
		System.out.println("QnaDao.delete()");
		return sqlSessionTemplate.delete("dao.Qna.delete",obj);
		
	}
//5글보기
	public Object view(Object obj) {
		// TODO Auto-generated method stub
		System.out.println("QnaDao.delete()");
		return sqlSessionTemplate.selectOne("dao.Qna.view", obj);
	}

}
