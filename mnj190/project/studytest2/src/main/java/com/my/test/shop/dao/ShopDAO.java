package com.my.test.shop.dao;

import java.util.List;

import com.my.test.shop.vo.CategoryVO;
import com.my.test.shop.vo.ProductVO;

public interface ShopDAO {
//	ī�װ� ��������
	public List<CategoryVO> getCategory();

//	���� ī�װ� ��������
	public List<CategoryVO> getSubCategory();

// 	��ũ ī�װ� ��ġ
	public List<CategoryVO> seachSubCategory(String cate_num);
	
//	��ǰ ����
	public int registration(ProductVO product);
}
