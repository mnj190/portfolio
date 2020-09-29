package com.my.test.shop;

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
//	@Disabled
	void seachSubCategory() {
		String cate_num = "2";
		logger.info(shopDAO.seachSubCategory(cate_num).toString());
	}
}
