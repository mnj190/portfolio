package com.my.test.member.svc;

import java.util.Map;

import com.my.test.member.vo.MemberVO;

public interface MemberSVC {
//	ȸ������
	public int signup(MemberVO memberVO);
	
//	�α��� �� ȸ�� �˻�	
	public MemberVO login(String id, String pw);
	
//	���̵� üũ
	public MemberVO id_check(String id);
}
