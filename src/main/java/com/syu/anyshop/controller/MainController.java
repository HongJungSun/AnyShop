package com.syu.anyshop.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.syu.anyshop.product.ProductInfo;
import com.syu.anyshop.product.ProductService;

@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@Autowired
	private ProductService productService;
		
	
	// searchBox 키워드 검색하면 연관검색어 보여주기
		@RequestMapping(value = "autoComplete.do")
		@ResponseBody
		public Map<String, List<ProductInfo>> searchBox(Model model, HttpServletRequest request) {
			logger.info("Welcome mainController searchBox! " + new Date());
			
			String searchBox = request.getParameter("value");
			 
			List<ProductInfo> list = productService.searchBox(searchBox); //result값이 포함되어 있는 product 테이블의 네임을 리턴
			Map<String, List<ProductInfo>> map= new HashMap<String, List<ProductInfo>>();
			map.put("data", list);
			 
			return map;
						
		}
}
