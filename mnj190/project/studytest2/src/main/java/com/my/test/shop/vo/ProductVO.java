package com.my.test.shop.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	private String prod_thumb0_str = null;
	private String prod_thumb1_str = null;
	private String prod_thumb2_str = null;
	private byte[] prod_thumb0 = null;
	private byte[] prod_thumb1 = null;
	private byte[] prod_thumb2 = null;
	List<OptionVO> optionVO;
}
