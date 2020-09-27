package com.my.test.shop.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.my.test.shop.vo.CategoryVO;
import com.my.test.shop.vo.ProductVO;

@Repository
public class ShopDAOImpl implements ShopDAO {

	@Inject
	SqlSession sqlsession;

//	ī�װ� ��������
	@Override
	public List<CategoryVO> getCategory() {
		// TODO Auto-generated method stub
		return sqlsession.selectList("mappers.ShopDAO-mapper.getCategory");
	}

//	���� ī�װ� ��������
	@Override
	public List<CategoryVO> getSubCategory() {
		// TODO Auto-generated method stub
		return sqlsession.selectList("mappers.ShopDAO-mapper.getSubCategory");
	}

//	���� ī�װ� ��ġ
	@Override
	public List<CategoryVO> seachSubCategory(String cate_num) {
		// TODO Auto-generated method stub
		return sqlsession.selectList("mappers.ShopDAO-mapper.seachSubCategory", cate_num);
	}

//	��ǰ ����
	@Override
	public int registration(ProductVO product) {
		// TODO Auto-generated method stub
		return sqlsession.insert("mappers.ShopDAO-mapper.registration", product);
	}

}
