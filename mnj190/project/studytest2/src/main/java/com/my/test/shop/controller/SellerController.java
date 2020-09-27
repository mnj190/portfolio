package com.my.test.shop.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
	public String modification(@RequestBody ProductVO param) throws Exception {

		shopSVC.registration(param);

		List<OptionVO> option = param.getOptionVO();

		logger.info(option.toString());
		logger.info(param.getProd_num());

		return null;
	}
}
