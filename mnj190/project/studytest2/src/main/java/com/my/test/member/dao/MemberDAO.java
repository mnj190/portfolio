package com.my.test.member.dao;

import java.util.Map;

import com.my.test.member.vo.MemberVO;

public interface MemberDAO {
//	회원가입
	public int signup(MemberVO memberVO);
	
//	로그인 및 회원 검색
	public MemberVO login(Map<String, String> map);
	
//	아이디 체크
	public MemberVO id_check(String id);
	
}
