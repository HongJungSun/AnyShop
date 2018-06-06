package com.syu.anyshop.wishlist;

import java.util.List;
import java.util.Map;

public interface WishListService {

	
	List<WishListInfo> viewWishList(String id);

	int addWishList(Map<String,Object> map);

	int deleteWishList(int wishlist_idx);
	
	
}
