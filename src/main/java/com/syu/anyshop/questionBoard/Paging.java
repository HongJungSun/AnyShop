package com.syu.anyshop.questionBoard;

import lombok.Data;

@Data
public class Paging {
	
		private String keyword;
		private String searchBoard;
	    private int rowCount=10;    // 출력할 데이터 개수   
	    private int rowStart;		//  시작행번호          
	    private int rowEnd;         //  종료행 번호        
	    private int totalPage;		// 전체 페이수                            
	    private int totalRow;    	// 전체 데이터 수       
	    private int page= 1; 		//현재 페이지               
	    private int pageStart;      //시작페이지                 
	    private int pageEnd;        //종료페이지                
	        
	    
		public void pageCalculate(int total) {
			getPage();
	    	totalRow  = total;
	    	totalPage    = (int) ( total / rowCount );
	        
	        if ( total % rowCount > 0 ) {
	        	totalPage++;
	        } 

	        pageStart = (page - (page - 1) % 5) ;
	        
	        pageEnd = pageStart + 4;
	        
	        if (pageEnd > totalPage) {
	        	pageEnd = totalPage;
	        }
	        
	        rowStart = ((page - 1) * rowCount) + 1 ;
	        rowEnd = rowStart + rowCount -1;
	    } 			    	



}
