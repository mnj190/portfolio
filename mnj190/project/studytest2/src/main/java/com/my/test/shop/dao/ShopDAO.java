package com.my.test.shop.dao;

import java.util.List;
import java.util.Map;

import com.my.test.shop.vo.CategoryVO;
import com.my.test.shop.vo.OptionVO;
import com.my.test.shop.vo.Order_detailsVO;
import com.my.test.shop.vo.OrdersVO;
import com.my.test.shop.vo.ProductVO;

public interface ShopDAO {
//	카테고리 가져오기
	public List<CategoryVO> getCategory();

//	서브 카테고리 가져오기
	public List<CategoryVO> getSubCategory();

// 	서브 카테고리 서치
	public List<CategoryVO> seachSubCategory(String cate_num);

//	상품 저장
	public int registration(ProductVO product);

//	옵션 저장
	public int setOption(OptionVO option);

//	카테고리별 상품 수
	public int getTotolProd(String cate);

//  카테고리 상품 리스트
	public List<ProductVO> getProducts(Map<String, String> map);

//  상품 가져오기
	public ProductVO getProduct(String num);

//	옵션 이름 가져오기
	public List<ProductVO> getOp_names(String num);

//	옵션1 밸류 가져오기
	public List<ProductVO> getOp_dep1_value(String num);

//	옵션1 가져오기
	public List<ProductVO> getOptions1(String num);

//	옵션2 가져오기
	public List<ProductVO> getOptions2(OptionVO option);

//	주문 등록
	public int setOrders(OrdersVO orders);

//	주문 상세 내역 등록
	public int setDetails(Order_detailsVO details);
}
