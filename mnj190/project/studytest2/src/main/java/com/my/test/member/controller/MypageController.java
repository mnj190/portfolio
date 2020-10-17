package com.my.test.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.test.common.paging.Paging;
import com.my.test.member.svc.MemberSVC;
import com.my.test.member.vo.MemberVO;
import com.my.test.shop.vo.OptionVO;
import com.my.test.shop.vo.ReviewVO;

@Controller
@RequestMapping(value = "/mypage")
public class MypageController {
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);

	@Inject
	MemberSVC memberSVC;

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

	@RequestMapping(value = "/myorders")
	public String getMyOrders(HttpSession session, @RequestParam(defaultValue = "7") String term,
			@RequestParam(defaultValue = "1") String page, Model model) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		Map<String, String> map = new HashMap<String, String>();
		map.put("ucode", member.getUcode());
		map.put("term", term);

		Paging paging = new Paging();
		paging.setTotalRec(memberSVC.getTotalOrders(map));
		paging.setRecNumPerPage(10);
		paging.setReqPage(Integer.valueOf(page));
		paging.setPageNumPerPage(10);
		paging.calculatefinalEndPage();

		model.addAttribute("request", "orderlist");
		model.addAttribute("term", term);
		model.addAttribute("paging", paging);
		model.addAttribute("orders", memberSVC.getMyOrders(String.valueOf(paging.getStr_num()),
				String.valueOf(paging.getEnd_num()), member.getUcode(), term));

		logger.info(memberSVC.getMyOrders(String.valueOf(paging.getStr_num()), String.valueOf(paging.getEnd_num()),
				member.getUcode(), term).toString());

		return "/mypage/mypage_home";
	}

	@GetMapping(value = "/reviewFrm")
	public String reviewFrm(@RequestParam String num, @RequestParam String orders, Model model) {
		model.addAttribute("num", num);
		model.addAttribute("orders", orders);

		return "/mypage/review_Frm";
	}

	@ResponseBody
	@RequestMapping(value = "setReviewFrm", produces = "application/json")
	public String setReviewFrm(@RequestBody ReviewVO review, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		review.setReview_writer(member.getUcode());

		memberSVC.setReview(review);

		return "success";
	}

}