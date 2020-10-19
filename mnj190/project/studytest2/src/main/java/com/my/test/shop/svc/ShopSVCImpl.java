package com.my.test.shop.svc;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.my.test.common.paging.Paging;
import com.my.test.shop.controller.ShopController;
import com.my.test.shop.dao.ShopDAO;
import com.my.test.shop.vo.CategoryVO;
import com.my.test.shop.vo.OptionVO;
import com.my.test.shop.vo.Order_detailsVO;
import com.my.test.shop.vo.OrdersVO;
import com.my.test.shop.vo.ProductVO;

@Repository
public class ShopSVCImpl implements ShopSVC {
	private static final Logger logger = LoggerFactory.getLogger(ShopSVCImpl.class);

	@Inject
	ShopDAO shopDAO;

//	카테고리 가져오기
	@Override
	public List<CategoryVO> getCategory() {

		return shopDAO.getCategory();
	};

	@Override
//	서브 카테고리 가져오기
	public List<CategoryVO> getSubCategory() {

		return shopDAO.getSubCategory();
	};

//	서크 카테고리 서치
	@Override
	public List<CategoryVO> seachSubCategory(String cate_num) {
		// TODO Auto-generated method stub
		return shopDAO.seachSubCategory(cate_num);
	}

//	상품 저장
	@Override
	public int registration(ProductVO product) {
		// TODO Auto-generated method stub
		return shopDAO.registration(product);
	}

//	옵션 저장
	public int setOption(OptionVO option) {
		// TODO Auto-generated method stub
		return shopDAO.setOption(option);
	}

//	총 상품 수
	public int getTotolProd(String cate) {

		return shopDAO.getTotolProd(cate);
	}

//	상품 목록
	public List<ProductVO> getProductList(String cate, String page, String getStr_num, String getEnd_num) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("cate", cate);
		map.put("str_num", getStr_num);
		map.put("end_num", getEnd_num);

		return shopDAO.getProducts(map);
	}

//	최신 상품
	public List<ProductVO> getProductList(String type) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("type", type);
		map.put("str_num", "1");
		map.put("end_num", "9");

		return shopDAO.getProducts(map);
	}

//  상품 가져오기
	@Override
	public ProductVO getProduct(String num) {
		// TODO Auto-generated method stub
		return shopDAO.getProduct(num);
	}

//	옵션 이름 가져오기
	@Override
	public List<ProductVO> getOp_names(String num) {
		// TODO Auto-generated method stub
		return shopDAO.getOp_names(num);
	}

//	옵션1 밸류 가져오기
	@Override
	public List<ProductVO> getOp_dep1_value(String num) {
		// TODO Auto-generated method stub
		return shopDAO.getOp_dep1_value(num);
	}

//	옵션1 가져오기
	@Override
	public List<ProductVO> getOptions1(String num) {
		// TODO Auto-generated method stub
		return shopDAO.getOptions1(num);
	}

//	옵션2 가져오기
	@Override
	public List<ProductVO> getOptions2(OptionVO option) {
		// TODO Auto-generated method stub
		return shopDAO.getOptions2(option);
	}

//	주문 등록
	@Override
	public int setOrders(OrdersVO orders) {

		shopDAO.setOrders(orders);
		logger.info(orders.getOrders_num());

		if (!orders.getOrders_option().equals("f")) {
			for (Order_detailsVO details : orders.getOrder_details()) {
				details.setOrders_num(orders.getOrders_num());
				shopDAO.setDetails(details);
			}
		}
		return 0;
	}

}
