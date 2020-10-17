package com.my.test.member.svc;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import com.my.test.member.vo.MemberVO;
import com.my.test.shop.vo.OrdersVO;
import com.my.test.shop.vo.ReviewVO;

public interface MemberSVC {
//	회원가입
	public int signup(MemberVO memberVO);

//	로그인
	public MemberVO login(String id, String pw);

//	아이디 체크
	public MemberVO id_check(String id);

//	자동 로그인
	public int keepLogin(String id, String sessionId, Date age);

//	자동 로그인 확인
	public MemberVO checkUserWithSessionKey(String sessionId);

//	주문 내역 가져오기
	public List<OrdersVO> getMyOrders(String str_num, String end_num, String ucode, String term);

//	총 주문 내역 수 가져오기 
	public int getTotalOrders(Map<String, String> map);
	
//	구매 후기 작성
	public int setReview(ReviewVO review);
}
