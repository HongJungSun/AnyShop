package com.syu.anyshop.product;

import java.util.List;


public interface ProductDao {
	List<ProductInfo> productList();

	List<ProductInfo> productAllList(String product_kinds);

	ProductInfo viewProduct(String product_id);

	List<ProductInfo> searchBox(String searchBox);

	List<ProductInfo> productDetailAllList(String product_kinds, String product_detail);

	List<ProductInfo> autocomplete(String searchBox);

	List<ProductInfo> selectNameProductInfo(String searchBox);

	int totalProduct(String product_kinds);

	List<ProductInfo> getProductPagingData(String product_kinds, int getPageNum, int contentNum);

	List<ProductInfo> getProductDetailPagingData(String product_kinds, String product_detail, int getPageNum,
			int contentNum);

	int totalProductDetail(String product_kinds, String product_detail);

	List<String> selectProduct_detail(String product_kinds);
	
}
