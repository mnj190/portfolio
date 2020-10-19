package com.my.test.shop;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.my.test.shop.dao.ShopDAO;
import com.my.test.shop.vo.ProductVO;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/*.xml" })
public class ShopDAOImplTest {

	private static final Logger logger = LoggerFactory.getLogger(ShopDAOImplTest.class);

	@Inject
	ShopDAO shopDAO;

	@Test
	@DisplayName("카테고리 가져오기")
	@Disabled
	void signup() {
		logger.info(shopDAO.getCategory().toString());
		logger.info(shopDAO.getSubCategory().toString());
	}

	@Test
	@DisplayName("서브 카테고리 서치")
	@Disabled
	void seachSubCategory() {
		String cate_num = "2";
		logger.info(shopDAO.seachSubCategory(cate_num).toString());
	}

	@Test
	@DisplayName("총 상품 수")
	@Disabled
	void getTotalProd() {
		String cate = "8";
		logger.info(String.valueOf(shopDAO.getTotolProd(cate)));
	}

	@Test
	@DisplayName("상품 목록 가져오기")
//	@Disabled
	void getProducts() {
		Map<String, String> map = new HashMap<String, String>();
		map.put("str_num", "1");
		map.put("end_num", "9");
		logger.info("실행됨");
		List<ProductVO> xxx = shopDAO.getProducts(map);
		logger.info(xxx.toString());
	}

	@Test
	@DisplayName("상품 가져오기")
	@Disabled
	void getProduct() {
		String num = "109";
		logger.info("실행됨");
		ProductVO xxx = shopDAO.getProduct(num);
		logger.info(xxx.toString());
	}
	
	
}
