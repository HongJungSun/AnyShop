package com.syu.anyshop.review;

public class ReviewInfo {
	
	private String id;
	private int age;
	private int product_id;
	private String product_name;
	private String product_img;
	private int review_point;
	private String review_contents;
	private int averageAge;
	
	public ReviewInfo() {

	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
		
	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}	

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getProduct_img() {
		return product_img;
	}

	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}

	public int getReview_point() {
		return review_point;
	}

	public void setReview_point(int review_point) {
		this.review_point = review_point;
	}

	public String getReview_contents() {
		return review_contents;
	}

	public void setReview_contents(String review_contents) {
		this.review_contents = review_contents;
	}

	public int getAverageAge() {
		return averageAge;
	}

	public void setAverageAge(int averageAge) {
		this.averageAge = averageAge;
	}

	@Override
	public String toString() {
		return "ReviewInfo [id=" + id + ", age=" + age + ", product_id=" + product_id + ", product_name=" + product_name
				+ ", product_img=" + product_img + ", review_point=" + review_point + ", review_contents="
				+ review_contents + ", averageAge=" + averageAge + "]";
	}

	


	

}
