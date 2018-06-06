package com.syu.anyshop.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDaoImpl implements ProductDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ProductInfo> productList() {
		
		return sqlSession.selectList("product.productList");
	}

	@Override
	public List<ProductInfo> productAllList(String product_kinds) {
		
		return sqlSession.selectList("product.productAllList", product_kinds);
		
	}

	@Override
	public ProductInfo viewProduct(String product_id) {

		return sqlSession.selectOne("product.viewProduct", product_id);
	}

	@Override
	public List<ProductInfo> searchBox(String searchBox) {		

		return sqlSession.selectList("product.searchBox", searchBox);
	}

	@Override
	public List<ProductInfo> productDetailAllList(String product_kinds, String product_detail) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("product_kinds", product_kinds);
		map.put("product_detail", product_detail);
				
		return sqlSession.selectList("product.productDetailAllList", map);
	}

	@Override
	public List<ProductInfo> autocomplete(String searchBox) {
	
		return sqlSession.selectList("product.autocomplete", searchBox);
	}

	@Override
	public List<ProductInfo> selectNameProductInfo(String searchBox) {
		
		return sqlSession.selectList("product.selectNameProductInfo", searchBox);
	}
	
	
}
