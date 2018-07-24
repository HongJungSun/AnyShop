package com.syu.anyshop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.syu.anyshop.review.ReviewInfo;
import com.syu.anyshop.review.ReviewService;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;

	//리뷰 등록
	@RequestMapping(value = "regiReview.do")
	public String regiReivew(ReviewInfo reviewInfo) {

		reviewInfo.setAverageAge(reviewInfo.getAge() / 10 * 10);

		reviewService.regiReview(reviewInfo);
		reviewService.regiReviewPoint(reviewInfo.getAverageAge(), reviewInfo.getReview_point(),
				reviewInfo.getProduct_id());

		return "redirect:/ viewProduct.do?product_id=" + reviewInfo.getProduct_id();
	}

}
