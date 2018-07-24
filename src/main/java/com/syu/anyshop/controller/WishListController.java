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

import com.syu.anyshop.wishlist.WishListInfo;
import com.syu.anyshop.wishlist.WishListService;

import net.sf.json.JSONArray;

@Controller
public class WishListController {

	@Autowired
	private WishListService wishlistService;

	// 장바구니에 추가
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "addWishList.do")
	@ResponseBody
	public Map<String, Integer> addWishList(HttpServletRequest request, @RequestBody String wishListInfo) {

		int result = 0;

		List<Map<String, Object>> map = new ArrayList<Map<String, Object>>();
		map = JSONArray.fromObject(wishListInfo);

		for (Map<String, Object> map1 : map) {
			map1.put("product_priceArray", map1.get("product_priceArray").toString().replaceAll(",", ""));
			result = wishlistService.addWishList(map1);
		}

		Map<String, Integer> map2 = new HashMap<String, Integer>();
		map2.put("result", result);

		return map2;
	}

	// 장바구니 조회
	@RequestMapping(value = "viewWishList.do")
	public String cart(Model model, HttpServletRequest request) {

		List<WishListInfo> wishList = wishlistService.viewWishList((String) request.getSession().getAttribute("id"));

		model.addAttribute("wishListInfo", wishList);

		return "wish/wishlist";
	}

	// 장바구니 폼목 삭제
	@RequestMapping(value = "deleteWishList.do")
	@ResponseBody
	public Map<String, Integer> deleteWishList(@RequestParam int wishlist_idx) {

		int result = wishlistService.deleteWishList(wishlist_idx);

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("result", result);

		return map;
	}

}
