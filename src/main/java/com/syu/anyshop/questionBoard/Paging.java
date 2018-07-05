package com.syu.anyshop.questionBoard;

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

	    public String getKeyword() {
			return keyword;
		}

		public void setKeyword(String keyword) {
			this.keyword = keyword;
		}
		
		public String getSearchBoard() {
			return searchBoard;
		}

		public void setSearchBoard(String searchBoard) {
			this.searchBoard = searchBoard;
		}

		public int getRowCount() {
			return rowCount;
		}	    


		public void setRowCount(int rowCount) {
			this.rowCount = rowCount;
		}


		public int getRowStart() {
			return rowStart;
		}



		public void setRowStart(int rowStart) {
			this.rowStart = rowStart;
		}



		public int getRowEnd() {
			return rowEnd;
		}



		public void setRowEnd(int rowEnd) {
			this.rowEnd = rowEnd;
		}



		public int getTotalPage() {
			return totalPage;
		}



		public void setTotalPage(int totalPage) {
			this.totalPage = totalPage;
		}



		public int getTotalRow() {
			return totalRow;
		}



		public void setTotalRow(int totalRow) {
			this.totalRow = totalRow;
		}



		public int getPage() {
			return page;
		}



		public void setPage(int page) {
			this.page = page;
		}



		public int getPageStart() {
			return pageStart;
		}



		public void setPageStart(int pageStart) {
			this.pageStart = pageStart;
		}



		public int getPageEnd() {
			return pageEnd;
		}



		public void setPageEnd(int pageEnd) {
			this.pageEnd = pageEnd;
		}


		@Override
		public String toString() {
			return "Paging [keyword=" + keyword + ", searchBoard=" + searchBoard + ", rowCount=" + rowCount
					+ ", rowStart=" + rowStart + ", rowEnd=" + rowEnd + ", totalPage=" + totalPage + ", totalRow="
					+ totalRow + ", page=" + page + ", pageStart=" + pageStart + ", pageEnd=" + pageEnd + "]";
		}




	    


}
