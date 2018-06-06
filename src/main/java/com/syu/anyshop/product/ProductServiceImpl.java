package com.syu.anyshop.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
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
	

}
