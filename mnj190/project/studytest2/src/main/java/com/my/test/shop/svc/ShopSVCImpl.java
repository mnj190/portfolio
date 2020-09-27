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

//	ī�װ� ��������
	@Override
	public List<CategoryVO> getCategory() {

		return shopDAO.getCategory();
	};

	@Override
//	���� ī�װ� ��������
	public List<CategoryVO> getSubCategory() {

		return shopDAO.getSubCategory();
	};

//	���� ī�װ� ��ġ
	@Override
	public List<CategoryVO> seachSubCategory(String cate_num) {
		// TODO Auto-generated method stub
		return shopDAO.seachSubCategory(cate_num);
	}

//	��ǰ ����
	@Override
	public int registration(ProductVO product) {
		// TODO Auto-generated method stub
		return shopDAO.registration(product);
	}
}
