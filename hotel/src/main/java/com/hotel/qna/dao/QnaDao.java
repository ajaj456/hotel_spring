package com.hotel.qna.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.hotel.common.model.JspData;
import com.hotel.qna.model.Qna;

public class QnaDao {
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	// 1글리스트
	public Object list(Object obj) {
		// TODO Auto-generated method stub
		System.out.println("QnaDao.list()");
		return sqlSessionTemplate.selectList("dao.Qna.list", obj);
	}
	// 2글보기-글수정

	public Object update(Object obj) {
		// TODO Auto-generated method stub
		System.out.println("QnaDao.view()");
		return sqlSessionTemplate.selectOne("dao.Qna.view", obj);

	}
	// 글수정처리
		public Object update(Qna qna) {
			System.out.println("QnaDao.update()");
			System.out.println(qna);
			return sqlSessionTemplate.update("dao.Qna.update", qna);
		}

	// 3답변
	public Object reply(Qna qna) {
		// TODO Auto-generated method stub
		System.out.println("QnaDao.reply()");
		return sqlSessionTemplate.insert("dao.Qna.reply", qna);
	}

	// 4글삭제
	public Object delete(Object obj) {
		// TODO Auto-generated method stub
		System.out.println("QnaDao.delete()");
		return sqlSessionTemplate.delete("dao.Qna.delete", obj);

	}

	// 5글보기
	public Object view(Object obj) {
		// TODO Auto-generated method stub
		System.out.println("QnaDao.view()");
		return sqlSessionTemplate.selectOne("dao.Qna.view", obj);
	}

	// 6글쓰기
	public Object write(Qna qna) {
		// TODO Auto-generated method stub
		System.out.println("QnaDao.write()");
		System.out.println(qna);
		return sqlSessionTemplate.insert("dao.Qna.write", qna);
	}
	
	// 총 글의 갯수
	public int totalRow() {
		// TODO Auto-generated method stub
		System.out.println("QnaDao.totalRow()");
		return sqlSessionTemplate.selectOne("dao.Qna.totalRow");
		
	}
	// 조회수 증가 
	public void hitUp(Object obj) {
		// TODO Auto-generated method stub
		System.out.println("QnaDao.hitUp()");
		sqlSessionTemplate.update("dao.Qna.hitUp", obj);
	}
	// 최소 ordNo 구하기
		public Object minOrdNo(Qna qna){
			return sqlSessionTemplate.selectOne("dao.Qna.minOrdNo", qna);
		}
		
		// 최대 ordNo 구하기
		public Object maxOrdNo(Object obj){
			return sqlSessionTemplate.selectOne("dao.Qna.maxOrdNo", obj);
		}
		
		// 부모 글번호 갯수 세기
		public Object countParentNo(Object obj){
			return sqlSessionTemplate.selectOne("dao.Qna.countParentNo", obj);
		}
		
		// 같은 부모를 가진 글 중 가장 높은 ordNo 구하기
		public Object parentMaxOrdNo(Object obj){
			return sqlSessionTemplate.selectOne("dao.Qna.parentMaxOrdNo", obj);
		}
		
		// 밀어낼 글의 levNo 구하기
		public Object nextLevNo(Object obj){
			return sqlSessionTemplate.selectOne("dao.Qna.nextLevNo", obj);
		}
		
		// 밀어낼 글의 levNo가 더 높을 때 밀어낼 글과 같은 부모를 가진 글 중 가장 높은 ordNo 구하기
		public Object nextLevMaxOrdNo(Object obj){
			return sqlSessionTemplate.selectOne("dao.Qna.nextLevMaxOrdNo", obj);
		}
		
		// 같은 refNo를 가지고 ordNo가 큰 글들에 ordNo + 1 해주기
		public void ordNoIncrease(Qna qna){
			sqlSessionTemplate.update("dao.Qna.ordNoIncrease", qna);
		}
}
