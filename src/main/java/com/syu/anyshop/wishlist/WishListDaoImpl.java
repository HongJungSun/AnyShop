package com.syu.anyshop.wishlist;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WishListDaoImpl implements WishListDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<WishListInfo> viewWishList(String id) {
		
		List<WishListInfo> list= new ArrayList<WishListInfo>();
		
		list= sqlSession.selectList("wishlist.viewWishList", id);
		
		return list;
	}

	@Override
	public int addWishList(Map<String,Object> map) {
				
		return sqlSession.insert("wishlist.addWishList", map);
		
	}

	@Override
	public int deleteWishList(int wishlist_idx) {

		return sqlSession.delete("wishlist.deleteWishList", wishlist_idx);
	}

}
