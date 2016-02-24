package com.hotel.reply.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.hotel.reply.model.Reply;

public class ReplyDao {
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	private SqlSessionTemplate sqlSessionTemplate;


	public Object list() {
		// TODO Auto-generated method stub
		return null;
	}
	
	public Object view(Object obj) {
		// TODO Auto-generated method stub
		return null;
	}

	public Object write(Reply obj) {
		// TODO Auto-generated method stub
		return null;
	}

	public void update(Reply obj) {
		// TODO Auto-generated method stub
		
	}

	public void delete(Object obj) {
		// TODO Auto-generated method stub
		
	}


}
