package com.my.test.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/mypage")
public class MypageController {
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);

	@GetMapping(value = "")
	public String getMypage(Model model) {

		model.addAttribute("request", "");
		return "/mypage/mypage_home";
	}

	@GetMapping(value = "/modificationFrm")
	public String getModificationFrm(Model model) {
		model.addAttribute("request", "modification");
		return "/mypage/mypage_home";
	}

	@GetMapping(value = "/orderlist")
	public String getOderList(Model model) {
		model.addAttribute("request", "orderlist");
		return "/mypage/mypage_home";
	}

}