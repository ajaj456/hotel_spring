package com.hotel.reply.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.hotel.reply.model.Reply;

public class ReplyDao {
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	private SqlSessionTemplate sqlSessionTemplate;

	public Object list(Object obj) {
		System.out.println(obj);
		return sqlSessionTemplate.selectList("dao.Reply.list", obj);
	}

	public Object view(Reply reply) {
		return sqlSessionTemplate.selectOne("dao.Reply.view", reply);
	}

	public Object write(Reply reply) {
		System.out.println(reply);
		return sqlSessionTemplate.insert("dao.Reply.write", reply);
	}

	public Object update(Reply reply) {
		return sqlSessionTemplate.update("dao.Reply.update", reply);
	}

	public Object delete(Reply reply) {
		return sqlSessionTemplate.delete("dao.Reply.delete", reply);
	}

	
	// 총 글의 갯수
	public int totalRow(Reply reply) {
		// TODO Auto-generated method stub
		System.out.println("ReplyDao.totalRow()");
		return sqlSessionTemplate.selectOne("dao.Reply.totalCount", reply);
		
	}

}
