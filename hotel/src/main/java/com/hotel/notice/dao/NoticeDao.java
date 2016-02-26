package com.hotel.notice.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.hotel.notice.model.Notice;

public class NoticeDao {
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	// 글리스트
	public Object list(Object obj) {
		// TODO Auto-generated method stub
		System.out.println("NoticeDao.list()");
		return sqlSessionTemplate.selectList("dao.Notice.list", obj);
	}

	// 글보기 - 글수정
	public Object view(Object obj) {
		System.out.println("NoticeDao.view()");
		return sqlSessionTemplate.selectOne("dao.Notice.view", obj);
	}

	// 글쓰기
	public Object write(Notice notice) {
		System.out.println("NoticeDao.write()");
		return sqlSessionTemplate.insert("dao.Notice.write", notice);
	}

	// 글수정처리
	public Object update(Notice notice) {
		System.out.println("NoticeDao.update()");
		return sqlSessionTemplate.update("dao.Notice.update", notice);
	}

	// 글삭제
	public Object delete(Object obj) {
		System.out.println("NoticeDao.delete()");
		return sqlSessionTemplate.delete("dao.Notice.delete", obj);
	}

	// 글의 총갯수
	public int totalRow() {
		// TODO Auto-generated method stub
		System.out.println("NoticeDao.totalRow()");
		return sqlSessionTemplate.selectOne("dao.Notice.totalCount");

	}

}
