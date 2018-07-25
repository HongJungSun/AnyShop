package com.syu.anyshop.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(propagation=Propagation.REQUIRED, rollbackFor= {Exception.class})
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private ProductDao productDao;

	@Override
	public List<ProductInfo> productList() {
		return productDao.productList();
	}

	@Override
	public List<ProductInfo> productAllList(String product_kinds) {

		return productDao.productAllList(product_kinds);
	}

	@Override
	public ProductInfo viewProduct(String product_id) {

		return productDao.viewProduct(product_id);
	}

	@Override
	public List<ProductInfo> searchBox(String searchBox) {

		return productDao.searchBox(searchBox);
	}

	@Override
	public List<ProductInfo> productDetailAllList(String product_kinds, String product_detail) {
		
		return  productDao.productDetailAllList(product_kinds, product_detail);
	}

	@Override
	public List<ProductInfo> autocomplete(String searchBox) {
	
		return productDao.autocomplete(searchBox);
	}

	@Override
	public List<ProductInfo> selectNameProductInfo(String searchBox) {
		
		return productDao.selectNameProductInfo(searchBox);
	}

	@Override
	public int totalProduct(String product_kinds) {
		
		return productDao.totalProduct(product_kinds);
	}

	@Override
	public List<ProductInfo> getProductPagingData(String product_kinds, int getPageNum, int contentNum) {
		
		return productDao.getProductPagingData(product_kinds, getPageNum, contentNum);
	}

	@Override
	public int totalProductDetail(String product_kinds, String product_detail) {
		
		return productDao.totalProductDetail(product_kinds, product_detail);
	}

	@Override
	public List<ProductInfo> getProductDetailPagingData(String product_kinds, String product_detail, int getPageNum,
			int contentNum) {
		
		return productDao.getProductDetailPagingData(product_kinds, product_detail, getPageNum, contentNum);
	}

	@Override
	public List<String> selectProduct_detail(String product_kinds) {
		
		return productDao.selectProduct_detail(product_kinds);
	}
	

}
