package com.my.test.shop.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.my.test.shop.vo.CategoryVO;
import com.my.test.shop.vo.OptionVO;
import com.my.test.shop.vo.Order_detailsVO;
import com.my.test.shop.vo.OrdersVO;
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

//	카테고리별 상품 수
	public int getTotolProd(String cate) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("mappers.ShopDAO-mapper.getTotolProd", cate);
	}

//  카테고리 상품 리스트
	@Override
	public List<ProductVO> getProducts(Map<String, String> map) {
		// TODO Auto-generated method stub
		return sqlsession.selectList("mappers.ShopDAO-mapper.getProducts", map);
	}

//  상품 가져오기
	@Override
	public ProductVO getProduct(String num) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("mappers.ShopDAO-mapper.getProduct", num);
	}

//	옵션 이름 가져오기
	@Override
	public List<ProductVO> getOp_names(String num) {
		// TODO Auto-generated method stub
		return sqlsession.selectList("mappers.ShopDAO-mapper.getOp_names", num);
	}

//	옵션1 밸류 가져오기
	@Override
	public List<ProductVO> getOp_dep1_value(String num) {
		// TODO Auto-generated method stub
		return sqlsession.selectList("mappers.ShopDAO-mapper.getOp_dep1_value", num);
	}

//	옵션1 가져오기
	@Override
	public List<ProductVO> getOptions1(String num) {
		// TODO Auto-generated method stub
		return sqlsession.selectList("mappers.ShopDAO-mapper.getOptions1", num);
	}

//	옵션2 가져오기
	@Override
	public List<ProductVO> getOptions2(OptionVO option) {
		// TODO Auto-generated method stub
		return sqlsession.selectList("mappers.ShopDAO-mapper.getOptions2", option);
	}

//	주문 등록
	@Override
	public int setOrders(OrdersVO orders) {
		// TODO Auto-generated method stub
		return sqlsession.insert("mappers.ShopDAO-mapper.setOrders", orders);
	}

//	주문 상세 내역 등록
	@Override
	public int setDetails(Order_detailsVO details) {
		// TODO Auto-generated method stub
		return sqlsession.insert("mappers.ShopDAO-mapper.setDetails", details);
	}
}