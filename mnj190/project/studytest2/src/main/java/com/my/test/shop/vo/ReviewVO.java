package com.my.test.shop.vo;

import lombok.Data;

@Data
public class ReviewVO {
	private String review_num;
	private String prod_num;
	private String review_writer;
	private String review_content;
	private String review_rating;
	private String orders_num;
}
