package com.hotel.member.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.hotel.member.model.Member;

public class MemberDao {

	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	// 회원가입
	public Object join(Member obj) {
		return null;
	}

	// 회원탈퇴
	public Object delete(Member obj) {
		return null;
	}

	// 회원정보보기
	public Object view(Object obj) {
		return null;
	}

	// 회원정보수정
	public Object update(Member obj) {
		return null;
	}

	// 비밀번호수정
	public Object pwUpdate(Member obj) {
		return null;
	}

	// 아이디찾기
	public Object findId(Member obj) {
		return null;
	}

	// 비밀번호찾기
	public Object findPw(Member obj) {
		return null;
	}

	// 회원리스트
	public Object list() {
		return null;
	}

	// 회원등급변경
	public Object grade(Member obj) {
		return null;
	}

	// 로그인
	public Object login(Member obj) {
		return null;
	}

}
