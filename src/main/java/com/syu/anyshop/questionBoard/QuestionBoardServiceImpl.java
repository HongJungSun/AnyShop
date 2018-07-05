package com.syu.anyshop.questionBoard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QuestionBoardServiceImpl implements QuestionBoardService {

	@Autowired
	private QuestionBoardDao questionBoardDao;
	
	@Override
	public List<QuestionBoard> viewAllQuestionBoard(Paging paging) {

		return questionBoardDao.viewAllQuestionBoard(paging);
	}
	
	@Override
	public List<QuestionBoard> viewAllQuestionBoard2(Paging paging) {
		
		return questionBoardDao.viewAllQuestionBoard2(paging);
	}


	@Override
	public void insertQuestionBoard(String product_id, String title, String contents, String regi_id) {

		questionBoardDao.insertQuestionBoard(product_id, title, contents, regi_id);
		return;
	}

	@Override
	public QuestionBoard readBoard(int idx) {
		
		return questionBoardDao.readBoard(idx);
	}

	@Override
	public QuestionBoard updateBoard(int idx) {

		return questionBoardDao.updateBoard(idx);
		
	}

	@Override
	public void updateBoardCommit(int idx, String title, String contents) {
		
		questionBoardDao.updateBoardCommit(idx, title, contents);
		return ;
	}

	@Override
	public void deleteBoard(int idx) {
		questionBoardDao.deleteBoard(idx);
		return ;
		
	}

	@Override
	public void addHit_cnt(int idx) {
		questionBoardDao.addHit_cnt(idx);
		return ;
	}

	@Override
	public int selectRowCount(String product_id) {
		
		return questionBoardDao.selectRowCount(product_id);
	}
	
	@Override
	public int selectRowCount2(String product_id, String keyword, String searchBoard) {
		
		return questionBoardDao.selectRowCount2(product_id, keyword, searchBoard);
	}

	@Override
	public List<QuestionBoard> searchBoardTitle(Paging paging, String searchBoard, String product_id) {

		return questionBoardDao.searchBoardTitle(paging, searchBoard, product_id);
	}

	@Override
	public List<QuestionBoard> searchBoardContents(Paging paging, String searchBoard, String product_id) {

		return questionBoardDao.searchBoardContents(paging, searchBoard, product_id);
	}

	@Override
	public List<QuestionBoard> searchBoardRegi_id(Paging paging, String searchBoard, String product_id) {
		
		return questionBoardDao.searchBoardRegi_id(paging, searchBoard, product_id);
	}

	@Override
	public int selectSearchRowCountTitle(String searchBoard, String product_id) {

		return questionBoardDao.selectSearchRowCountTitle(searchBoard, product_id);
	}
	
	@Override
	public int selectSearchRowCountContents(String searchBoard, String product_id) {

		return questionBoardDao.selectSearchRowCountContents(searchBoard, product_id);
	}
	
	@Override
	public int selectSearchRowCountRegi_id(String searchBoard, String product_id) {

		return questionBoardDao.selectSearchRowCountRegi_id(searchBoard, product_id);
	}

	@Override
	public void regiReply(ReplyBoard replyBoard) {
		
		questionBoardDao.regiReply(replyBoard);
		return ;
	}

	@Override
	public List<ReplyBoard> selectReplyBoard(int idx) {

		return questionBoardDao.selectReplyBoard(idx);
	}

	@Override
	public void deleteReplyBoard(int reply_no, int reparent, int board_no, int reparent2, int redepth, int reorder) {
		
		questionBoardDao.deleteReplyBoard(reply_no, reparent, board_no, reparent2, redepth, reorder);
		return; 
	}




}
