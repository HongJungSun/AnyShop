package com.syu.anyshop.payment;

import lombok.Data;

@Data
public class Payment {
	
	private String id;           // 구매자 아이디
	private String imp_uid;      //상품 고유번호
	private int apply_num;       // 승인 번호
	private int product_id;      // 상품 번호
	private String product_price;   // 상품 가격
	private String product_name;  // 상품명
	private String adress;        // 배달 주소
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
	
	
}
