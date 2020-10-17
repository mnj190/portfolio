package com.my.test.member.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.my.test.member.vo.MemberVO;
import com.my.test.shop.vo.OrdersVO;
import com.my.test.shop.vo.ReviewVO;

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

//	자동 로그인
	@Override
	public int keepLogin(Map<String, Object> map) {

		return sqlsession.update("mappers.MemberDAO-mapper.keepLogin", map);
	}

//	자동 로그인 확인	
	@Override
	public MemberVO checkUserWithSessionKey(String sessionId) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("mappers.MemberDAO-mapper.checkUserWithSessionKey", sessionId);
	}

//	주문 내역 가져오기
	@Override
	public List<OrdersVO> getMyOrders(Map<String, String> map) {
		// TODO Auto-generated method stub
		return sqlsession.selectList("mappers.MemberDAO-mapper.getMyOrders", map);
	}

//	총 주문 내역 수 가져오기 
	@Override
	public int getTotalOrders(Map<String, String> map) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("mappers.MemberDAO-mapper.getTotalOrders", map);

	}

//	구매 후기 작성
	@Override
	public int setReview(ReviewVO review) {
		// TODO Auto-generated method stub
		return sqlsession.insert("mappers.MemberDAO-mapper.setReview", review);
	}
}
