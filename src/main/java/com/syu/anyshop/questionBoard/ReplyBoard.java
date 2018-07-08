package com.syu.anyshop.questionBoard;

import lombok.Data;

@Data
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




	
	
}
