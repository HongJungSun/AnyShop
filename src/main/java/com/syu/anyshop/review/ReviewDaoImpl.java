package com.syu.anyshop.review;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDaoImpl implements ReviewDao{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void regiReview(ReviewInfo reviewInfo) {
		
		int averageAge = reviewInfo.getAge()/10 * 10;
		reviewInfo.setAverageAge(averageAge);
		
		sqlSession.insert("review.regiReview", reviewInfo);
		return;
	}

	@Override
	public void regiReviewPoint(int averageAge, int review_point, int product_id ) {
		
		HashMap<String, Integer> map= new HashMap<String, Integer>();
		
		int count = sqlSession.selectOne("review.selectProduct_idCount", product_id);
		
		if( count == 0 ) {		
			map.put("averageAge", averageAge);
			map.put("review_point", review_point);
			map.put("product_id", product_id);
						
			sqlSession.insert("review.regiReviewPointDefault", map);
			
		} else {
			int sumReview_point = sqlSession.selectOne("review.selectAgeReview_point", averageAge);
			int countReview_point =  sqlSession.selectOne("review.selectCountReview_point", averageAge);
					
			map.put("countReview_point", countReview_point);
			map.put("sumReview_point", sumReview_point);
			map.put("averageAge", averageAge);
			map.put("review_point", review_point);
			map.put("product_id", product_id);
						
			sqlSession.update("review.updateReview", map);
			
		}
		
		return ;
	}

	@Override
	public ReviewPoint selectreviewPoint(String product_id) {

		return sqlSession.selectOne("review.selectreviewPoint", product_id);
	}

	
}
