package com.my.test.shop.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.my.test.shop.svc.ShopSVC;
import com.my.test.shop.vo.CategoryVO;

@Controller
@RequestMapping(value = "/shop")
public class ShopController {

	private static final Logger logger = LoggerFactory.getLogger(ShopController.class);

	@Inject
	ShopSVC shopSVC;

	@RequestMapping(value = "/getCategory", produces = "application/json")
	public ResponseEntity<Map<String, List<CategoryVO>>> getCategory(Model model) {
		ResponseEntity<Map<String, List<CategoryVO>>> res = null;
		Map<String, List<CategoryVO>> map = new HashMap<String, List<CategoryVO>>();
		map.put("category", shopSVC.getCategory());
		map.put("subcategory", shopSVC.getSubCategory());

		res = new ResponseEntity<Map<String, List<CategoryVO>>>(map, HttpStatus.OK); // 200
	
		return res;
	}

}
