package com.my.test.member.svc;

import java.util.Map;

import com.my.test.member.vo.MemberVO;

public interface MemberSVC {
//	회원가입
	public int signup(MemberVO memberVO);
	
//	로그인
	public MemberVO login(String id, String pw);
	
//	아이디 체크
	public MemberVO id_check(String id);
}
