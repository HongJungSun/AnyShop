package com.syu.anyshop.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private ReviewDao reviewDao;

	@Override
	public void regiReview(ReviewInfo reviewInfo) {
		
		reviewDao.regiReview(reviewInfo);
	}

	@Override
	public void regiReviewPoint(int averageAge, int review_point, int product_id ) {

		reviewDao.regiReviewPoint(averageAge, review_point, product_id);
	}

	@Override
	public ReviewPoint selectreviewPoint(String product_id) {

		return reviewDao.selectreviewPoint(product_id);
	}

}
