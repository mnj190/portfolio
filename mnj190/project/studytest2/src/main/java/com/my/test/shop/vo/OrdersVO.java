package com.my.test.shop.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class OrdersVO {
	private String orders_num;
	private String prod_num;
	private String orderer;
	private String seller;
	private String orders_address;
	private String orders_payment;
	private String orders_quantity;
	private String orders_option;
	private Date orders_date;
	private String orders_state;
	private List<Order_detailsVO> order_details;

	private String review_num;
	private String seller_id;
	private String prod_name;
	private String prod_thumb0;
}
