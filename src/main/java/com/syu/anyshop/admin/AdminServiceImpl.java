package com.syu.anyshop.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.syu.anyshop.login.LoginInfo;
import com.syu.anyshop.payment.Payment;
import com.syu.anyshop.product.ProductInfo;
import com.syu.anyshop.review.ReviewInfo;
import com.syu.anyshop.searchBox.SearchBoxInfo;
import com.syu.anyshop.wishlist.WishListInfo;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDao adminDao;

	@Override
	public List<LoginInfo> showAllMember() {
	
		return adminDao.showAllMember();
	}

	@Override
	public LoginInfo searchMember(String id) {

		return adminDao.searchMember(id);
	}

	@Override
	public void updateMember(LoginInfo loginInfo) {
		
		adminDao.updateMember(loginInfo);		
		return; 		
	}

	@Override
	public void regiMember(LoginInfo loginInfo) {
		adminDao.regiMember(loginInfo);
		
		return;
	}

	@Override
	public List<ProductInfo> selectProductList() {
		
		return adminDao.selectProductList();
	}

	@Override
	public ProductInfo selectProduct(String product_name) {

		return adminDao.selectProduct(product_name);
	}

	@Override
	public void addProduct(ProductInfo productInfo) {
		adminDao.addProduct(productInfo);
		
		return ;
	}

	@Override
	public int checkProduct(String product_name) {

		return adminDao.checkProduct(product_name);
	}

	@Override
	public void deleteProduct(String product_name) {
		adminDao.deleteProduct(product_name);
		return;
		
	}

	@Override
	public void editProductCommit(ProductInfo productInfo) {
		
		adminDao.editProductCommit(productInfo);
		return ;
	}

	@Override
	public ProductInfo getFile(String product_id) {

		return adminDao.getFile(product_id);
	}

	@Override
	public List<WishListInfo> wishlistStatistics() {

		return adminDao.wishlistStatistics();
	}

	@Override
	public List<Integer> wishListCount() {
		
		return adminDao.wishListCount();
	}

	@Override
	public int totalMember() {
		
		return adminDao.totalMember();
	}

	@Override
	public int totalProduct() {
		
		return adminDao.totalProduct();
	}

	@Override
	public List<ReviewInfo> reviewStatistics() {
		
		return adminDao.reviewStatistics();
	}

	@Override
	public List<String> womenSearchBoxStatistics() {
		
		return adminDao.womenSearchBoxStatistics();
	}

	@Override
	public List<String> manSearchBoxStatistics() {
		
		return adminDao.manSearchBoxStatistics();
	}

	@Override
	public List<Integer> womenSearchBoxCountList() {
	
		return adminDao.womenSearchBoxCountList();
	}

	@Override
	public List<Integer> manSearchBoxCountList() {
		
		return adminDao.manSearchBoxCountList();
	}

	@Override
	public List<Payment> paymentStatistics() {
		
		return adminDao.paymentStatistics();
	}

	@Override
	public String productImgList(int product_id) {
		
		return adminDao.productImgList(product_id);
	}

	@Override
	public List<Integer> soldQuantityList() {
		
		return adminDao.soldQuantityList();
	}

	@Override
	public Integer soldPriceList(int product_id) {		
		
		return adminDao.soldPriceList(product_id);
	}

	@Override
	public int getQuantity(int product_id) {
		
		return adminDao.getQuantity(product_id);
	}

	@Override
	public List<Payment> allPaymentStatistics() {
		
		return adminDao.allPaymentStatistics();
	}

	@Override
	public List<SearchBoxInfo> allSearchBoxExcel() {
		
		return adminDao.allSearchBoxExcel();
	}

	@Override
	public List<WishListInfo> wishListExcel() {
		
		return adminDao.wishListExcel();
	}

	@Override
	public String product_kinds(int product_id) {
		
		return adminDao.product_kinds(product_id);
	}

	@Override
	public String product_detail(int product_id) {
		
		return adminDao.product_detail(product_id);
	}

	@Override
	public List<ReviewInfo> reviewExcel() {
		
		return adminDao.reviewExcel();
	}

	@Override
	public List<Payment> selectDelivery() {
		
		return adminDao.selectDelivery();
	}

	@Override
	public void updatePaymentDelivery_state(int apply_num) {
		
		adminDao.updatePaymentDelivery_state(apply_num);
		return;		
	}

	@Override
	public List<Payment> selectDeliveryStart() {
		
		return adminDao.selectDeliveryStart();
	}

	@Override
	public List<String> selectAddress(String id) {
		
		return adminDao.selectAddress(id);
	}

	@Override
	public List<Payment> cancelDelivery() {
		
		return adminDao.cancelDelivery();
	}

	@Override
	public int delivery_state_N() {
		
		return adminDao.delivery_state_N();
	}

	@Override
	public int delivery_state_Y() {
		
		return adminDao.delivery_state_Y();
	}

	@Override
	public int delivery_state_C() {
		
		return adminDao.delivery_state_C();
	}

	@Override
	public String totalPayment(String date) {
		
		return adminDao.totalPayment(date);
	}

	@Override
	public int todayPaymentList(String date) {
		
		return adminDao.todayPaymentList(date);
	}

	@Override
	public List<Payment> selectDateList(String startDate) {
		
		return adminDao.selectDateList(startDate);
	}

	@Override
	public List<Payment> showSales(String year) {
		
		return adminDao.showSales(year);
	}



}
