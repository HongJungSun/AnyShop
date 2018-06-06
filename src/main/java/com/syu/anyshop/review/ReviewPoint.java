package com.syu.anyshop.review;


public class ReviewPoint {
	
	private int product_id;
	private int review_point10;
	private int review_point20;
	private int review_point30;
	private int review_point40;
	private int review_point50;
	
	public ReviewPoint() {
		super();
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}


	public int getReview_point10() {
		return review_point10;
	}

	public void setReview_point10(int review_point10) {
		this.review_point10 = review_point10;
	}

	public int getReview_point20() {
		return review_point20;
	}

	public void setReview_point20(int review_point20) {
		this.review_point20 = review_point20;
	}

	public int getReview_point30() {
		return review_point30;
	}

	public void setReview_point30(int review_point30) {
		this.review_point30 = review_point30;
	}

	public int getReview_point40() {
		return review_point40;
	}

	public void setReview_point40(int review_point40) {
		this.review_point40 = review_point40;
	}

	public int getReview_point50() {
		return review_point50;
	}

	public void setReview_point50(int review_point50) {
		this.review_point50 = review_point50;
	}

	@Override
	public String toString() {
		return "ReviewPoint [product_id=" + product_id + ", review_point10=" + review_point10 + ", review_point20="
				+ review_point20 + ", review_point30=" + review_point30 + ", review_point40=" + review_point40
				+ ", review_point50=" + review_point50 + "]";
	}


	
	

}
