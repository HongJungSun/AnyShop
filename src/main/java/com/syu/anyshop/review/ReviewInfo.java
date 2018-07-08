package com.syu.anyshop.review;

import lombok.Data;

@Data
public class ReviewInfo {
	
	private String id;
	private int age;
	private int product_id;
	private String product_name;
	private String product_img;
	private int review_point;
	private String review_contents;
	private int averageAge;
	


}
