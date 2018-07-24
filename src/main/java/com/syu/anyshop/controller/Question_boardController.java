package com.syu.anyshop.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.syu.anyshop.product.ProductInfo;
import com.syu.anyshop.product.ProductService;
import com.syu.anyshop.questionBoard.Paging;
import com.syu.anyshop.questionBoard.QuestionBoard;
import com.syu.anyshop.questionBoard.QuestionBoardService;
import com.syu.anyshop.questionBoard.ReplyBoard;

@Controller
public class Question_boardController {

	@Autowired
	private QuestionBoardService questionBoardService;

	@Autowired
	private ProductService productService;

	// 상품 문의 글 작성하기 페이지
	@RequestMapping(value = "questionBoardWrite.do")
	public ModelAndView questionBoardWrite(@RequestParam String product_id) throws Exception {
		;

		ModelAndView mv = new ModelAndView("question_board/questionBoard_Write");

		ProductInfo productInfo = productService.viewProduct(product_id);

		mv.addObject("productInfo", productInfo);

		return mv;
	}

	// 상품문의 글 저장하기
	@RequestMapping(value = "insertQuestionBoard.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String insertQuestionBoard(@RequestParam String product_id, @RequestParam String title,
			@RequestParam String contents, @RequestParam String regi_id) {

		questionBoardService.insertQuestionBoard(product_id, title, contents, regi_id);

		return "redirect:/viewProduct.do?product_id=" + product_id;

	}

	// 상품문의 글 읽기
	@RequestMapping(value = "readBoard.do")
	public String readBoard(Model model, @RequestParam int idx) {

		QuestionBoard board = questionBoardService.readBoard(idx);
		List<ReplyBoard> replyBoardList = questionBoardService.selectReplyBoard(idx);

		questionBoardService.addHit_cnt(idx);

		model.addAttribute("board", board);
		model.addAttribute("replyBoardList", replyBoardList);

		return "question_board/readBoard";

	}

	// 상품문의 글 수정 페이지
	@RequestMapping(value = "updateBoard.do")
	public String updateBoard(Model model, @RequestParam int idx) {

		QuestionBoard board = questionBoardService.updateBoard(idx);
		model.addAttribute("board", board);

		return "question_board/updateBoard";
	}

	// 상품문의 글 수정 완료
	@RequestMapping(value = "updateBoardCommit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String updateBoardCommit(Model model, @RequestParam int idx, @RequestParam String product_id,
			@RequestParam String title, @RequestParam String contents) {

		questionBoardService.updateBoardCommit(idx, title, contents);

		return "redirect:/viewProduct.do?product_id=" + product_id;
	}

	// 상품문의 글 삭제 (DEL_STATE를 y로 바꿈)
	@RequestMapping(value = "deleteBoard.do")
	public String deleteBoard(Model model, @RequestParam int idx, @RequestParam String product_id) {

		questionBoardService.deleteBoard(idx);

		return "redirect:/viewProduct.do?product_id=" + product_id;
	}

	// 상품문의 글 검색
	@RequestMapping(value = "searchBoard.do")
	public String deleteBoard(Model model, Paging paging, @RequestParam String keyword,
			@RequestParam String searchBoard, @RequestParam String product_id) {

		List<QuestionBoard> list = new ArrayList<QuestionBoard>();

		if (keyword.equals("title")) {
			paging.setKeyword(keyword);
			paging.pageCalculate(questionBoardService.selectSearchRowCountTitle(searchBoard, product_id));
			list = questionBoardService.searchBoardTitle(paging, searchBoard, product_id);
		} else if (keyword.equals("contents")) {
			paging.setKeyword(keyword);
			paging.pageCalculate(questionBoardService.selectSearchRowCountContents(searchBoard, product_id));
			list = questionBoardService.searchBoardContents(paging, searchBoard, product_id);
		} else {
			paging.setKeyword(keyword);
			paging.pageCalculate(questionBoardService.selectSearchRowCountRegi_id(searchBoard, product_id));
			list = questionBoardService.searchBoardRegi_id(paging, searchBoard, product_id);
		}

		ProductInfo productInfo = productService.viewProduct(product_id);

		model.addAttribute("list", list);
		model.addAttribute("productInfo", productInfo);
		model.addAttribute("paging", paging);

		return "product/viewProduct";
	}

	// 상품문의 글 답변
	@RequestMapping(value = "regiReply.do")
	public String regiReply(Model model, ReplyBoard replyBoard) {

		questionBoardService.regiReply(replyBoard);

		return "redirect:/readBoard.do?idx=" + replyBoard.getBoard_no();
	}

	// 상품문의 댓글 글 삭제
	@RequestMapping(value = "deleteReplyBoard.do")
	public String deleteReplyBoard(Model model, @RequestParam int reply_no, @RequestParam int reparent,
			@RequestParam int board_no, @RequestParam int reparent2, @RequestParam int redepth, @RequestParam int idx,
			@RequestParam int reorder) {

		questionBoardService.deleteReplyBoard(reply_no, reparent, board_no, reparent2, redepth, reorder);

		return "redirect:/readBoard.do?idx=" + idx;
	}

}