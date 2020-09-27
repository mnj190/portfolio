package com.my.test.shop.svc;

import java.util.List;
import java.util.Map;

import com.my.test.shop.vo.CategoryVO;
import com.my.test.shop.vo.ProductVO;

public interface ShopSVC {
//	ī�װ� ��������
	public List<CategoryVO> getCategory();

//	���� ī�װ� ��������
	public List<CategoryVO> getSubCategory();

// 	��ũ ī�װ� ��ġ
	public List<CategoryVO> seachSubCategory(String cate_num);

//	��ǰ ����
	public int registration(ProductVO product);
}
