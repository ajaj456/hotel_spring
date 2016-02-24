package com.hotel.reply.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.hotel.reply.model.Reply;

public class ReplyDao {
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	private SqlSessionTemplate sqlSessionTemplate;

	public Object list() {
		return sqlSessionTemplate.selectList("dao.Reply.list");
	}

	public Object view(Object obj) {
		return sqlSessionTemplate.selectOne("dao.Reply.view", obj);
	}

	public Object write(Reply reply) {
		return sqlSessionTemplate.insert("dao.Reply.write", reply);
	}

	public Object update(Reply reply) {
		return sqlSessionTemplate.update("dao.Reply.update", reply);
	}

	public Object delete(Object obj) {
		return sqlSessionTemplate.delete("dao.Reply.delete", obj);
	}

}
