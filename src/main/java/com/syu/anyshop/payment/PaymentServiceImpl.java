package com.syu.anyshop.payment;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.syu.anyshop.wishlist.WishListInfo;

@Service
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	private PaymentDao paymentDao;

	@Override
	public int regipayComplete(Map<String,Object> map1) {
		
		
		return paymentDao.regipayComplete(map1);
	}

	@Override
	public void updatePoint(int point, String product_price, String id) {
		
		int product_price1 = Integer.parseInt( product_price.replaceAll(",", "") );		
		int updatePoint= (int) (point + ( product_price1 * 0.01 ));
				
		paymentDao.updatePoint(updatePoint, id);
		return ;

	}

	@Override
	public int selectId(String id) {
		
		return paymentDao.selectId(id);
	}

	@Override
	public List<Payment> checkout(String id) {	
		
		return paymentDao.checkout(id);
	}

	@Override
	public String checkoutPayment(int product_id) {
		
		return paymentDao.checkoutPayment(product_id);
	}

	@Override
	public int cancelPayment(String id, String cancelPayment, String imp_uid) {
		
		return paymentDao.cancelPayment(id, cancelPayment, imp_uid);
	}

	@Override
	public int cancelPaymentComplete(String id, String cancelPayment, String imp_uid) {

		return paymentDao.cancelPaymentComplete(id, cancelPayment, imp_uid);
	}

	@Override
	public String selectProduct_price(String id, String cancelPayment) {
		
		return paymentDao.selectProduct_price(id, cancelPayment);
	}

	@Override
	public int minusPoint(int point, String product_price, String id) {
		
		int product_price1 = Integer.parseInt( product_price.replaceAll(",", "") );		
		int updatePoint= (int) (point - ( product_price1 * 0.01 ));
		
		return paymentDao.minusPoint(updatePoint, id);
	}

	@Override
	public WishListInfo selectWishlist(String wishlist_idx) {
		
		return paymentDao.selectWishlist(wishlist_idx);
	}

	@Override
	public void usePoint(String id, int usePoint) {
		
		paymentDao.usePoint(id, usePoint);
		
	}

	
	

}
