package com.my.test.member.dao;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.my.test.member.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	SqlSession sqlsession;

//	회원가입
	@Override
	public int signup(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return sqlsession.insert("mappers.MemberDAO-mapper.signup", memberVO);
	}

//	로그인 및 회원 검색	
	@Override
	public MemberVO login(Map<String, String> map) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("mappers.MemberDAO-mapper.login", map);
	}

//	아이디 체크
	@Override
	public MemberVO id_check(String id) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("mappers.MemberDAO-mapper.id_check", id);
	}
}
