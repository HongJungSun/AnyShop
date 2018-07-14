package com.syu.anyshop.payment;

import java.util.List;
import java.util.Map;

import com.syu.anyshop.wishlist.WishListInfo;

public interface PaymentService {

	int regipayComplete(Map<String,Object> map1);

	void updatePoint(int point, String product_price, String id);

	int selectId(String id);

	List<Payment> checkout(String id);

	String checkoutPayment(int product_id);

	int cancelPayment(String id, String cancelPayment, String imp_uid);

	int cancelPaymentComplete(String id, String cancelPayment, String imp_uid);

	String selectProduct_price(String id, String cancelPayment);

	int minusPoint(int point, String product_price, String id);

	WishListInfo selectWishlist(String wishlist_idx);

	void usePoint(String id, String usePoint);


}
