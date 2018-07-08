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
	  
	
}
