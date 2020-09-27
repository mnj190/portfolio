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

//	ȸ������
	@Override
	public int signup(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return sqlsession.insert("mappers.MemberDAO-mapper.signup", memberVO);
	}

//	�α���
	@Override
	public MemberVO login(Map<String, String> map) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("mappers.MemberDAO-mapper.login", map);
	}

//	���̵� üũ
	@Override
	public MemberVO id_check(String id) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("mappers.MemberDAO-mapper.id_check", id);
	}
}
