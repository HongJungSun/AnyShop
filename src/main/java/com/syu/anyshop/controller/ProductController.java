package com.syu.anyshop.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.syu.anyshop.product.ProductInfo;
import com.syu.anyshop.product.ProductService;
import com.syu.anyshop.questionBoard.Paging;
import com.syu.anyshop.questionBoard.QuestionBoard;
import com.syu.anyshop.questionBoard.QuestionBoardService;
import com.syu.anyshop.review.ReviewPoint;
import com.syu.anyshop.review.ReviewService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class ProductController {
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private QuestionBoardService questionBoardService;
	
	@Autowired
	private ReviewService reviewService;
	
       
	// 상품 전체 목록 (대분류)
	@RequestMapping(value = "product_kindsAllList.do")
	public String productAllList(Model model, @RequestParam String product_kinds) {
		logger.info("Welcome productController product_kindsAllList! " + new Date());
		
		List<ProductInfo> list= new ArrayList<ProductInfo>();
		list= productService.productAllList(product_kinds);		
	
		model.addAttribute("productList",list);
		model.addAttribute("product_kinds", list.get(0).getProduct_kinds());
		
		return "product/productAllList";

	}
	
	// 상품 전체 목록 (소분류)
		@RequestMapping(value = "productDetailAllList.do")
		public String productDetailAllList(Model model, @RequestParam String product_kinds, @RequestParam String product_detail) {
			logger.info("Welcome productController product_kindsAllList! " + new Date());
			
			List<ProductInfo> list= new ArrayList<ProductInfo>();
			
			list= productService.productDetailAllList(product_kinds, product_detail);
			
			model.addAttribute("productList",list);
			model.addAttribute("product_kinds", product_kinds);
			model.addAttribute("product_detail", product_detail);
			
			return "product/productAllList";

		}	
		
		// searchBox를 통한 상품이름으로 검색 시
		@RequestMapping(value = "productNameProductInfo.do")
		public String productNameProductInfo(Model model, @RequestParam String searchBox) {
			logger.info("Welcome productController productNameProductInfo! " + new Date());
			
			List<ProductInfo> list= productService.selectNameProductInfo(searchBox);
	
			model.addAttribute("productList",list);
			
			return "product/productAllList";

		}	
	
		// 제품 상세보기
		@RequestMapping(value = "viewProduct.do")
		public String viewPorduct(Model model, @RequestParam String product_id, Paging paging) {
			logger.info("Welcome productController viewProduct! " + new Date());	
			
			List<QuestionBoard> list = new ArrayList<QuestionBoard>();
			ProductInfo productInfo= new ProductInfo();
			ReviewPoint reviewPoint = new ReviewPoint();
							
				if(paging.getKeyword() == null || paging.getKeyword() == "") {
					paging.pageCalculate(questionBoardService.selectRowCount(product_id));

					list = questionBoardService.viewAllQuestionBoard(paging);         							
					productInfo= productService.viewProduct(product_id);
					reviewPoint = reviewService.selectreviewPoint(product_id);
					
				} else {
					paging.pageCalculate(questionBoardService.selectRowCount2(product_id, paging.getKeyword(), paging.getSearchBoard()));

					list= questionBoardService.viewAllQuestionBoard2(paging);
					productInfo= productService.viewProduct(product_id);
					reviewPoint = reviewService.selectreviewPoint(product_id);

				}
				
				
				if(paging.getTotalRow() == 0) {
					model.addAttribute("productInfo", productInfo);
					model.addAttribute("reviewPoint", reviewPoint);
				} else {
					model.addAttribute("productInfo", productInfo);
					model.addAttribute("list", list);
					model.addAttribute("paging", paging);
					model.addAttribute("reviewPoint", reviewPoint);
				}							

					
			return "product/viewProduct";
		}
		
		
		// autocomplete로 보여질 키워드 검색어
		@ResponseBody
		@RequestMapping(value = "autocomplete.do")
		public void autocomplete(Model model, HttpServletResponse response, @RequestParam String searchBox) throws IOException {
			logger.info("--------------------- autocomplete 컨트롤러 --------------- " + new Date());
			
			List<ProductInfo> list1= new ArrayList<ProductInfo>();
			
			JSONArray list = new JSONArray();
		    JSONObject object = null;
			
			list1= productService.autocomplete(searchBox);
			
			for(int i=0; i< list1.size(); i++) {
				object = new JSONObject();
				object.put("data", (String)list1.get(i).getProduct_name());
				list.add(object);
			}			
			
			PrintWriter pw = response.getWriter();
		    pw.print(list);
		    pw.flush();
		    pw.close();			

		}
	
}

