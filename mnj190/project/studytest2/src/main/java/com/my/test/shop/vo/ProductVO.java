package com.my.test.shop.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProductVO {
	private String prod_num;
	private String ucode;
	private String prod_dep1;
	private String prod_dep2;
	private String prod_name;
	private String prod_price;
	private String prod_quantity;
	private String prod_description;
	private String prod_option;
	List<OptionVO> optionVO;
	private MultipartFile file;
}
