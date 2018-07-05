package com.syu.anyshop.payment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PaymentDaoImpl implements PaymentDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int regipayComplete(Map<String,Object> map1) {		
		
		return sqlSession.insert("payment.regipayComplete", map1);
	}

	@Override
	public void updatePoint( int updatePoint, String id) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("updatePoint", String.valueOf(updatePoint));
		map.put("id", id);
		
		sqlSession.update("payment.updatePoint", map);
		return ;
	}

	@Override
	public int selectId(String id) {
		
		return sqlSession.selectOne("payment.selectId", id);
	}

	@Override
	public List<Payment> checkout(String id) {
		
		return sqlSession.selectList("payment.checkout", id);
	}

	@Override
	public String checkoutPayment(int product_id) {
		
		return sqlSession.selectOne("payment.checkoutPayment", product_id);
	}

	@Override
	public int cancelPayment(String id, String cancelPayment, String imp_uid) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("cancelPayment", cancelPayment);
		map.put("imp_uid", imp_uid);
		
		return sqlSession.selectOne("payment.cancelPayment", map);
	}

	@Override
	public int cancelPaymentComplete(String id, String cancelPayment, String imp_uid) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("cancelPayment", cancelPayment);
		map.put("imp_uid", imp_uid);
		
		return sqlSession.delete("payment.cancelPaymentComplete", map);
	}

	@Override
	public String selectProduct_price(String id, String cancelPayment) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("cancelPayment", cancelPayment);
		
		return sqlSession.selectOne("payment.selectProduct_price", map);
	}

	@Override
	public int minusPoint(int updatePoint, String id) {
		
		HashMap<String, String> map = new HashMap<String, String>();

		map.put("id", id);
		map.put("updatePoint",  String.valueOf(updatePoint));
		
		return sqlSession.update("payment.minusPoint", map);
	}


}
