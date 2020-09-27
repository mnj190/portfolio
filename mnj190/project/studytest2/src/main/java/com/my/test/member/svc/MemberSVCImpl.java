package com.my.test.member.svc;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.my.test.member.dao.MemberDAO;
import com.my.test.member.vo.MemberVO;

@Repository
public class MemberSVCImpl implements MemberSVC {

	@Inject
	MemberDAO memberDAO;

//	ȸ������
	@Override
	public int signup(MemberVO memberVO) {

		return memberDAO.signup(memberVO);
	}

//	�α���
	@Override
	public MemberVO login(String id, String pw) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pw", pw);

		return memberDAO.login(map);
	}

//	���̵� üũ
	@Override
	public MemberVO id_check(String id) {
		// TODO Auto-generated method stub
		return memberDAO.id_check(id);
	}
}
