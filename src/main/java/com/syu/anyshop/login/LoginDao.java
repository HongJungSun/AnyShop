package com.syu.anyshop.login;

import java.util.List;

import com.syu.anyshop.product.ProductInfo;

public interface LoginDao {
	boolean loginCheck(LoginInfo loginInfo);

	void addMember(LoginInfo loginInfo);

	LoginInfo viewMember(LoginInfo loginInfo);

	void updateMember(LoginInfo loginInfo);

	void deleteMember(String id);

	String findId(String name, String phone);

	String findPw(String id, String name, String phone);

	int userCheck(String id);

	String pwCheck(String id);

	void updatePw(String id, String pw);

	int checkIdPw(String id, String pw);

	List<ProductInfo> mainScreen();

	List<ProductInfo> mainProductAllList(String product_kinds);

	LoginInfo sessionUpadte(String id);

	List<String> selectPopularProduct_id();

	List<ProductInfo> selectPopularProduct(String product_id);

	List<ProductInfo> selectSeasonProduct(String keyword);
		
}
