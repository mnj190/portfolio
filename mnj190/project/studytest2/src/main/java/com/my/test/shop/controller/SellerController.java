package com.my.test.shop.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.test.member.vo.MemberVO;
import com.my.test.shop.svc.ShopSVC;
import com.my.test.shop.vo.CategoryVO;
import com.my.test.shop.vo.OptionVO;
import com.my.test.shop.vo.ProductVO;

@Controller
@RequestMapping(value = "/seller")
public class SellerController {
	private static final Logger logger = LoggerFactory.getLogger(SellerController.class);

	@Inject
	ShopSVC shopSVC;

	@GetMapping(value = "")
	public String getSeller() {
		return "/seller/seller_home";
	}

	@GetMapping(value = "registrationFrm")
	public String getRegistrationFrm(Model model) {
		model.addAttribute("category", shopSVC.getCategory());

		return "/seller/seller_home";
	}

	@ResponseBody
	@RequestMapping(value = "seachSubCategory", produces = "application/json")
	public List<CategoryVO> seachSubCategory(@RequestBody String cate_num) {
		shopSVC.seachSubCategory(cate_num);

		logger.info(shopSVC.seachSubCategory(cate_num).toString());

		return shopSVC.seachSubCategory(cate_num);
	}

	@ResponseBody
	@RequestMapping(value = "/registration", produces = "application/json")
	public String modification(HttpSession session, @RequestBody ProductVO param) throws Exception {
		MemberVO member = (MemberVO) session.getAttribute("member");
		param.setUcode(member.getUcode());
		shopSVC.registration(param);

		logger.info(param.getProd_option());

		if (!param.getProd_option().equals("f")) {
			logger.info("옵션 입력");
			List<OptionVO> options = param.getOptionVO();
			for (OptionVO option : options) {
				option.setProd_num(param.getProd_num());
				shopSVC.setOption(option);
			}
		}

		logger.info(param.getProd_num());

		return null;
	}
}
