package com.syu.anyshop.paging;

import lombok.Data;

@Data
public class Page {
	
	private int totalCount;    // 전체 게시물 개수
	private int pageNum; 	   // 현재 페이지번호
	private int contentNum;    // 한 페이지에 몇개표시 할지(초기화 필요)
	private int startPage;     // 현제 페이지 블록의 시작 페이지
	private int endPage;       // 현제 페이지 블록의 마지막 페이지
	private boolean prev = false;      // 이전 페이지로 가는 화살표
	private boolean next;      // 다음 페이지로 가는 화살표
	private int currentBlock;  // 현제 페이지 블록
	private int  lastBlock;    // 마지막 페이지 블록
	
	
	// 첫 블록일때 이전페이지 x 다음 페이지 o , 중간 블록일떄 이전,다음 oo , 마지막 블록일때 이전o 다음x 
	public void prevNext(int pageNum) {
		
		if(totalCount < 51) {
			setPrev(false);
			setNext(false);
		} else if( pageNum > 0 && pageNum < 6) {
			setPrev(false);
			setNext(true);
		} else if (getLastBlock() == getCurrentBlock()) {
			setPrev(true);
			setNext(false);
		} else {
			setPrev(true);
			setNext(true);
		}
	}
	
	
	
	// 전체 페이지 수를 계산하는 메소드
	public int calcPage(int totalCount, int contentNum) {
		int totalPage = totalCount / contentNum;
		
		if(totalPage % contentNum > 0 ) {
			totalPage++;
		}
		return totalPage;
	}
	
	
	public void getStartPage(int currentBlock) {
		// 5개씩 보여주기
		this.startPage = (currentBlock * 5) - 4;
	}
	
	
	// 마지막 블록에서 마지막 페이지 구하기
	public void setEndPage(int lastBlock, int currentBlock) {
		if(lastBlock == currentBlock) {
			this.endPage = calcPage(getTotalCount(), getContentNum());
		} else {
			this.endPage = getStartPage() + 4;
		}
	}
	
	// 현재 페이지 블록 구하기 (현제 페이지번호로)
	public void setCurrentBlock(int pageNum) {
		this.currentBlock = pageNum / 5;
		if(pageNum % 5 > 0) {
			this.currentBlock++;
		}
	}
	
	// 마지막 페이지 블록 구하기(총 게시물 갯수로 )
	public void setLastBlock(int totalCount) {
		this.lastBlock = totalCount / (5 * this.contentNum);
		if(totalCount % ( 5 * this.contentNum) > 0) {
			this.lastBlock++;
		}
	}
	
}
