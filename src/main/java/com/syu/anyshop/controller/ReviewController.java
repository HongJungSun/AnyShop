package com.syu.anyshop.controller;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.syu.anyshop.review.ReviewInfo;
import com.syu.anyshop.review.ReviewService;


@Controller
public class ReviewController{
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);       

	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping(value = "regiReview.do") 
	public String regiReivew(ReviewInfo reviewInfo) {
		logger.info("----------------- 리뷰 등록 컨트롤러---------------- " + new Date());
		
		logger.info("받은 리뷰 정보: " + reviewInfo.toString());
		reviewInfo.setAverageAge(reviewInfo.getAge()/10 *10);	

		reviewService.regiReview(reviewInfo);
		reviewService.regiReviewPoint(reviewInfo.getAverageAge(), reviewInfo.getReview_point(), reviewInfo.getProduct_id());
		
		return "redirect:/ viewProduct.do?product_id=" + reviewInfo.getProduct_id();
	}


}
