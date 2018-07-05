package com.syu.anyshop.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.syu.anyshop.admin.AdminService;
import com.syu.anyshop.login.LoginInfo;
import com.syu.anyshop.payment.Payment;
import com.syu.anyshop.product.ProductInfo;
import com.syu.anyshop.review.ReviewInfo;
import com.syu.anyshop.searchBox.SearchBoxInfo;
import com.syu.anyshop.wishlist.WishListInfo;

@Controller
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	private AdminService adminService;

	
	@RequestMapping(value = "admin.do")
	public String main(Model model, HttpServletRequest request) {
		logger.info("Welcome adminController admin! " + new Date());
		
		Date dt = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy");
		String date = sdf.format(dt).toString();		
		
		// today 매출 String 값으로 전부 받기
		List<Integer> paymentPriceList = new ArrayList<Integer>();
		
		int memberCount = adminService.totalMember();
		int totalProduct = adminService.totalProduct();
		int delivery_state_N = adminService.delivery_state_N();
		int delivery_state_Y = adminService.delivery_state_Y();
		int delivery_state_C = adminService.delivery_state_C();
		// 오늘 총 매출
		int totalPayment = 0;
		// 오늘 매출 데이터 갯수 
		int todayPaymentLength = adminService.todayPaymentList(date);
		
		for(int i=0; i < todayPaymentLength; i++) {
			paymentPriceList.add( Integer.parseInt(adminService.totalPayment(date).replace(",", "")) );
		}
		
		for(int i=0; i < paymentPriceList.size(); i++ ) {
			totalPayment +=  paymentPriceList.get(i);
		}
		
		//매출 통계 date 값과 date에 해당하는 매출 값 구하기
		sdf = new SimpleDateFormat("yyyy-MM");
		String startDate = sdf.format(dt).toString();
		
		Map<String, Integer> map= new HashMap<String,Integer>();
		
		int january = 0;
		int february = 0;
		int march = 0;
		int april = 0;
		int may = 0;
		int june = 0;
		int july = 0;
		int august = 0;
		int september = 0;
		int october = 0;
		int nomember = 0;
		int december = 0;
				
		List<Payment> paymentList = adminService.selectDateList(startDate);
		
	
		for(int i=0; i < paymentList.size(); i++) {
			if( paymentList.get(i).getDate().substring(0,7).equals( sdf2.format(dt).toString() +  "-01"))  {
				january += Integer.parseInt( paymentList.get(i).getProduct_price().replaceAll(",", ""));
				map.put("january", january  );
			} else if ( paymentList.get(i).getDate().substring(0,7).equals( sdf2.format(dt).toString() + "-02")) {
				february += Integer.parseInt( paymentList.get(i).getProduct_price().replaceAll(",", ""));
				map.put("february", february  );
			} else if ( paymentList.get(i).getDate().substring(0,7).equals( sdf2.format(dt).toString() + "-03")) {
				march += Integer.parseInt( paymentList.get(i).getProduct_price().replaceAll(",", ""));
				map.put("march", march  );
			} else if ( paymentList.get(i).getDate().substring(0,7).equals( sdf2.format(dt).toString() + "-04")) {
				april += Integer.parseInt( paymentList.get(i).getProduct_price().replaceAll(",", ""));
				map.put("april", april  );
			} else if ( paymentList.get(i).getDate().substring(0,7).equals( sdf2.format(dt).toString() + "-05")) {
				may += Integer.parseInt( paymentList.get(i).getProduct_price().replaceAll(",", ""));
				map.put("may", may  );
			} else if ( paymentList.get(i).getDate().substring(0,7).equals( sdf2.format(dt).toString() + "-06")) {
				june += Integer.parseInt( paymentList.get(i).getProduct_price().replaceAll(",", ""));
				map.put("june", june  );
			} else if ( paymentList.get(i).getDate().substring(0,7).equals( sdf2.format(dt).toString() + "-07")) {
				july += Integer.parseInt( paymentList.get(i).getProduct_price().replaceAll(",", ""));
				map.put("july", july  );
			} else if (paymentList.get(i).getDate().substring(0,7).equals( sdf2.format(dt).toString() + "-08")) {
				august += Integer.parseInt( paymentList.get(i).getProduct_price().replaceAll(",", ""));
				map.put("august", august  );
			} else if (paymentList.get(i).getDate().substring(0,7).equals( sdf2.format(dt).toString() + "-09")) {
				september += Integer.parseInt( paymentList.get(i).getProduct_price().replaceAll(",", ""));
				map.put("september", september  );
			} else if (paymentList.get(i).getDate().substring(0,7).equals( sdf2.format(dt).toString() + "-10")) {
				october += Integer.parseInt( paymentList.get(i).getProduct_price().replaceAll(",", ""));
				map.put("october", october  );
			} else if (paymentList.get(i).getDate().substring(0,7).equals( sdf2.format(dt).toString() + "-11")) {
				nomember += Integer.parseInt( paymentList.get(i).getProduct_price().replaceAll(",", ""));
				map.put("nomember", nomember  );
			} else {
				december += Integer.parseInt( paymentList.get(i).getProduct_price().replaceAll(",", ""));
				map.put("december", december  );
			}
		}
		
		model.addAttribute("memberCount", memberCount);
		model.addAttribute("totalProduct",totalProduct);
		model.addAttribute("delivery_state_N", delivery_state_N);
		model.addAttribute("delivery_state_Y", delivery_state_Y);
		model.addAttribute("delivery_state_C", delivery_state_C);
		model.addAttribute("totalPayment", totalPayment);
		model.addAttribute("map", map);
		
		
		
		
		return "admin/admin2/admin";
	}


	// 회원 전체 목록 
	@RequestMapping(value = "showAllMember.do")
	public String showMembert(Model model, HttpServletRequest request) {
		logger.info("Welcome adminController showAllMember! "+ new Date());
		

		List<LoginInfo> list= new ArrayList<LoginInfo>();
		list= adminService.showAllMember();
		model.addAttribute("list",list);
		
		return "admin/admin2/memberView";
	}
	
	// 회원 이름 검색  
		@RequestMapping(value = "searchMember.do")
		public String searchMember(Model model, HttpServletRequest request, @RequestParam String id) {
			logger.info("Welcome adminController searchMember! "+ new Date());
			

			LoginInfo userInfo= new LoginInfo();
			userInfo= adminService.searchMember(id);
			model.addAttribute("userInfo",userInfo);
			
			return "admin/admin2/searchMember";
		}
		
		// 회원 정보 수정  
		@RequestMapping(value = "updateMember.do")
		public String updateMember(Model model, @RequestParam String id) {
			logger.info("Welcome adminController updateMember! "+ new Date());
			
			LoginInfo userInfo= new LoginInfo();
			userInfo= adminService.searchMember(id);
			model.addAttribute("userInfo",userInfo);
			System.out.println(userInfo.getName());

			return "admin/admin2/updateMember";
		}

		//내정보 수정 결과
		@RequestMapping(value = "updateMemberAfter.do")
		public String updateMemberAfter(LoginInfo loginInfo, Model model) {
			logger.info("Welcome adminController updateMemberAfter! "+ new Date());
			
			adminService.updateMember(loginInfo);
			model.addAttribute("userInfo",loginInfo);
			
			return "admin/admin2/searchMember";
		}
		
		//회원 등록페이지(관리자 권한)
		@RequestMapping(value = "regiMember.do")
		public String regiMember() {
			logger.info("Welcome adminnController regiMember! "+ new Date());
			
			return "admin/admin2/regiMember";
		}
		
		//회원 등록페이지(관리자 권한)
		@RequestMapping(value = "regiMemberAfter.do")
		public String regiMemberAfter(LoginInfo loginInfo) {
			logger.info("Welcome adminController regiMember! "+ new Date());
			
			adminService.regiMember(loginInfo);
			return "admin/admin2/memberView";
		}
		
		//상품 등록(관리자 권한)
		@RequestMapping(value = "addProductView.do")
		public String addProductView() {
			logger.info("Welcome adminController addProductView! "+ new Date());
						
			return "admin/admin2/addProductView";
		}
	
		
		//상품 전체목록(관리자 권한, 옵션제외)
		@RequestMapping(value = "selectProductList.do")
		public String selectProductList(Model model) {
			logger.info("Welcome adminController selectProductList! "+ new Date());
			
			List<ProductInfo> list= new ArrayList<ProductInfo>();
			
			list= adminService.selectProductList();			
			model.addAttribute("productList", list);
						
			return "admin/admin2/selectProductList";
		}
	
	    //상품 편집 페이지(관리자 권한)
		@RequestMapping(value = "editProduct.do")
		public String selectProduct(Model model, @RequestParam String product_name) {
			logger.info("Welcome adminController editProduct! "+ new Date());
						
			ProductInfo productInfo= adminService.selectProduct(product_name);	
			
			model.addAttribute("productInfo", productInfo);
						
			return "admin/admin2/editProduct";
		} 
		
	    //상품 편집 Commit(관리자 권한)
		@RequestMapping(value = "editProductCommit.do")
		public String editProductCommit(Model model, @ModelAttribute ProductInfo productInfo) {
			logger.info("Welcome adminController editProductCommit! "+ new Date());
						
			adminService.editProductCommit(productInfo);				
						
			return "forward:/selectProductList.do";
		} 
				
		//상품 등록(관리자 권한)
		@RequestMapping(value = "addProductCommit.do")
		public String addProductCommit(Model model, ProductInfo productInfo) {
			logger.info("Welcome adminController addProductCommit! "+ new Date());
									
			adminService.addProduct(productInfo);
								
			return "redirect:/selectProductList.do";

		}		
		
		//상품 중복등록 검사(관리자)
		@RequestMapping(value = "checkProduct.do")
		@ResponseBody
		public Map<String, Integer> checkProduct(Model model, @RequestParam String product_name) throws IOException {
			logger.info("Welcome adminController checkProduct! "+ new Date());			
			
			Map<String, Integer> map= new HashMap<String, Integer>();			
			int result= adminService.checkProduct(product_name);

			map.put("result", result);
			
			return map;

		}	
						
		//상품 삭제(관리자)
		@RequestMapping(value = "deleteProduct.do")
		public String deleteProduct(@RequestParam String product_name) {
			logger.info("Welcome adminController deleteProduct! "+ new Date());
					
			adminService.deleteProduct(product_name);
				
			return "forward:/selectProductList.do";

		}
			
		//상품 편집시 파일 값 가져오기(관리자)
		@RequestMapping(value = "getFile.do")
		@ResponseBody
		public Map<String, ProductInfo> getFile(@PathVariable String product_id) {
			logger.info("Welcome adminController getFile! "+ new Date());			

			Map<String, ProductInfo> map= new HashMap<String, ProductInfo>();
				
			ProductInfo productInfo= adminService.getFile(product_id);
			
			map.put("result", productInfo);
				
			return map;

		}   
					
		//장바구니 통계(관리자)
		@RequestMapping(value = "wishlistStatistics.do")
		public String wishlistStatistics(Model model) {
			logger.info("Welcome adminController wishlistStatistics! "+ new Date());
							
			List<WishListInfo> wishList= adminService.wishlistStatistics();
			List<Integer> wishListCount= adminService.wishListCount();
			
			model.addAttribute("wishList", wishList);
			model.addAttribute("wishListCount", wishListCount);
			
			return "admin/admin2/wishlistStatistics";

		}		
			

		//상품 review 통계(관리자)
		@RequestMapping(value = "reviewStatistics.do")
		public String productStatistics(Model model) {
			logger.info("Welcome adminController reviewStatistics! "+ new Date());
							
			List<ReviewInfo> reviewList = adminService.reviewStatistics();
			
			model.addAttribute("reviewList", reviewList);
			
				
			return "admin/admin2/reviewStatistics";

		}	 
		
		//연관 검색어 통계(관리자)
		@RequestMapping(value = "searchBoxStatistics.do")
		public String searchBoxStatistics(Model model) {
			logger.info("Welcome adminController searchBoxStatistics! "+ new Date());
							
			List<String> womenSearchBoxList = adminService.womenSearchBoxStatistics();
			List<Integer> womenSearchBoxCountList = adminService.womenSearchBoxCountList();
			List<String> manSearchBoxList = adminService.manSearchBoxStatistics();
			List<Integer> manSearchBoxCountList = adminService.manSearchBoxCountList();			
			
			model.addAttribute("womenSearchBoxList", womenSearchBoxList);
			model.addAttribute("womenSearchBoxCountList", womenSearchBoxCountList);
			model.addAttribute("manSearchBoxList", manSearchBoxList);
			model.addAttribute("manSearchBoxCountList", manSearchBoxCountList);
			
				
			return "admin/admin2/searchBoxStatistics";

		}
		
		//매출 통계(관리자)
		@RequestMapping(value = "paymentStatistics.do")
		public String paymentStatistics(Model model) {
			logger.info("Welcome adminController paymentStatistics! "+ new Date());
							
			List<Payment> paymentList = adminService.paymentStatistics();
			List<String> productImgList = new ArrayList<String>();           // 이미지 
			List<Integer> soldQuantityList = new ArrayList<Integer>();       // 팔린 수량
			List<Integer> product_price_List = new ArrayList<Integer>();     // 상품 원래 가격
			List<Integer> soldPriceList = new ArrayList<Integer>();          // 팔린 총 가격
			
			int product_id = 0;
			int quantity = 0;
			int product_price =0;
			String product_img = null;
			
			
			for(int i=0; i < paymentList.size(); i++) {
				
				product_id = paymentList.get(i).getProduct_id();				
				product_img = adminService.productImgList(product_id);

				productImgList.add(product_img);
			
			}
			
			for(int i=0; i < paymentList.size(); i++) {
				
				quantity = adminService.getQuantity(paymentList.get(i).getProduct_id());
				product_price = adminService.soldPriceList(product_id);
				
				soldPriceList.add( product_price * quantity );
				product_price_List.add(product_price);

			}
			
			soldQuantityList = adminService.soldQuantityList();	
			
			
			System.out.println("paymentList "+ paymentList);
			System.out.println("productImgList " + productImgList);
			System.out.println("soldQuantityList " + soldQuantityList);
			System.out.println("product_price_List " + product_price_List);
			System.out.println("soldPriceList " + soldPriceList);
			
			
			model.addAttribute("paymentList", paymentList);
			model.addAttribute("productImgList", productImgList);
			model.addAttribute("soldQuantityList", soldQuantityList);
			model.addAttribute("product_price_List", product_price_List);
			model.addAttribute("soldPriceList", soldPriceList);			
							
			return "admin/admin2/paymentStatistics";

		}	
		
		//매출 통계(등수) 데이터 엑셀파일로 만들기 (관리자 )
		@ResponseBody
		@RequestMapping(value = "paymentExcel.do")
		public HashMap<String,Integer> excel() {
			
			HashMap<String,Integer> map1 = new HashMap<String,Integer>();
			 		
			List<Payment> paymentList = adminService.paymentStatistics();
			List<String> productImgList = new ArrayList<String>();           // 이미지 
			List<Integer> soldQuantityList = new ArrayList<Integer>();       // 팔린 수량
			List<Integer> product_price_List = new ArrayList<Integer>();     // 상품 원래 가격
			List<Integer> soldPriceList = new ArrayList<Integer>();          // 팔린 총 가격
			
			int product_id = 0;
			int quantity = 0;
			int product_price =0;
			String product_img = null;
			
			
			for(int i=0; i < paymentList.size(); i++) {
				
				product_id = paymentList.get(i).getProduct_id();				
				product_img = adminService.productImgList(product_id);

				productImgList.add(product_img);
			
			}
			
			for(int i=0; i < paymentList.size(); i++) {
				
				quantity = adminService.getQuantity(paymentList.get(i).getProduct_id());
				product_price = adminService.soldPriceList(product_id);
				
				soldPriceList.add( product_price * quantity );
				product_price_List.add(product_price);

			}
			
			soldQuantityList = adminService.soldQuantityList();	
						
			// 엑셀파일 만들기 과정			
			Map<String,String> headerList = new HashMap<String,String>();
			Map<String,String> list = new HashMap<String,String>();
			
			//headerList를 세팅할 만큼 세팅합니다.
			headerList.put("0", "상품명");
			headerList.put("1", "상품 가격");
			headerList.put("2", "팔린 수량");
			headerList.put("3", "총 팔린 가격");
			
			//XSSFWorkbook 세팅
			XSSFWorkbook workbook = new XSSFWorkbook();
			XSSFSheet sheet = workbook.createSheet("매출(등수) 통계");
			XSSFRow row = null;
			XSSFCell cell = null;
			
			//data의 크기만큼 로우를 생성합니다.
			for(int i=0; i<= paymentList.size() ; i++) {
				
				row=sheet.createRow((short)i);
				
				//headerList의 크기만큼 i번째 row에 cell을 생성합니다.
				for(int k=0; k < headerList.size(); k++) {					
					
					cell=row.createCell(k);
					
					//맨윗줄에 headerList를 세팅합니다.
					if(i==0) {						
						//headerList의 데이터를 세팅
						cell.setCellValue(headerList.get(Integer.toString(k)));
					} 
					//엑셀파일에 넣을 데이터를 세팅합니다.
					else {
						//i-1을하는이유는 headerList가 i번쨰 row이기 때문.
						//Map<String, String> excelData = data.get(i-1); 
						//리스트의 크기만큼 세팅합니다.
						list.put("0", paymentList.get(i-1).getProduct_name());
						list.put("1", product_price_List.get(i-1).toString());
						list.put("2", soldQuantityList.get(i-1).toString());
						list.put("3", String.format("%,d", Integer.parseInt( soldPriceList.get(i-1).toString() )));
						
					
						cell.setCellValue(list.get(Integer.toString(k)));
					}
				}
			}
			
			//엑셀파일 세팅 후 파일 생성
			try {

				FileOutputStream fileOutputStream = new FileOutputStream(new File("D:\\AnyShop\\매출(등수) 통계.xls"));
				//생성한 엑셀파일을 outputStream 해줍니다.
				workbook.write(fileOutputStream);
				fileOutputStream.close();
				workbook.close();
				logger.info("엑셀파일 완성");
								
				map1.put("result", 1);
				
			} catch(Exception e) {
				e.printStackTrace();
			}
						
			return map1;
	
		}
		
		// 전페 팔린 상품 보기 (관리자, 등수 x)  
		@RequestMapping(value = "allPaymentStatistics.do")
		public String allPaymentStatistics(Model model) {
			logger.info("Welcome adminController allPaymentStatistics! "+ new Date());
		
			List<Payment> paymentList = adminService.allPaymentStatistics();
			List<String> productImgList = new ArrayList<String>();
			
			for(int i=0; i < paymentList.size(); i++) {
				
				int product_id = paymentList.get(i).getProduct_id();				
				String product_img = adminService.productImgList(product_id);

				productImgList.add(product_img);
			
			}
			
			model.addAttribute("paymentList", paymentList);
			model.addAttribute("productImgList", productImgList);
			
			return "admin/admin2/allPaymentStatistics";
		}
		
		//전체 매출 데이터 엑셀파일로 만들기 (관리자)
		@ResponseBody
		@RequestMapping(value = "allPaymentExcel.do")
		public HashMap<String,Integer> allPaymentExcel() {
			
			HashMap<String,Integer> map1 = new HashMap<String,Integer>();
			 		
			List<Payment> paymentList = adminService.allPaymentStatistics();
			List<String> productImgList = new ArrayList<String>();  // 이미지 
			
			int product_id = 0;
			String product_img = null;			
			
			for(int i=0; i < paymentList.size(); i++) {
				
				product_id = paymentList.get(i).getProduct_id();				
				product_img = adminService.productImgList(product_id);

				productImgList.add(product_img);
			
			}
				
			// 엑셀파일 만들기 과정			
			Map<String,String> headerList = new HashMap<String,String>();
			Map<String,String> list = new HashMap<String,String>();
			
			//headerList를 세팅할 만큼 세팅합니다.
			headerList.put("0", "상품명");
			headerList.put("1", "상품 가격");
			headerList.put("2", "팔린 수량");
			headerList.put("3", "팔린 가격");			

			//XSSFWorkbook 세팅
			XSSFWorkbook workbook = new XSSFWorkbook();
			XSSFSheet sheet = workbook.createSheet("전체 매출 통계");
			XSSFRow row = null;
			XSSFCell cell = null;
			
			//data의 크기만큼 로우를 생성합니다.
			for(int i=0; i<= paymentList.size() ; i++) {
				
				row=sheet.createRow((short)i);
				
				//headerList의 크기만큼 i번째 row에 cell을 생성합니다.
				for(int k=0; k < headerList.size(); k++) {					
					
					cell=row.createCell(k);
					
					//맨윗줄에 headerList를 세팅합니다.
					if(i==0) {						
						//headerList의 데이터를 세팅
						cell.setCellValue(headerList.get(Integer.toString(k)));
					} 
					//엑셀파일에 넣을 데이터를 세팅합니다.
					else {
						//i-1을하는이유는 headerList가 i번쨰 row이기 때문.
						//Map<String, String> excelData = data.get(i-1); 
						//리스트의 크기만큼 세팅합니다.
						list.put("0", paymentList.get(i-1).getProduct_name());
						list.put("1", paymentList.get(i-1).getProduct_price());
						list.put("2", String.valueOf( paymentList.get(i-1).getProduct_quantity() ));
						list.put("3", String.format("%,d", Integer.parseInt(paymentList.get(i-1).getProduct_price().replaceAll(",", "")) *  paymentList.get(i-1).getProduct_quantity() ));
						
					
						cell.setCellValue(list.get(Integer.toString(k)));
					}
				}
			}
			
			//엑셀파일 세팅 후 파일 생성
			try {

				FileOutputStream fileOutputStream = new FileOutputStream(new File("D:\\AnyShop\\전체 매출 통계.xls"));
				//생성한 엑셀파일을 outputStream 해줍니다.
				workbook.write(fileOutputStream);
				fileOutputStream.close();
				workbook.close();
				logger.info("엑셀파일 완성");
								
				map1.put("result", 1);
				
			} catch(Exception e) {
				e.printStackTrace();
			}
						
			return map1;
	
		}
		
		//키워드 데이터 엑셀파일로 만들기 (관리자)
		@ResponseBody
		@RequestMapping(value = "allSearchBoxExcel.do")
		public HashMap<String,Integer> searchBoxExcel() {
			HashMap<String,Integer> map1 = new HashMap<String,Integer>();
			 		
			List<SearchBoxInfo> searchBoxList = adminService.allSearchBoxExcel();
		
			// 엑셀파일 만들기 		
			Map<String,String> headerList = new HashMap<String,String>();
			Map<String,String> list = new HashMap<String,String>();
			
			//headerList를 세팅할 만큼 세팅합니다.
			headerList.put("0", "나이");
			headerList.put("1", "성별");
			headerList.put("2", "검색 키워드");
			
			//XSSFWorkbook 세팅
			XSSFWorkbook workbook = new XSSFWorkbook();
			XSSFSheet sheet = workbook.createSheet("검색 키워드 통계");
			XSSFRow row = null;
			XSSFCell cell = null;
			
			//data의 크기만큼 로우를 생성합니다.
			for(int i=0; i<= searchBoxList.size() ; i++) {
				
				row=sheet.createRow((short)i);
				
				//headerList의 크기만큼 i번째 row에 cell을 생성합니다.
				for(int k=0; k < headerList.size(); k++) {					
					
					cell=row.createCell(k);
					
					//맨윗줄에 headerList를 세팅합니다.
					if(i==0) {						
						//headerList의 데이터를 세팅
						cell.setCellValue(headerList.get(Integer.toString(k)));
					} 
					//엑셀파일에 넣을 데이터를 세팅합니다.
					else {
						//i-1을하는이유는 headerList가 i번쨰 row이기 때문.
						//Map<String, String> excelData = data.get(i-1); 
						//리스트의 크기만큼 세팅합니다.
						list.put("0", String.valueOf(searchBoxList.get(i-1).getAge()));
						list.put("1", searchBoxList.get(i-1).getGender());
						list.put("2", searchBoxList.get(i-1).getSearchBox());
			
						cell.setCellValue(list.get(Integer.toString(k)));
					}
				}
			}
			
			//엑셀파일 세팅 후 파일 생성
			try {

				FileOutputStream fileOutputStream = new FileOutputStream(new File("D:\\AnyShop\\검색 키워드 통계.xls"));
				//생성한 엑셀파일을 outputStream 해줍니다.
				workbook.write(fileOutputStream);
				fileOutputStream.close();
				workbook.close();
				logger.info("엑셀파일 완성");
								
				map1.put("result", 1);
				
			} catch(Exception e) {
				e.printStackTrace();
			}
					
			return map1;
	
		}		

		//장바구니 데이터 엑셀파일로 만들기 (관리자)
		@ResponseBody
		@RequestMapping(value = "wishListExcel.do")
		public HashMap<String,Integer> wishListExcel() {
					
			HashMap<String,Integer> map1 = new HashMap<String,Integer>();
					 		
			List<WishListInfo> wishList = adminService.wishListExcel();
			List<String> product_kinds = new ArrayList<String>();
			List<String> product_detail = new ArrayList<String>();
			
			for(int l=0; l < wishList.size(); l++) {
				product_kinds.add( adminService.product_kinds( wishList.get(l).getProduct_id() ));
				product_detail.add( adminService.product_detail( wishList.get(l).getProduct_id() ));
			}
			// 엑셀파일 만들기 		
			Map<String,String> headerList = new HashMap<String,String>();
			Map<String,String> list = new HashMap<String,String>();
					
			//headerList를 세팅할 만큼 세팅합니다.
			headerList.put("0", "상품 대분류");
			headerList.put("1", "상품 소분류");
			headerList.put("2", "상품명");
			headerList.put("3", "사이즈");
			headerList.put("4", "색상");
			headerList.put("5", "수량");
			
					
			//XSSFWorkbook 세팅
			XSSFWorkbook workbook = new XSSFWorkbook();
			XSSFSheet sheet = workbook.createSheet("장바구니 통계");
			XSSFRow row = null;
			XSSFCell cell = null;
					
			//data의 크기만큼 로우를 생성합니다.
			for(int i=0; i<= wishList.size() ; i++) {
						
				row=sheet.createRow((short)i);
						
				//headerList의 크기만큼 i번째 row에 cell을 생성합니다.
				for(int k=0; k < headerList.size(); k++) {					
							
					cell=row.createCell(k);
							
					//맨윗줄에 headerList를 세팅합니다.
					if(i==0) {						
						//headerList의 데이터를 세팅
						cell.setCellValue(headerList.get(Integer.toString(k)));
					} 
					//엑셀파일에 넣을 데이터를 세팅합니다.
					else {
						//i-1을하는이유는 headerList가 i번쨰 row이기 때문.
						//Map<String, String> excelData = data.get(i-1); 
						//리스트의 크기만큼 세팅합니다.
						list.put("0", product_kinds.get(i-1).toString());
						list.put("1", product_detail.get(i-1).toString());
						list.put("2", wishList.get(i-1).getProduct_name());
						list.put("3", wishList.get(i-1).getProduct_size());
						list.put("4", wishList.get(i-1).getProduct_color());
						list.put("5", wishList.get(i-1).getProduct_quantity());	
					
						cell.setCellValue(list.get(Integer.toString(k)));
					}
				}
			}
					
			//엑셀파일 세팅 후 파일 생성
			try {

				FileOutputStream fileOutputStream = new FileOutputStream(new File("D:\\AnyShop\\장바구니 통계.xls"));
				//생성한 엑셀파일을 outputStream 해줍니다.
				workbook.write(fileOutputStream);
				fileOutputStream.close();
				workbook.close();
				logger.info("엑셀파일 완성");
										
				map1.put("result", 1);
						
			} catch(Exception e) {
				e.printStackTrace();
			}
										
			return map1;
			
		}	
		
		//리뷰 데이터 엑셀파일로 만들기 (관리자)
		@ResponseBody
		@RequestMapping(value = "reviewExcel.do")
		public HashMap<String,Integer> reviewExcel() {
					
			HashMap<String,Integer> map1 = new HashMap<String,Integer>();
					 		
			List<ReviewInfo> reviewList = adminService.reviewExcel();
			
			// 엑셀파일 만들기 		
			Map<String,String> headerList = new HashMap<String,String>();
			Map<String,String> list = new HashMap<String,String>();
					
			//headerList를 세팅할 만큼 세팅합니다.
			headerList.put("0", "상품명");
			headerList.put("1", "리뷰 점수");
			headerList.put("2", "나이");		
					
			//XSSFWorkbook 세팅
			XSSFWorkbook workbook = new XSSFWorkbook();
			XSSFSheet sheet = workbook.createSheet("리뷰 통계");
			XSSFRow row = null;
			XSSFCell cell = null;
					
			//data의 크기만큼 로우를 생성합니다.
			for(int i=0; i<= reviewList.size() ; i++) {
						
				row=sheet.createRow((short)i);
						
				//headerList의 크기만큼 i번째 row에 cell을 생성합니다.
				for(int k=0; k < headerList.size(); k++) {					
							
					cell=row.createCell(k);
							
					//맨윗줄에 headerList를 세팅합니다.
					if(i==0) {						
						//headerList의 데이터를 세팅
						cell.setCellValue(headerList.get(Integer.toString(k)));
					} 
					//엑셀파일에 넣을 데이터를 세팅합니다.
					else {
						//i-1을하는이유는 headerList가 i번쨰 row이기 때문.
						//Map<String, String> excelData = data.get(i-1); 
						//리스트의 크기만큼 세팅합니다.
						list.put("0", reviewList.get(i-1).getProduct_name());
						list.put("1", String.valueOf(reviewList.get(i-1).getReview_point()));
						list.put("2", String.valueOf(reviewList.get(i-1).getAge()));

					
						cell.setCellValue(list.get(Integer.toString(k)));
					}
				}
			}
					
			//엑셀파일 세팅 후 파일 생성
			try {

				FileOutputStream fileOutputStream = new FileOutputStream(new File("D:\\AnyShop\\리뷰 통계.xls"));
				//생성한 엑셀파일을 outputStream 해줍니다.
				workbook.write(fileOutputStream);
				fileOutputStream.close();
				workbook.close();
				logger.info("엑셀파일 완성");
										
				map1.put("result", 1);
						
			} catch(Exception e) {
				e.printStackTrace();
			}					
					
			return map1;
			
		}

		//전체 통계 엑셀파일로 만들기 (관리자)
		@ResponseBody
		@RequestMapping(value = "allStatistics.do")
		public HashMap<String,Integer> allStatistics() {
					
			HashMap<String,Integer> map1 = new HashMap<String,Integer>();
					 		
			List<Payment> allList = adminService.allExcel();
			
			// 엑셀파일 만들기 		
			Map<String,String> headerList = new HashMap<String,String>();
			Map<String,String> list = new HashMap<String,String>();
					
			//headerList를 세팅할 만큼 세팅합니다.
			headerList.put("0", "이름");
			headerList.put("1", "키");
			headerList.put("2", "나이");
			headerList.put("3", "성별");
			headerList.put("4", "몸무게");
			headerList.put("5", "상품명");
			headerList.put("6", "상품 가격");
			headerList.put("7", "상품 사이즈");
			headerList.put("8", "상품 색상");
					
			//XSSFWorkbook 세팅
			XSSFWorkbook workbook = new XSSFWorkbook();
			XSSFSheet sheet = workbook.createSheet("전체 통계");
			XSSFRow row = null;
			XSSFCell cell = null;
					
			//data의 크기만큼 로우를 생성합니다.
			for(int i=0; i<= allList.size() ; i++) {
						
				row=sheet.createRow((short)i);
						
				//headerList의 크기만큼 i번째 row에 cell을 생성합니다.
				for(int k=0; k < headerList.size(); k++) {					
							
					cell=row.createCell(k);
							
					//맨윗줄에 headerList를 세팅합니다.
					if(i==0) {						
						//headerList의 데이터를 세팅
						cell.setCellValue(headerList.get(Integer.toString(k)));
					} 
					//엑셀파일에 넣을 데이터를 세팅합니다.
					else {
						//i-1을하는이유는 headerList가 i번쨰 row이기 때문.
						//Map<String, String> excelData = data.get(i-1); 
						//리스트의 크기만큼 세팅합니다.
						list.put("0", allList.get(i-1).getName());
						list.put("1", String.valueOf(allList.get(i-1).getHeight()).replaceAll(",", ""));
						list.put("2", String.valueOf(allList.get(i-1).getAge()));
						list.put("3", allList.get(i-1).getGender());
						list.put("4", String.valueOf(allList.get(i-1).getWeight()));
						list.put("5", allList.get(i-1).getProduct_name());
						list.put("6", allList.get(i-1).getProduct_price().replaceAll(",", ""));
						list.put("7", allList.get(i-1).getProduct_size());
						list.put("8", allList.get(i-1).getProduct_color());

					
						cell.setCellValue(list.get(Integer.toString(k)));
					}
				}
			}
					
			//엑셀파일 세팅 후 파일 생성
			try {

				FileOutputStream fileOutputStream = new FileOutputStream(new File("D:\\AnyShop\\전체 통계.xls"));
				//생성한 엑셀파일을 outputStream 해줍니다.
				workbook.write(fileOutputStream);
				fileOutputStream.close();
				workbook.close();
				logger.info("엑셀파일 완성");
										
				map1.put("result", 1);
						
			} catch(Exception e) {
				e.printStackTrace();
			}					
					
			return map1;
			
		}
		
		// 주문 관리 ( 미 배송 주문 상품 가져오기)
		@RequestMapping(value = "delivery.do")
		public String delivery(Model model) {
			logger.info("Welcome adminController delivery! "+ new Date());
			

			List<Payment> deliveryList= new ArrayList<Payment>();
			deliveryList= adminService.selectDelivery();
			List<String> product_img_list= new ArrayList<String>();
			
			for(int i=0; i < deliveryList.size(); i++) {
				product_img_list.add( adminService.productImgList(deliveryList.get(i).getProduct_id()));
			}
									
			model.addAttribute("deliveryList",deliveryList);
			model.addAttribute("product_img_list",product_img_list);
			
			return "admin/admin2/allDelivery";
		}		
		
		// 주문 배송 시작하기 
		@RequestMapping(value = "deliveryStart.do")
		public String deliveryStart(Model model, @RequestParam int apply_num) {
			logger.info("Welcome adminController deliveryStart! "+ new Date());
			
			adminService.updatePaymentDelivery_state(apply_num);
			
			List<Payment> deliveryList = adminService.selectDeliveryStart();
			List<String> address = new ArrayList<String>();
			
			for(int i=0; i < deliveryList.size(); i++) {
				address = adminService.selectAddress(deliveryList.get(i).getId()); 
			}
			
			model.addAttribute("deliveryList", deliveryList);
			model.addAttribute("address", address);
						
			return "redirect:/showDeliveryStart.do";
		}	
		
		// 주문 관리 ( 배송 시작한 상품들)
		@RequestMapping(value = "showDeliveryStart.do")
		public String showDeliveryStart(Model model) {
			logger.info("Welcome adminController showDeliveryStart! "+ new Date());			
				
			List<Payment> deliveryList = adminService.selectDeliveryStart();
			List<String> address = new ArrayList<String>();
				
			for(int i=0; i < deliveryList.size(); i++) {
				address.add( adminService.selectAddress(deliveryList.get(i).getId()).toString() ); 
			}
				
			model.addAttribute("deliveryList", deliveryList);
			model.addAttribute("address", address);
				
				
			return "admin/admin2/deliveryStart";
		}
			
		// 주문 관리 ( 배송 시작한 상품들)
		@RequestMapping(value = "cancelDelivery.do")
		public String cancelDelivery(Model model) {
			logger.info("Welcome adminController cancelDelivery! "+ new Date());
								
			List<Payment> cancelDeliveryList = adminService.cancelDelivery();
			List<String> product_img = new ArrayList<String>();
				
			for(int i=0; i < cancelDeliveryList.size(); i++) {
				product_img.add( adminService.productImgList(cancelDeliveryList.get(i).getProduct_id()) ); 
			}
				
			model.addAttribute("cancelDeliveryList", cancelDeliveryList);
			model.addAttribute("product_img", product_img);
								
			return "admin/admin2/cancelDelivery";
		}
		
		// 매출통계 관리 ( 기간 선택 시 )
		@RequestMapping(value = "showSales.do")
		@ResponseBody
		public HashMap<String,String> showSales(Model model, @RequestParam String date ) {
			logger.info("Welcome adminController showSales! "+ new Date());
								
			HashMap<String, String> map = new HashMap<String, String>();					
			
			List<Payment> paymentList = adminService.showSales(date);			
		
			int january = 0;
			int february = 0;
			int march = 0;
			int april = 0;
			int may = 0;
			int june = 0;
			int july = 0;
			int august = 0;
			int september = 0;
			int october = 0;
			int nomember = 0;
			int december = 0;	
								
			for(int i=0; i < paymentList.size(); i++) {
				if( paymentList.get(i).getDate().substring(0,7).equals( date +  "-01"))  {
					january += Integer.parseInt( paymentList.get(i).getProduct_price().replaceAll(",", ""));
					map.put("january", String.valueOf(january)  );
				} else if ( paymentList.get(i).getDate().substring(0,7).equals( date + "-02")) {
					february += Integer.parseInt( paymentList.get(i).getProduct_price().replaceAll(",", ""));
					map.put("february", String.valueOf(february)  );
				} else if ( paymentList.get(i).getDate().substring(0,7).equals( date + "-03")) {
					march += Integer.parseInt( paymentList.get(i).getProduct_price().replaceAll(",", ""));
					map.put("march", String.valueOf(march)  );
				} else if ( paymentList.get(i).getDate().substring(0,7).equals( date + "-04")) {
					april += Integer.parseInt( paymentList.get(i).getProduct_price().replaceAll(",", ""));
					map.put("april", String.valueOf(april)  );
				} else if ( paymentList.get(i).getDate().substring(0,7).equals( date + "-05")) {
					may += Integer.parseInt( paymentList.get(i).getProduct_price().replaceAll(",", ""));
					map.put("may", String.valueOf(may)  );
				} else if ( paymentList.get(i).getDate().substring(0,7).equals( date + "-06")) {
					june += Integer.parseInt( paymentList.get(i).getProduct_price().replaceAll(",", ""));
					map.put("june", String.valueOf(june)  );
				} else if ( paymentList.get(i).getDate().substring(0,7).equals( date + "-07")) {
					july += Integer.parseInt( paymentList.get(i).getProduct_price().replaceAll(",", ""));
					map.put("july", String.valueOf(july)  );
				} else if (paymentList.get(i).getDate().substring(0,7).equals( date + "-08")) {
					august += Integer.parseInt( paymentList.get(i).getProduct_price().replaceAll(",", ""));
					map.put("august", String.valueOf(august)  );
				} else if (paymentList.get(i).getDate().substring(0,7).equals( date + "-09")) {
					september += Integer.parseInt( paymentList.get(i).getProduct_price().replaceAll(",", ""));
					map.put("september", String.valueOf(september)  );
				} else if (paymentList.get(i).getDate().substring(0,7).equals( date + "-10")) {
					october += Integer.parseInt( paymentList.get(i).getProduct_price().replaceAll(",", ""));
					map.put("october", String.valueOf(october)  );
				} else if (paymentList.get(i).getDate().substring(0,7).equals( date + "-11")) {
					nomember += Integer.parseInt( paymentList.get(i).getProduct_price().replaceAll(",", ""));
					map.put("nomember", String.valueOf(nomember)  );
				} else {
					december += Integer.parseInt( paymentList.get(i).getProduct_price().replaceAll(",", ""));
					map.put("december", String.valueOf(december)  );
				}
			}
			
			map.put("label", date + "년 매출 통계");
			map.put("result", "1");
								
			return map;
		}		
		
			
		
}		
