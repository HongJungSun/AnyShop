package com.syu.anyshop.wishlist;

public class WishListInfo {
	
	private int wishlist_idx;
	private String id;
	private int product_id;
	private String product_name;
	private String product_img;
	private String product_price;
	private String product_size;
	private String product_color;
	private String product_quantity;
	
	
	public WishListInfo() {
		super();
	}


	public int getWishlist_idx() {
		return wishlist_idx;
	}


	public void setWishlist_idx(int wishlist_idx) {
		this.wishlist_idx = wishlist_idx;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
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


	public String getProduct_price() {
		return product_price;
	}


	public void setProduct_price(String product_price) {
		this.product_price = product_price;
	}


	public String getProduct_size() {
		return product_size;
	}


	public void setProduct_size(String product_size) {
		this.product_size = product_size;
	}


	public String getProduct_color() {
		return product_color;
	}


	public void setProduct_color(String product_color) {
		this.product_color = product_color;
	}


	public String getProduct_quantity() {
		return product_quantity;
	}


	public void setProduct_quantity(String product_quantity) {
		this.product_quantity = product_quantity;
	}


	@Override
	public String toString() {
		return "WishListInfo [wishlist_idx=" + wishlist_idx + ", id=" + id + ", product_id=" + product_id
				+ ", product_name=" + product_name + ", product_img=" + product_img + ", product_price=" + product_price
				+ ", product_size=" + product_size + ", product_color=" + product_color + ", product_quantity="
				+ product_quantity + "]";
	}


	
	
	
	
	
		
}


