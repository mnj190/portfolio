package com.my.test.shop.vo;

import lombok.Data;

@Data
public class OptionVO {
	private String op_num;
	private String prod_num;
	private String op_dep1_name;
	private String op_dep2_name = null;
	private String op_dep1_value;
	private String op_dep2_value = null ;
	private String op_add_price;
	private String op_state;
	private String op_quantity;
	
	
}
