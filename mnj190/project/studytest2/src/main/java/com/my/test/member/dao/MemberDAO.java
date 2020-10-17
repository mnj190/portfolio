package com.my.test.member.dao;

import java.util.List;
import java.util.Map;

import com.my.test.member.vo.MemberVO;
import com.my.test.shop.vo.OrdersVO;
import com.my.test.shop.vo.ReviewVO;

public interface MemberDAO {
//	회원가입
	public int signup(MemberVO memberVO);

//	로그인 및 회원 검색
	public MemberVO login(Map<String, String> map);

//	아이디 체크
	public MemberVO id_check(String id);

// 자동 로그인 등록
	public int keepLogin(Map<String, Object> map);

// 자동 로그인 확인
	public MemberVO checkUserWithSessionKey(String sessionId);

//	주문 내역 가져오기
	public List<OrdersVO> getMyOrders(Map<String, String> map);

//	총 주문 내역 수 가져오기 
	public int getTotalOrders(Map<String, String> map);

//	구매 후기 작성
	public int setReview(ReviewVO review);
}
