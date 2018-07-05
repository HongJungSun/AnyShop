package com.syu.anyshop.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.syu.anyshop.login.LoginInfo;
import com.syu.anyshop.login.LoginService;
import com.syu.anyshop.payment.Payment;
import com.syu.anyshop.payment.PaymentService;

import net.sf.json.JSONArray;

@Controller
public class PaymentController {
	@Autowired
	private PaymentService paymentService;	

	@Autowired
	private LoginService loginService;
	
	// 결제 완료시 결제 정보 db저장 후 회원 포인트 적립
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping( value="payComplete.do")
	public HashMap<String, Integer> payComplete(@RequestBody String paymentListInfo, HttpServletRequest request) {
		
		int result = 0;
		
		 List<Map<String,Object>> map = new ArrayList<Map<String,Object>>();
		 map = JSONArray.fromObject(paymentListInfo);
		 
		 int point = paymentService.selectId(map.get(0).get("id").toString());
		 		 
		 for(Map<String,Object> map1 : map) {			 
			 result = paymentService.regipayComplete(map1);
			 paymentService.updatePoint(point, map1.get("product_price").toString(), map1.get("id").toString());

		 }		 
		 
		 // 결제 후 세션 업데이트
		 String id = (String) request.getSession().getAttribute("id");
		 LoginInfo loginInfo = loginService.sessionUpadte(id);
		  
		 System.out.println("id 값:" + id);
		 
		 request.getSession().setAttribute("loginInfo", loginInfo);
         request.getSession().setAttribute("age", loginInfo.getAge());
         request.getSession().setAttribute("gender", loginInfo.getGender());
         request.getSession().setAttribute("name", loginInfo.getName());
		
		HashMap<String, Integer> map2 = new HashMap<String, Integer>();
		map2.put("result", result);
		
		return map2;
	} 
	
	// 결제상품 목록
	@RequestMapping( value="checkout.do")
	public String checkout(Model model, @RequestParam String id) {
				
		List<String> productList = new ArrayList<String>();		
		List<Payment> paymentList = paymentService.checkout(id);
		
		for( Payment pay  : paymentList ) {
			pay.setProduct_price( pay.getProduct_price().replaceAll(",", "") );
			productList.add( paymentService.checkoutPayment(pay.getProduct_id()) );

		}
		
		model.addAttribute("paymentList", paymentList);
		model.addAttribute("productList", productList);
		
		return "payment/checkout";
	}
	
	// 결제 취소 창 
	@RequestMapping( value="child.do")
	public String child(Model model, @RequestParam String imp_uid) {
		
		model.addAttribute("imp_uid", imp_uid);
		
		return "child"; 
	}
	
	// 결제취소 결제승인번호로 인증
	@ResponseBody
	@RequestMapping( value="cancelPayment.do")
	public HashMap<String, Integer> cancelPayment(Model model, @RequestParam String id, @RequestParam String cancelPayment, @RequestParam String imp_uid) {
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		int result = paymentService.cancelPayment(id, cancelPayment, imp_uid);
		
		map.put("result", result);
		
		return map;   
	}
	
	
	// 결제취소 인증번호 승인후 결제취소후 마일리지 제거
	@ResponseBody
	@RequestMapping( value="cancelPaymentComplete.do")
	public HashMap<String, Integer> cancelPaymentComplete(Model model, HttpServletRequest request, @RequestParam String id, @RequestParam String cancelPayment, @RequestParam String imp_uid) {
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		int point =  paymentService.selectId(id);
		String product_price = paymentService.selectProduct_price(id, cancelPayment);

		paymentService.minusPoint(point, product_price, id);
				
		// 결제 취소 후 세션 업데이트
		String user_id = (String) request.getSession().getAttribute("id");
		LoginInfo loginInfo = loginService.sessionUpadte(user_id);
				  				 
		request.getSession().setAttribute("loginInfo", loginInfo);
		request.getSession().setAttribute("age", loginInfo.getAge());
		request.getSession().setAttribute("gender", loginInfo.getGender());
		request.getSession().setAttribute("name", loginInfo.getName());
		
		int result = paymentService.cancelPaymentComplete(id, cancelPayment, imp_uid);
		
		map.put("result", result);
		
		return map;  
	}
	
	
	
	
	
	
	
	
	
	
	
}
