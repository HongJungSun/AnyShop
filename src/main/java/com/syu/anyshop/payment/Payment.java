package com.syu.anyshop.payment;

public class Payment {
	
	private String id;           // 구매자 아이디
	private String imp_uid;      //상품 고유번호
	private int apply_num;       // 승인 번호
	private int product_id;      // 상품 번호
	private String product_price;   // 상품 가격
	private String product_name; // 상품명
	private int product_quantity; // 상품 수량
	private String product_size; // 상품 사이즈
	private String product_color; //상품 컬러
	private String gender;       // 구매자 성별
	private String name;         // 구매자 이름
	private int age;             // 구매자 나이
	private int height;          // 구매자 키
	private int weight;          // 구매자 몸무게
	private String date;         // 구매 날짜
	private String delivery_state;  // 주문 상태
	
	
	public Payment() {
		super();
	}

	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getImp_uid() {
		return imp_uid;
	}


	public void setImp_uid(String imp_uid) {
		this.imp_uid = imp_uid;
	}


	public int getApply_num() {
		return apply_num;
	}


	public void setApply_num(int apply_num) {
		this.apply_num = apply_num;
	}


	public int getProduct_id() {
		return product_id;
	}


	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}


	public String getProduct_price() {
		return product_price;
	}


	public void setProduct_price(String product_price) {
		this.product_price = product_price;
	}


	public String getProduct_name() {
		return product_name;
	}


	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	

	public int getProduct_quantity() {
		return product_quantity;
	}


	public void setProduct_quantity(int prouct_quantity) {
		this.product_quantity = prouct_quantity;
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


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public int getAge() {
		return age;
	}


	public void setAge(int age) {
		this.age = age;
	}


	public int getHeight() {
		return height;
	}


	public void setHeight(int height) {
		this.height = height;
	}


	public int getWeight() {
		return weight;
	}


	public void setWeight(int weight) {
		this.weight = weight;
	}
	
	
	public String getDate() {
		return date;
	}


	public void setDate(String date) {
		this.date = date;
	}


	public String getDelivery_state() {
		return delivery_state;
	}


	public void setDelivery_state(String delivery_state) {
		this.delivery_state = delivery_state;
	}


	@Override
	public String toString() {
		return "Payment [id=" + id + ", imp_uid=" + imp_uid + ", apply_num=" + apply_num + ", product_id=" + product_id
				+ ", product_price=" + product_price + ", product_name=" + product_name + ", product_quantity="
				+ product_quantity + ", product_size=" + product_size + ", product_color=" + product_color + ", gender="
				+ gender + ", name=" + name + ", age=" + age + ", height=" + height + ", weight=" + weight + ", date="
				+ date + ", delivery_state=" + delivery_state + "]";
	}






	
	
}
