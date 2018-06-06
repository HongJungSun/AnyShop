package com.syu.anyshop.questionBoard;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QuestionBoardDaoImpl implements QuestionBoardDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<QuestionBoard> viewAllQuestionBoard(Paging paging) {

		return sqlSession.selectList("questionBoard.viewAllQuestionBoard", paging);
	}
	
	@Override
	public List<QuestionBoard> viewAllQuestionBoard2(Paging paging) {
		
		
		return sqlSession.selectList("questionBoard.viewAllQuestionBoard2", paging);
	}


	@Override
	public void insertQuestionBoard(String product_id, String title, String contents, String regi_id) {
		
		HashMap<String, String> map= new HashMap<String, String>();
		map.put("product_id", product_id);
		map.put("title", title);
		map.put("contents", contents);
		map.put("regi_id", regi_id);
		
		sqlSession.insert("questionBoard.insertQuestionBoard", map);
		return ;
	}

	@Override
	public QuestionBoard readBoard(int idx) {

		return sqlSession.selectOne("questionBoard.readBoard", idx);
	}

	@Override
	public QuestionBoard updateBoard(int idx) {
		
		return sqlSession.selectOne("questionBoard.updateBoard", idx);
		
	}

	@Override
	public void updateBoardCommit(int idx, String title, String contents) {
		
		HashMap<String, String> map= new HashMap<String, String>();
		map.put("idx", String.valueOf(idx));
		map.put("title", title);
		map.put("contents", contents);
		
		sqlSession.update("questionBoard.updateBoardCommit", map);
		return ;
	}

	@Override
	public void deleteBoard(int idx) {
		sqlSession.delete("questionBoard.deleteBoard", idx);
		return ;
	}

	@Override
	public void addHit_cnt(int idx) {
		sqlSession.delete("questionBoard.addHit_cnt", idx);
		return ;
		
	}

	@Override
	public int selectRowCount(String product_id) {

		return sqlSession.selectOne("questionBoard.selectRowCount", product_id);
	}
	
	@Override
	public int selectRowCount2(String product_id, String keyword, String searchBoard) {
		
		HashMap<String, String> map = new HashMap<String,String>();
		map.put("product_id", product_id);
		map.put("keyword", keyword);
		map.put("searchBoard", searchBoard);
			
		return sqlSession.selectOne("questionBoard.selectRowCount2", map);
	}


	@Override
	public List<QuestionBoard> searchBoardTitle(Paging paging, String searchBoard, String product_id) {

		HashMap<String, String> map= new HashMap<String, String>();
		map.put("rowStart", String.valueOf(paging.getRowStart()));
		map.put("searchBoard", searchBoard);
		map.put("product_id", product_id);
		
		return sqlSession.selectList("questionBoard.searchBoardTitle", map);
	}

	@Override
	public List<QuestionBoard> searchBoardContents(Paging paging, String searchBoard, String product_id) {
		
		HashMap<String, String> map= new HashMap<String, String>();
		map.put("rowStart", String.valueOf(paging.getRowStart()));
		map.put("searchBoard", searchBoard);
		map.put("product_id", product_id);
		
		return sqlSession.selectList("questionBoard.searchBoardContents", map);
	}

	@Override
	public List<QuestionBoard> searchBoardRegi_id(Paging paging, String searchBoard, String product_id) {
		
		HashMap<String, String> map= new HashMap<String, String>();
		map.put("rowStart", String.valueOf(paging.getRowStart()));
		map.put("searchBoard", searchBoard);
		map.put("product_id", product_id);
		
		return sqlSession.selectList("questionBoard.searchBoardRegi_id", map);
	}

	@Override
	public int selectSearchRowCountTitle(String searchBoard, String product_id) {
		
		HashMap<String, String> map= new HashMap<String, String>();
		map.put("searchBoard", searchBoard);
		map.put("product_id", product_id);
		
		return sqlSession.selectOne("questionBoard.selectSearchRowCountTitle", map);
	}

	@Override
	public int selectSearchRowCountContents(String searchBoard, String product_id) {
		
		HashMap<String, String> map= new HashMap<String, String>();
		map.put("searchBoard", searchBoard);
		map.put("product_id", product_id);
		
		return sqlSession.selectOne("questionBoard.selectSearchRowCountContents", map);
	}
	
	@Override
	public int selectSearchRowCountRegi_id(String searchBoard, String product_id) {
		
		HashMap<String, String> map= new HashMap<String, String>();
		map.put("searchBoard", searchBoard);
		map.put("product_id", product_id);
		
		return sqlSession.selectOne("questionBoard.selectSearchRowCountRegi_id", map);
	}

	@Override
	public void regiReply(ReplyBoard replyBoard) {
		
		// insert문
		if (replyBoard.getReply_no()==null || "".equals(replyBoard.getReply_no())) {
			
			// 부모 댓글이 비어있지 않을때 (댓글에 댓글)
			if(replyBoard.getReparent() != null) {
				// 부모 댓글에 관한 정보를 가져온다.
				ReplyBoard replyInfo = sqlSession.selectOne("questionBoard.selectReplyBoardReparent", replyBoard.getReparent());
				// 새로 글을 넣을 replyboard 깊이와 순서를 +1 씩 증가시킨다 (DB딴에서 해야지 +1이됨 db에 int타입).
				replyBoard.setRedepth(replyInfo.getRedepth() + 1);
				replyBoard.setReorder(replyInfo.getReorder() + 1);				
				// 미리 부모 댓글에 reorder 값보다 큰 게시글 번호에 reorder 값을 +1 증가 시킨다.
                sqlSession.update("questionBoard.updateReplyBoardReorder", replyInfo);
                
            // 부모 댓글이 비어있을때 (게시판 글에 대한 댓글)    
			} else {
				// 새로넣을 게시글 번호 reorder 지정
                Integer reorder = sqlSession.selectOne("questionBoard.selectReplyBoardMaxOrder", replyBoard.getBoard_no());
                replyBoard.setReorder(reorder);

			}
			
			sqlSession.insert("questionBoard.regiReply", replyBoard);
			
		// update 문	
        } else {

        	sqlSession.update("questionBoard.updateReply", replyBoard);	
        }

		return ;
	}

	@Override
	public List<ReplyBoard> selectReplyBoard(int idx) {

		return sqlSession.selectList("questionBoard.selectReplyBoard", idx);
	}

	@Override
	public void deleteReplyBoard(int reply_no, int reparent, int board_no, int reparent2, int redepth, int reorder) {
		
		HashMap <String, Integer> map = new HashMap<String, Integer>();
		map.put("reply_no", reply_no);
		map.put("board_no", board_no);
		map.put("reparent2", reparent2);
		map.put("redepth", redepth);
		map.put("reorder", reorder);
		
		// 꼭대기부모댓글이 자기 자신인 댓글(다른 reorder 값 변경 후  자식댓글 까지 모두삭제)
		if(reply_no == reparent) {		
			sqlSession.delete("questionBoard.deleteReplyBoard", map);
			return ;
			// 꼭대기 부모댓글이 자시자신이 아닐경우 
		} else {
			sqlSession.update("questionBoard.updateReplyBoardBeforeDelete", map);
			sqlSession.delete("questionBoard.deleteReplyBoard", map);
			return ;
		}
	}



}
