package com.syu.anyshop.questionBoard;


public class QuestionBoard {
	  
	  private int idx;
	  private int product_id;	  
	  private String title;
	  private String contents;
	  private int hit_cnt;
	  private String del_state;
	  private String regi_date;
	  private String regi_id;
	  
	  
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title.replaceAll("(?i)<script", "&lt;script");
	}
	public String getContents() {
		return contents.replaceAll("(?i)<script", "&lt;script");
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getHit_cnt() {
		return hit_cnt;
	}
	public void setHit_cnt(int hit_cnt) {
		this.hit_cnt = hit_cnt;
	}
	public String getDel_state() {
		return del_state;
	}
	public void setDel_state(String del_state) {
		this.del_state = del_state;
	}
	public String getRegi_date() {
		return regi_date;
	}
	public void setRegi_date(String regi_date) {
		this.regi_date = regi_date;
	}
	public String getRegi_id() {
		return regi_id;
	}
	public void setRegi_id(String regi_id) {
		this.regi_id = regi_id;
	}
	@Override
	public String toString() {
		return "QuestionBoard [idx=" + idx + ", product_id=" + product_id + ", title=" + title + ", contents="
				+ contents + ", hit_cnt=" + hit_cnt + ", del_state=" + del_state + ", regi_date=" + regi_date
				+ ", regi_id=" + regi_id + "]";
	}
	  
	  
	


	
	  
	  

	
}
