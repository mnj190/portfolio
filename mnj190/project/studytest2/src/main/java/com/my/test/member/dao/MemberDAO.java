package com.my.test.member.dao;

import java.util.Map;

import com.my.test.member.vo.MemberVO;

public interface MemberDAO {
//	ȸ������
	public int signup(MemberVO memberVO);
	
//	�α��� �� ȸ�� �˻�	
	public MemberVO login(Map<String, String> map);
	
//	���̵� üũ
	public MemberVO id_check(String id);
	
}
