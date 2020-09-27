package com.my.test.member;

import javax.inject.Inject;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.my.test.member.dao.MemberDAO;
import com.my.test.member.vo.MemberVO;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/*.xml" })
public class MemberDAOImplTest {

	private static final Logger logger = LoggerFactory.getLogger(MemberDAOImplTest.class);

	@Inject
	MemberDAO memberDAO;

	@Test
	@DisplayName("회원가입")
	@Disabled
	void signup() {
		MemberVO memberVO = new MemberVO();
		memberVO.setEmail("mnj190@naver.com");
		memberVO.setId("mnj190");
		memberVO.setPw("1234");
		memberVO.setName("조정민");
		memberDAO.signup(memberVO);
	}
	
	@Test
	@DisplayName("아이디 체크")
	void id_check() {
		String id = "mnj1922";
		logger.info(memberDAO.id_check(id).toString());
	}
}
