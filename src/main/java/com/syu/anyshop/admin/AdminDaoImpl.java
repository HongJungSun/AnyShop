package com.syu.anyshop.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.syu.anyshop.login.LoginInfo;
import com.syu.anyshop.payment.Payment;
import com.syu.anyshop.product.ProductInfo;
import com.syu.anyshop.review.ReviewInfo;
import com.syu.anyshop.searchBox.SearchBoxInfo;
import com.syu.anyshop.wishlist.WishListInfo;

@Repository
public class AdminDaoImpl implements AdminDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<LoginInfo> showAllMember() {
		
		return sqlSession.selectList("admin.showAllMember");
	}

	@Override
	public LoginInfo searchMember(String id) {

		return sqlSession.selectOne("admin.searchMember", id);
	}

	@Override
	public void updateMember(LoginInfo loginInfo) {
		
		sqlSession.update("admin.updateMember", loginInfo);
		return;
	}

	@Override
	public void regiMember(LoginInfo loginInfo) {
		sqlSession.insert("admin.regiMember", loginInfo);
		return;
		
	}

	@Override
	public List<ProductInfo> selectProductList() {
		
		return sqlSession.selectList("admin.selectProductList");
	}

	@Override
	public ProductInfo selectProduct(String product_name) {
		
		return sqlSession.selectOne("admin.selectProduct", product_name);
	}

	@Override
	public void addProduct(ProductInfo productInfo) {
		
		System.out.println("찍은값: " + productInfo.toString());
		sqlSession.insert("admin.addProduct", productInfo);
		
		return ;
	}

	@Override
	public int checkProduct(String product_name) {

		return sqlSession.selectOne("admin.checkProduct", product_name);
	}

	@Override
	public void deleteProduct(String product_name) {
		sqlSession.delete("admin.deleteProduct", product_name);

		
	}

	@Override
	public void editProductCommit(ProductInfo productInfo) {

		sqlSession.update("admin.editProductCommit", productInfo);
		return ;
	}

	@Override
	public ProductInfo getFile(String product_id) {

		return sqlSession.selectOne("admin.getFile", product_id);
	}

	@Override
	public List<WishListInfo> wishlistStatistics() {

		return sqlSession.selectList("admin.wishlistStatistics");
	}

	@Override
	public List<Integer> wishListCount() {
		
		return sqlSession.selectList("admin.wishListCount");
	}

	@Override
	public int totalMember() {
		
		return sqlSession.selectOne("admin.totalMember");
	}

	@Override
	public int totalProduct() {
		
		return sqlSession.selectOne("admin.totalProduct");
	}

	@Override
	public List<ReviewInfo> reviewStatistics() {
		
		return sqlSession.selectList("admin.reviewStatistics");
	}

	@Override
	public List<String> womenSearchBoxStatistics() {
		
		return sqlSession.selectList("admin.womenSearchBoxStatistics");
	}

	@Override
	public List<String> manSearchBoxStatistics() {
		
		return sqlSession.selectList("admin.manSearchBoxStatistics");
	}

	@Override
	public List<Integer> womenSearchBoxCountList() {
		
		return sqlSession.selectList("admin.womenSearchBoxCountList");
	}

	@Override
	public List<Integer> manSearchBoxCountList() {
		
		return sqlSession.selectList("admin.manSearchBoxCountList");
	}

	@Override
	public List<Payment> paymentStatistics() {
		
		return sqlSession.selectList("admin.paymentStatistics");
	}

	@Override
	public String productImgList(int product_id) {
		
		return sqlSession.selectOne("admin.productImgList", product_id);
	}

	@Override
	public List<Integer> soldQuantityList() {
		
		return sqlSession.selectList("admin.soldQuantityList");
	}

	@Override
	public Integer soldPriceList(int product_id) {	
		
		return sqlSession.selectOne("admin.soldPriceList", product_id);
	}

	@Override
	public int getQuantity(int product_id) {
		
		return sqlSession.selectOne("admin.getQuantity", product_id);
	}

	@Override
	public List<Payment> allPaymentStatistics() {
		
		return sqlSession.selectList("admin.allPaymentStatistics");
	}

	@Override
	public List<SearchBoxInfo> allSearchBoxExcel() {
		
		return sqlSession.selectList("admin.allSearchBoxExcel");
	}

	@Override
	public List<WishListInfo> wishListExcel() {
		
		return sqlSession.selectList("admin.wishListExcel");
	}

	@Override
	public String product_kinds(int product_id) {
		
		return sqlSession.selectOne("admin.product_kinds", product_id);
	}

	@Override
	public String product_detail(int product_id) {
		
		return sqlSession.selectOne("admin.product_detail", product_id);
	}

	@Override
	public List<ReviewInfo> reviewExcel() {
		
		return sqlSession.selectList("admin.reviewExcel");
	}

	@Override
	public List<Payment> selectDelivery() {
		
		return sqlSession.selectList("admin.selectDelivery");
	}

	@Override
	public Object updatePaymentDelivery_state(int apply_num) {
		
		return sqlSession.update("admin.updatePaymentDelivery_state", apply_num);
	}

	@Override
	public List<Payment> selectDeliveryStart() {
		
		return sqlSession.selectList("admin.selectDeliveryStart");
	}

	@Override
	public List<String> selectAddress(String id) {
		
		return sqlSession.selectList("admin.selectAddress", id);
	}

	@Override
	public List<Payment> cancelDelivery() {
		
		return sqlSession.selectList("admin.cancelDelivery");
	}

	@Override
	public int delivery_state_N() {
		
		return sqlSession.selectOne("admin.delivery_state_N");
	}

	@Override
	public int delivery_state_Y() {
		
		return sqlSession.selectOne("admin.delivery_state_Y");
	}

	@Override
	public int delivery_state_C() {
		
		return sqlSession.selectOne("admin.delivery_state_C");
	}

	@Override
	public String totalPayment(String date) {
		
		return sqlSession.selectOne("admin.totalPayment", date);
	}

	@Override
	public int todayPaymentList(String date) {
		
		return sqlSession.selectOne("admin.todayPaymentList", date);
	}

	@Override
	public List<Payment> selectDateList(String startDate) {		
		
		return sqlSession.selectList("admin.selectDateList", startDate);
	}

	@Override
	public List<Payment> showSales(String year) {
		
		HashMap<String,String> map = new HashMap<String,String>();
		
		map.put("startDate", year + "-01-00");
		map.put("endDate", year + "-12-32");
		
		return sqlSession.selectList("admin.showSales", map);
	}

	@Override
	public List<Payment> allExcel() {
		
		return sqlSession.selectList("admin.allExcel");
	}

	@Override
	public int totalPagingCount() {
		
		return sqlSession.selectOne("admin.totalPagingCount");
	}

	@Override
	public List<ProductInfo> getProductPagingData(int getPageNum, int contentNum) {
		
		Map<String,Integer> map = new HashMap<String,Integer>();
		
		map.put("pageNum", getPageNum);
		map.put("contentNum", contentNum);
		
		return sqlSession.selectList("admin.getProductPagingData", map);
	}

	@Override
	public List<LoginInfo> getMemberPagingData(int getPageNum, int contentNum) {
		
		Map<String,Integer> map = new HashMap<String,Integer>();
		
		map.put("pageNum", getPageNum);
		map.put("contentNum", contentNum);
		
		return sqlSession.selectList("admin.getMemberPagingData", map);
		
		
	}

	@Override
	public int totalReviewStatistics() {
		
		return sqlSession.selectOne("admin.totalReviewStatistics");
	}

	@Override
	public List<ReviewInfo> getReviewStatisticsPagingData(int getPageNum, int contentNum) {
		
		Map<String,Integer> map = new HashMap<String,Integer>();
		
		map.put("pageNum", getPageNum);
		map.put("contentNum", contentNum);
		
		return sqlSession.selectList("admin.getReviewStatisticsPagingData", map);
	}


}
