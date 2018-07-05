package com.syu.anyshop.questionBoard;

public class ReplyBoard {
	
	private String board_no;             // 게시물 번호
	private String reply_no;             // 댓글 번호
	private String reply_writer;         // 작성자
	private String reply_contents;       // 댓글 내용
	private String reply_regi_date;      // 작성 일자
	private String reply_del_state;      // 삭제 여부
	private String reparent;			 // 부모 글 번호 (무한댓글)
	private Integer reparent2;            // 꼭대기 부모 글 번호(무한댓글)
    private Integer redepth;              // 글 깊이(무한댓글)
    private Integer reorder;             // 글 순서(무한댓글)

	
	
	public ReplyBoard() {
		super();
	}


	public String getBoard_no() {
		return board_no;
	}


	public void setBoard_no(String board_no) {
		this.board_no = board_no;
	}


	public String getReply_no() {
		return reply_no;
	}


	public void setReply_no(String reply_no) {
		this.reply_no = reply_no;
	}


	public String getReply_writer() {
		return reply_writer;
	}


	public void setReply_writer(String reply_writer) {
		this.reply_writer = reply_writer;
	}


	public String getReply_contents() {
		return reply_contents;
	}


	public void setReply_contents(String reply_contents) {
		this.reply_contents = reply_contents;
	}


	public String getReply_regi_date() {
		return reply_regi_date;
	}


	public void setReply_regi_Date(String reply_regi_date) {
		this.reply_regi_date = reply_regi_date;
	}


	public String getReply_del_state() {
		return reply_del_state;
	}


	public void setReply_del_state(String reply_del_state) {
		this.reply_del_state = reply_del_state;
	}


	public String getReparent() {
		return reparent;
	}


	public void setReparent(String reparent) {
		this.reparent = reparent;
	}


	public Integer getRedepth() {
		return redepth;
	}


	public void setRedepth(Integer redepth) {
		this.redepth = redepth;
	}


	public Integer getReorder() {
		return reorder;
	}


	public void setReorder(Integer reorder) {
		this.reorder = reorder;
	}
	
	


	public Integer getReparent2() {
		return reparent2;
	}


	public void setReparent2(Integer reparent2) {
		this.reparent2 = reparent2;
	}


	@Override
	public String toString() {
		return "ReplyBoard [board_no=" + board_no + ", reply_no=" + reply_no + ", reply_writer=" + reply_writer
				+ ", reply_contents=" + reply_contents + ", reply_regi_date=" + reply_regi_date + ", reply_del_state="
				+ reply_del_state + ", reparent=" + reparent + ", reparent2=" + reparent2 + ", redepth=" + redepth
				+ ", reorder=" + reorder + "]";
	}






	
	
}
