package com.syu.anyshop.wishlist;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(propagation=Propagation.REQUIRED, rollbackFor= {Exception.class})
public class WishListServiceImpl implements WishListService{
	
	@Autowired
	private WishListDao wishlistDao;
	
	@Override
	public List<WishListInfo> viewWishList(String id) {
		return wishlistDao.viewWishList(id);	
	}

	@Override
	public int addWishList(Map<String,Object> map) {
		
		return wishlistDao.addWishList(map);
	}

	@Override
	public int deleteWishList(int wishlist_idx) {

		return wishlistDao.deleteWishList(wishlist_idx);
	}	
	

}
