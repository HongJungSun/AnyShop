package com.syu.anyshop.admin;

import java.util.List;

import com.syu.anyshop.login.LoginInfo;
import com.syu.anyshop.payment.Payment;
import com.syu.anyshop.product.ProductInfo;
import com.syu.anyshop.review.ReviewInfo;
import com.syu.anyshop.searchBox.SearchBoxInfo;
import com.syu.anyshop.wishlist.WishListInfo;

public interface AdminService {

	List<LoginInfo> showAllMember();

	LoginInfo searchMember(String id);

	void updateMember(LoginInfo loginInfo);

	void regiMember(LoginInfo loginInfo);

	List<ProductInfo> selectProductList();

	ProductInfo selectProduct(String product_name);

	void addProduct(ProductInfo productInfo);

	int checkProduct(String product_name);

	void deleteProduct(String product_name);

	void editProductCommit(ProductInfo productInfo);

	ProductInfo getFile(String product_id);

	List<WishListInfo> wishlistStatistics();

	List<Integer> wishListCount();

	int totalMember();

	int totalProduct();

	List<ReviewInfo> reviewStatistics();

	List<String> womenSearchBoxStatistics();

	List<String> manSearchBoxStatistics();

	List<Integer> womenSearchBoxCountList();

	List<Integer> manSearchBoxCountList();

	List<Payment> paymentStatistics();

	String productImgList(int product_id);

	List<Integer> soldQuantityList();

	Integer soldPriceList(int product_id);

	int getQuantity(int product_id);

	List<Payment> allPaymentStatistics();

	List<SearchBoxInfo> allSearchBoxExcel();

	List<WishListInfo> wishListExcel();

	String product_kinds(int product_id);

	String product_detail(int product_id);

	List<ReviewInfo> reviewExcel();

	List<Payment> selectDelivery();

	void updatePaymentDelivery_state(int apply_num);

	List<Payment> selectDeliveryStart();

	List<String> selectAddress(String id);

	List<Payment> cancelDelivery();

	int delivery_state_N();

	int delivery_state_Y();

	int delivery_state_C();

	String totalPayment(String date);

	int todayPaymentList(String date);

	List<Payment> selectDateList(String startDate);

	List<Payment> showSales(String year);

	List<Payment> allExcel();








}
