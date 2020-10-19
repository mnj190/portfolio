package com.my.test;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.my.test.shop.svc.ShopSVC;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Inject
	ShopSVC shopSVC;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {

		logger.info(shopSVC.getProductList(null).toString());
		model.addAttribute("resent", shopSVC.getProductList(null));
		model.addAttribute("hot_item", shopSVC.getProductList("hot_item"));
		model.addAttribute("best_review", shopSVC.getProductList("best_review"));
		
		return "home";
	}

}
