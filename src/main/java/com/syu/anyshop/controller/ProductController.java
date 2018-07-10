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

import com.syu.anyshop.paging.Page;
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
	public String productAllList(Model model, @RequestParam String product_kinds, Page page, String pageNum1, String contentNum1) {
		logger.info("Welcome productController product_kindsAllList! " + new Date());
		
		int pageNum =0;
		int contentNum= 0;
		
		if(pageNum1 == null) {
			pageNum=1;
		} else {
			pageNum = Integer.parseInt(pageNum1);
		}
		if(contentNum1 == null) {
			contentNum = 12;
		} else {
			contentNum = Integer.parseInt(contentNum1);
		}			
		
		page.setTotalCount(productService.totalProduct(product_kinds));	// 전체 상품수
		page.setPageNum(pageNum-1);                                	// 현재 페이지를 페이지 객체에 지정, -1을 해야 쿼리에서 사용가능 (limit은 0부터기때문에)
		page.setContentNum(contentNum);                             // 한페이지에 몇개씩 게시글을 보여줄지 설정
		page.setCurrentBlock(pageNum);                              // 현제 페이지 블록이 몇번인지 현재 페이지 번호를 통해서 지정
		page.setLastBlock(page.getTotalCount());					// 마지막 블록 번호를 전체 게시글 수를 통해서  정한다.
		
		
		page.prevNext(pageNum);                                         // 현재 페이지 번호로 화살표를 나타낼지 정한다
		page.setStartPage(page.getCurrentBlock());                      // 시작 페이지를 페이지 블록 번호로 정한다.
		page.setEndPage(page.getLastBlock(), page.getCurrentBlock());   // 마지막 페이지를 마지막 페이지 블록과 현재 페이지 블록 번호로 정한다.
		
		
		List<ProductInfo> list = new ArrayList<ProductInfo>();
		list = productService.getProductPagingData(product_kinds, page.getPageNum()*12, page.getContentNum());
		
		logger.info(list.toString());
		
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("product_kinds", list.get(0).getProduct_kinds());
		
		return "product/productAllList";

	}
	
	// 상품 전체 목록 (소분류)
		@RequestMapping(value = "productDetailAllList.do")
		public String productDetailAllList(Model model, @RequestParam String product_kinds, @RequestParam String product_detail, 
												Page page, String pageNum1, String contentNum1) {
			logger.info("Welcome productController product_kindsAllListDetail! " + new Date());
			
			int pageNum =0;
			int contentNum= 0;
			
			if(pageNum1 == null) {
				pageNum=1;
			} else {
				pageNum = Integer.parseInt(pageNum1);
			}
			if(contentNum1 == null) {
				contentNum = 12;
			} else {
				contentNum = Integer.parseInt(contentNum1);
			}			
			
			page.setTotalCount(productService.totalProductDetail(product_kinds, product_detail));	// 전체 상품수
			page.setPageNum(pageNum-1);                                	// 현재 페이지를 페이지 객체에 지정, -1을 해야 쿼리에서 사용가능 (limit은 0부터기때문에)
			page.setContentNum(contentNum);                             // 한페이지에 몇개씩 게시글을 보여줄지 설정
			page.setCurrentBlock(pageNum);                              // 현제 페이지 블록이 몇번인지 현재 페이지 번호를 통해서 지정
			page.setLastBlock(page.getTotalCount());					// 마지막 블록 번호를 전체 게시글 수를 통해서  정한다.
			
			
			page.prevNext(pageNum);                                         // 현재 페이지 번호로 화살표를 나타낼지 정한다
			page.setStartPage(page.getCurrentBlock());                      // 시작 페이지를 페이지 블록 번호로 정한다.
			page.setEndPage(page.getLastBlock(), page.getCurrentBlock());   // 마지막 페이지를 마지막 페이지 블록과 현재 페이지 블록 번호로 정한다.
			
			
			List<ProductInfo> list = new ArrayList<ProductInfo>();
			list = productService.getProductDetailPagingData(product_kinds, product_detail, page.getPageNum()*12, page.getContentNum());
			
			
			model.addAttribute("list", list);
			model.addAttribute("page", page);
			model.addAttribute("product_kinds", list.get(0).getProduct_kinds());
			model.addAttribute("product_detail", list.get(0).getProduct_detail());
			
			return "product/productAllListDetail";

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

