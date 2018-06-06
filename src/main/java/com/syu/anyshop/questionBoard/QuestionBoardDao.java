package com.syu.anyshop.questionBoard;

import java.util.List;

public interface QuestionBoardDao {

	List<QuestionBoard> viewAllQuestionBoard(Paging paging);
	
	List<QuestionBoard> viewAllQuestionBoard2(Paging paging);

	void insertQuestionBoard(String product_id, String title, String contents, String regi_id);

	QuestionBoard readBoard(int idx);

	QuestionBoard updateBoard(int idx);

	void updateBoardCommit(int idx, String title, String contents);

	void deleteBoard(int idx);

	void addHit_cnt(int idx);

	int selectRowCount(String product_id);
	
	int selectRowCount2(String product_id, String keyword, String searchBoard);

	List<QuestionBoard> searchBoardTitle(Paging paging, String searchBoard, String product_id);

	List<QuestionBoard> searchBoardContents(Paging paging, String searchBoard, String product_id);

	List<QuestionBoard> searchBoardRegi_id(Paging paging, String searchBoard, String product_id);

	int selectSearchRowCountTitle(String searchBoard, String product_id);

	int selectSearchRowCountContents(String searchBoard, String product_id);
	
	int selectSearchRowCountRegi_id(String searchBoard, String product_id);

	void regiReply(ReplyBoard replyBoard);

	List<ReplyBoard> selectReplyBoard(int idx);

	void deleteReplyBoard(int reply_no, int reparent, int board_no, int reparent2, int redepth, int reorder);





}
