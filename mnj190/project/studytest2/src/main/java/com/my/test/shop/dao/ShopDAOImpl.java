package com.my.test.shop.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.my.test.shop.vo.CategoryVO;
import com.my.test.shop.vo.OptionVO;
import com.my.test.shop.vo.ProductVO;

@Repository
public class ShopDAOImpl implements ShopDAO {

	@Inject
	SqlSession sqlsession;

//	카테고리 가져오기
	@Override
	public List<CategoryVO> getCategory() {
		// TODO Auto-generated method stub
		return sqlsession.selectList("mappers.ShopDAO-mapper.getCategory");
	}

//	서브	카테고리 가져오기
	@Override
	public List<CategoryVO> getSubCategory() {
		// TODO Auto-generated method stub
		return sqlsession.selectList("mappers.ShopDAO-mapper.getSubCategory");
	}

//	서크 카테고리 서치
	@Override
	public List<CategoryVO> seachSubCategory(String cate_num) {
		// TODO Auto-generated method stub
		return sqlsession.selectList("mappers.ShopDAO-mapper.seachSubCategory", cate_num);
	}

//	상품 저장
	@Override
	public int registration(ProductVO product) {
		// TODO Auto-generated method stub
		return sqlsession.insert("mappers.ShopDAO-mapper.registration", product);
	}

//	옵션 저장
	public int setOption(OptionVO option) {
		// TODO Auto-generated method stub
		return sqlsession.insert("mappers.ShopDAO-mapper.setOption", option);
	}
}
