package com.syu.anyshop.payment;

import java.util.List;
import java.util.Map;

public interface PaymentDao {

	int regipayComplete(Map<String,Object> map1);

	void updatePoint( int updatePoint, String id);

	int selectId(String id);

	List<Payment> checkout(String id);

	String checkoutPayment(int product_id);

	int cancelPayment(String id, String cancelPayment, String imp_uid);

	int cancelPaymentComplete(String id, String cancelPayment, String imp_uid);

	String selectProduct_price(String id, String cancelPayment);

	int minusPoint(int updatePoint, String id);



}
