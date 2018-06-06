package com.syu.anyshop.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.syu.anyshop.searchBox.SearchBoxService;

@Controller
public class SearchBoxController {
	private static final Logger logger = LoggerFactory.getLogger(SearchBoxController.class);
	
	@Autowired
	private SearchBoxService searchBoxService;
	
	
	@RequestMapping( value="searchBoxClick.do")
	public String searchBoxClick (RedirectAttributes redirectAttributes, @RequestParam String searchBox, @RequestParam String id, @RequestParam int age, @RequestParam String gender) {
		logger.info("----------- 연관 검색어 검색 컨트롤러 --------------");	
		
		searchBoxService.regiSearchBox(searchBox, id, age, gender);
		
		redirectAttributes.addAttribute("searchBox", searchBox);
		
		return "redirect:/productNameProductInfo.do";
		
	}
  
}
