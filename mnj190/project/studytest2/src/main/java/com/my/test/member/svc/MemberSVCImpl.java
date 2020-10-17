package com.my.test.member.svc;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.my.test.member.dao.MemberDAO;
import com.my.test.member.vo.MemberVO;
import com.my.test.shop.vo.OrdersVO;
import com.my.test.shop.vo.ReviewVO;

@Repository
public class MemberSVCImpl implements MemberSVC {

	@Inject
	MemberDAO memberDAO;

//	회원가입
	@Override
	public int signup(MemberVO memberVO) {

		return memberDAO.signup(memberVO);
	}

//	로그인
	@Override
	public MemberVO login(String id, String pw) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pw", pw);

		return memberDAO.login(map);
	}

//	아이디 체크
	@Override
	public MemberVO id_check(String id) {
		// TODO Auto-generated method stub
		return memberDAO.id_check(id);
	}

//	자동 로그인
	@Override
	public int keepLogin(String id, String sessionId, Date age) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("sessionId", sessionId);
		map.put("age", age);
		return memberDAO.keepLogin(map);
	}

//	자동 로그인 확인
	@Override
	public MemberVO checkUserWithSessionKey(String sessionId) {
		// TODO Auto-generated method stub
		return memberDAO.checkUserWithSessionKey(sessionId);
	}

//	주문 내역 가져오기
	public List<OrdersVO> getMyOrders(String str_num, String end_num, String ucode, String term) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("str_num", str_num);
		map.put("end_num", end_num);
		map.put("ucode", ucode);
		map.put("term", term);

		return memberDAO.getMyOrders(map);
	}

//	총 주문 내역 수 가져오기 
	public int getTotalOrders(Map<String, String> map) {
		// TODO Auto-generated method stub
		return memberDAO.getTotalOrders(map);
	}

//	구매 후기 작성
	@Override
	public int setReview(ReviewVO review) {
		// TODO Auto-generated method stub
		return memberDAO.setReview(review);
	}
}
