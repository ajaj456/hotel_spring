package com.hotel.qna.dao;

import org.mybatis.spring.SqlSessionTemplate;

public class QnaDao {
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	} 

}
