package com.my.test.member.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.test.member.svc.MemberSVC;
import com.my.test.member.vo.MemberVO;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Inject
	MemberSVC memberSVC;

	@RequestMapping(value = "/loginFrm")
	public String loginFrm() {

		return "member/loginFrm";
	}

	@RequestMapping(value = "/login")
	public String login(@RequestParam String id, @RequestParam String pw, HttpSession session, Model model) {

		logger.info(id);
		logger.info(pw);

		if (memberSVC.id_check(id) == null) {
			model.addAttribute("err_msg", "존재하지 않는 아이디입니다");

			return "member/loginFrm";
		} else {
			MemberVO memberVO = new MemberVO();
			memberVO = memberSVC.id_check(id);

			if (memberVO.getPw().equals(pw)) {
				session.setAttribute("member", memberVO);

			} else {
				model.addAttribute("err_msg", "비밀번호가 일치하지 않습니다.");

				return "member/loginFrm";
			}
		}

		return "home";
	}

	@RequestMapping(value = "/signupFrm")
	public String signupFrm() {

		return "member/signupFrm";
	}

	@ResponseBody
	@RequestMapping(value = "/id_check")
	public String id_check(@RequestBody String id) {
		if (memberSVC.id_check(id) == null) {
			return null;
		} else {
			return "duplicate";
		}
	}

	@RequestMapping(value = "/signup")
	public String signup(@ModelAttribute MemberVO memberVO) {
		logger.info(memberVO.toString());
		memberSVC.signup(memberVO);

		return "member/signupFrm";
	}

	@RequestMapping(value = "/logout")
	public String signup(HttpSession session) {
		session.invalidate();

		return "home";
	}
}
