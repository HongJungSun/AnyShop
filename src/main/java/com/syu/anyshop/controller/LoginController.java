package com.syu.anyshop.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.syu.anyshop.login.LoginInfo;
import com.syu.anyshop.login.LoginService;
import com.syu.anyshop.product.ProductInfo;

@Controller
public class LoginController {
	
	@Autowired
	private LoginService loginService;

	
	//메인 페이지 
	@RequestMapping(value = "main.do")
	public String main(Model model, HttpServletRequest request) {
		
		List<ProductInfo> productInfo= new ArrayList<ProductInfo>(); // 메인 화면 (최신 상품 5개)
 		
		productInfo= loginService.mainScreen();
		model.addAttribute("productInfo",productInfo);
				
		
		return "home/home";
	}
	
	//로그인
	@RequestMapping(value = "login.do")
	public String main(Model model) {
		
		return "login/login";
	}
	
	//로그인 결과
	@RequestMapping(value = "loginAfter.do")
	public String loginCheck(Model model, LoginInfo loginInfo, HttpServletRequest request) {
               
        if((loginInfo.getId() != null && !loginInfo.getId().equals("")
                && loginInfo.getPw() != null && !loginInfo.getPw().equals(""))){
             
        		boolean check = loginService.loginCheck(loginInfo);
        		
            if(check == true){
            	
            	if(loginInfo.getId().equals("hjs9760")) {
            		
            		LoginInfo loginInfo2 = loginService.viewMember(loginInfo);
                    request.getSession().setAttribute("login", 0);
                  /*  request.getSession().setMaxInactiveInterval(30*60); //10분*/
                    
                    request.getSession().setAttribute("id", "hjs9760");
                    request.getSession().setAttribute("age", loginInfo2.getAge());
                    request.getSession().setAttribute("gender", loginInfo2.getGender());
                    request.getSession().setAttribute("name", loginInfo2.getName());
                    request.getSession().setAttribute("loginInfo", loginInfo2);

            		return "forward:/main.do";
            		
            	} else {
	            	LoginInfo loginInfo2 = loginService.viewMember(loginInfo);
	                request.getSession().setAttribute("login", 0);
	                /*request.getSession().setMaxInactiveInterval(30*60); //10분*/	
	                
	                request.getSession().setAttribute("loginInfo", loginInfo2);
	                request.getSession().setAttribute("id", loginInfo2.getId());
	                request.getSession().setAttribute("age", loginInfo2.getAge());
	                request.getSession().setAttribute("gender", loginInfo2.getGender());
	                request.getSession().setAttribute("name", loginInfo2.getName());	                
	                
	                return "forward:/main.do";
            	}
            } else {

            	return "redirect:/main.do";
            }   
        }

        return "forward:/main.do";
    }
	
	//로그아웃
	@RequestMapping(value = "logout.do")
	public String logout(Model model, HttpServletRequest request) {
		
		request.getSession().invalidate();
		return "redirect:/main.do";
	}
	
	//회원가입
	@RequestMapping(value = "regi.do")
	public String regi(Model model) {
		
		return "regi";
	}
	
	//회원가입 결과
	@RequestMapping(value = "regiAfter.do")
	public String regiAfter(LoginInfo loginInfo) {
		
		loginService.addMember(loginInfo);
		
		return "redirect:/main.do";
	}
	
	//마이페이지
	@RequestMapping(value = "mypage.do")
	public String mypage() {		
		
		return "login/mypage";
	}
	
	//내정보 수정 하기전 보안 체크
	@RequestMapping(value = "update_info.do")
	public String update_info(LoginInfo loginInfo) {
		
		return "login/updateMyInfoCheck";
	}
	
	// 내 정보 수정 페이지
	@RequestMapping(value = "update_infoCheck.do")
	public String update_infoCheck(LoginInfo loginInfo) {
		
		return "login/updateMyInfo";
	}
	
	
	//내정보 수정 결과
	@RequestMapping(value = "updateAfter.do")
	public String updateAfter(LoginInfo loginInfo, HttpServletRequest request) {
		
		loginService.updateMember(loginInfo);
		request.getSession().invalidate();
		
		return "redirect:/main.do";
	}
	
	//회원 탈퇴
	@RequestMapping(value = "delete.do")
	public String delete(@RequestParam String id, Model model, HttpServletRequest request) {

		loginService.deleteMember(id);
		request.getSession().invalidate();
		
		return "redirect:/login.do";
	}  
	
	//아이디 찾기
	@RequestMapping(value = "findId.do")
	public String findId(Model model) {
		
		return "login/findId";
	}  
	
	//아이디 찾기 결과
	@RequestMapping(value = "findIdAfter.do")
	public String findIdAfter(@RequestParam String name, @RequestParam String phone, Model model) {

		String id = loginService.findId(name, phone);
		
		model.addAttribute("id", id);

		return "login/findIdAfter";

	}  
	
	//비밀번호 찾기
	@RequestMapping(value = "findPw.do")
	public String findPw(Model model) {
		
		return "login/findPw";
	}  
	
	//비밀번호 찾기 결과
	@RequestMapping(value = "findPwAfter.do")
	public String findPwAfter(@RequestParam String id, @RequestParam String name, @RequestParam String phone, Model model) {

		String pw = loginService.findPw(id, name, phone);
		
		model.addAttribute("pw",pw);
		
		return "login/findPwAfter";
	}  
	
	//비밀번호 찾고 암호변경 후
	@RequestMapping(value = "updatePw.do")
	public String updatePw(@RequestParam String id, @RequestParam String pw) {
		
		loginService.updatePw(id, pw);
		
		return "home/home";
	} 
	
	
	
	// 회원가입 검증
	@RequestMapping(value = "UserCheckServlet.do")
	@ResponseBody
	public Map<String, Integer> UserCheckServlet(HttpServletRequest request, HttpServletResponse response) {
		
		String id= request.getParameter("id");
		int result= loginService.userCheck(id);

		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("result", result);

		return map;

	}
	
	// 로그인 검증
	@RequestMapping(value = "checkIdPw.do")
	@ResponseBody
	public Map<String, Integer> checkIdPw(HttpServletRequest request, HttpServletResponse response) {
		
		String id= request.getParameter("id");
		String pw= request.getParameter("pw");
			
		int result= loginService.checkIdPw(id,pw);

		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("result", result);

			
		return map;

	}
	
	// 인기 상품
	@RequestMapping(value = "polpularProduct.do")
	public String polpularProduct(Model model) {

		List<String> product_id_list = loginService.selectPopularProduct_id();	
		List<ProductInfo> productList  = new ArrayList<ProductInfo>();
		
		for(String product_id : product_id_list) {
			productList = loginService.selectPopularProduct(product_id);
		}
		
		model.addAttribute("productList", productList);
			
		return "product/popularProduct";

	}	
	
	// 계절별 상품
	@RequestMapping(value = "season.do")
	public String spring(Model model, @RequestParam String keyword) {

		List<ProductInfo> productList  = loginService.selectSeasonProduct(keyword);
				
		model.addAttribute("productList", productList);
		model.addAttribute("keyword", keyword);
		
		return "product/seasonProduct";

	}		
	
	
	
	
}