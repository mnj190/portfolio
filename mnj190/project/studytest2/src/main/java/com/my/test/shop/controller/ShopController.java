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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.test.common.paging.Paging;
import com.my.test.shop.svc.ShopSVC;
import com.my.test.shop.vo.CategoryVO;
import com.my.test.shop.vo.OptionVO;
import com.my.test.shop.vo.ProductVO;

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

		res = new ResponseEntity<Map<String, List<CategoryVO>>>(map, HttpStatus.OK);

		return res;
	}

	@RequestMapping(value = "")
	public String Shop(@RequestParam String cate, @RequestParam String type, @RequestParam String page, Model model) {
		Paging paging = new Paging();
		paging.setTotalRec(shopSVC.getTotolProd(cate));
		paging.setRecNumPerPage(15);
		paging.setReqPage(Integer.valueOf(page));
		paging.setPageNumPerPage(10);
		paging.calculatefinalEndPage();

		List<ProductVO> products = shopSVC.getProductList(cate, page, String.valueOf(paging.getStr_num()),
				String.valueOf(paging.getEnd_num()));

		model.addAttribute("products", products);
		model.addAttribute("paging", paging);
		model.addAttribute("cate", cate);
		model.addAttribute("type", type);
		model.addAttribute("page", page);

		return "/shop/category";
	}

	@RequestMapping(value = "product")
	public String product_view(@RequestParam String num, Model model) {
		logger.info("상품 호출됨");
		logger.info(num);

		ProductVO product = shopSVC.getProduct(num);

		model.addAttribute("product", product);
		model.addAttribute("op_names", shopSVC.getOp_names(num));
		model.addAttribute("op_dep1_values", shopSVC.getOp_dep1_value(num));

		logger.info(product.toString());
		logger.info(shopSVC.getOp_names(num).toString());
		logger.info(shopSVC.getOp_dep1_value(num).toString());

		if (product.getProd_option().equals("A"))
			model.addAttribute("op_options", shopSVC.getOptions1(num));

		return "/shop/product";
	}

	@ResponseBody
	@RequestMapping(value = "/getOptions2", produces = "application/json")
	public List<ProductVO> getOptions2(@RequestBody OptionVO option, Model model) {
		List<ProductVO> res = shopSVC.getOptions2(option);

		logger.info("호출");
		logger.info(option.toString());
		logger.info(res.toString());

		return res;
	}
}
