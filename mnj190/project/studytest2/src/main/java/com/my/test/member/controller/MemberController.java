package com.my.test.member.controller;

import java.sql.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.util.WebUtils;

import com.my.test.member.svc.MemberSVC;
import com.my.test.member.vo.MemberVO;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Inject
	MemberSVC memberSVC;

	@RequestMapping(value = "/loginFrm")
	public String loginFrm(@RequestParam(value = "reqURI", required = false) String reqURI, Model model) {

		model.addAttribute("reqURI", reqURI);
		return "member/loginFrm";
	}

	@RequestMapping(value = "/login")
	public String login(@RequestParam String id, @RequestParam String pw,
			@RequestParam(required = false) boolean auto_login, @RequestParam String reqURI, HttpSession session,
			Model model, HttpServletResponse response) {

		logger.info(id);
		logger.info(pw);
		logger.info(reqURI);

		if (memberSVC.id_check(id) == null) {
			model.addAttribute("err_msg", "존재하지 않는 아이디입니다");
			model.addAttribute("reqURI", reqURI);

			return "member/loginFrm";
		} else {
			MemberVO memberVO = new MemberVO();
			memberVO = memberSVC.id_check(id);

			if (memberVO.getPw().equals(pw)) {
				session.setAttribute("member", memberVO);

				if (auto_login == true) {
					Cookie cookie = new Cookie("loginCookie", session.getId());
					cookie.setPath("/");
					int amount = 60 * 60 * 24 * 7;
					cookie.setMaxAge(amount);
					response.addCookie(cookie);
					Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));
					memberSVC.keepLogin(memberVO.getId(), session.getId(), sessionLimit);

					logger.info("쿠키 생성");
				}

			} else {
				model.addAttribute("err_msg", "비밀번호가 일치하지 않습니다.");
				model.addAttribute("reqURI", reqURI);

				return "member/loginFrm";
			}
		}

		return "redirect:/" + reqURI;
	}

	@RequestMapping(value = "/signupFrm")
	public String signupFrm() {

		return "/member/signupFrm";
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

		return "redirect:/";
	}

	@RequestMapping(value = "/logout")
	public String signup(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		MemberVO member = (MemberVO) session.getAttribute("member");

		// 쿠기 확인
		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");

		if (loginCookie != null) {
			// null이 아니면 존재하면!
			loginCookie.setPath("/");
			// 쿠키는 없앨 때 유효시간을 0으로 설정하는 것 !!! invalidate같은거 없음.
			loginCookie.setMaxAge(0);
			// 쿠키 설정을 적용한다.
			response.addCookie(loginCookie);

			// 사용자 테이블에서도 유효기간을 현재시간으로 다시 세팅해줘야함.
			Date date = new Date(System.currentTimeMillis());
			memberSVC.keepLogin(member.getId(), session.getId(), date);
		}

		session.invalidate();

		return "redirect:/";
	}

	@RequestMapping(value = "/seccess")
	public String seccess() {

		return "/layout/seccess";
	}
}
