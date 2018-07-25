package com.syu.anyshop.review;


public interface ReviewDao {

	void regiReview(ReviewInfo reviewInfo);

	void regiReviewPoint(int averageAge, int review_point, int product_id );

	ReviewPoint selectreviewPoint(String product_id);


}
