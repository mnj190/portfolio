package com.my.test.shop.svc;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.my.test.shop.dao.ShopDAO;
import com.my.test.shop.vo.CategoryVO;
import com.my.test.shop.vo.ProductVO;

@Repository
public class ShopSVCImpl implements ShopSVC {

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

//	서브 카테고리 서치
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
}
