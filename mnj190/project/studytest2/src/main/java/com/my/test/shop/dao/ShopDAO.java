package com.my.test.shop.dao;

import java.util.List;

import com.my.test.shop.vo.CategoryVO;
import com.my.test.shop.vo.ProductVO;

public interface ShopDAO {
//	카테고리 가져오기
	public List<CategoryVO> getCategory();

//	서브 카테고리 가져오기
	public List<CategoryVO> getSubCategory();

// 	서크 카테고리 서치
	public List<CategoryVO> seachSubCategory(String cate_num);
	
//	상품 저장
	public int registration(ProductVO product);
}
