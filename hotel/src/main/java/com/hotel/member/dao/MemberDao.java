package com.hotel.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import com.hotel.member.model.Member;

public class MemberDao {

	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	// 회원가입
	public Object join(Member member) {
		System.out.println(member);
		sqlSessionTemplate.insert("dao.Member.join", member);
		return null;
	}

	// 회원탈퇴
	public Object delete(Member member) {
		sqlSessionTemplate.delete("dao.Member.delete", member);
		return null;
	}

	// 회원정보보기
	public Object view(Object obj) {
		return sqlSessionTemplate.selectOne("dao.Member.view", obj);
	}

	// 회원정보수정
	public Object update(Member member) {
		sqlSessionTemplate.update("dao.Member.update", member);
		return null;
	}

	// 비밀번호수변경
	public Object pwUpdate(Member member) {
		sqlSessionTemplate.update("dao.Member.pwUpdate", member);
		return null;
	}

	// 아이디찾기
	public Object findId(Member member) {
		return sqlSessionTemplate.selectOne("dao.Member.findId", member);
	}

	// 비밀번호찾기
	public Object findPw(Member member) {
		return sqlSessionTemplate.selectOne("dao.Member.findPw", member);
	}

	// 회원리스트
	public Object list() {
		return sqlSessionTemplate.selectList("dao.Member.list");
	}

	// 회원등급변경
	public Object grade(Member member) {
		sqlSessionTemplate.update("dao.Member.gradeUpdate", member);
		return null;
	}

	// 로그인
	public Object login(Member member) {
		return sqlSessionTemplate.selectOne("dao.Member.login", member);
	}

}
