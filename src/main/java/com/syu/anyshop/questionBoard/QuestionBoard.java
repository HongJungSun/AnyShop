package com.syu.anyshop.questionBoard;

import lombok.Data;

@Data
public class QuestionBoard {
	  
	  private int idx;
	  private int product_id;	  
	  private String title;
	  private String contents;
	  private int hit_cnt;
	  private String del_state;
	  private String regi_date;
	  private String regi_id;
	  
	  
	  // 스크립트문 실행 방지
	  /*  public String getContents() {
	        return this.contents.replaceAll("(?i)<script", "&lt;script");
	    }*/
	    
	    // 스크립트문 실행 방지
	 /*   public String getTitle() {
	        return this.title.replaceAll("(?i)<script", "&lt;script");
	    }*/

	
}
