package com.kktshop.util;

public class PageMaker {
	private int bnum;	/* 임시 번호 : PAGE_PER_POST */
	private int startPost; /* 현재 페이지의 시작 글 */
	private int endPost; /* 현재 페이지의 마지막 글 */
	private int totPost; /* 전체 글의 수 */
	private int curPage; /* 현재 페이지 번호 */
	private int startPage; /* 현재 블록의 시작 페이지 번호 */
	private int endPage; /* 현재 블록의 끝 페이지 번호 */
	private int prevPage; /* 현재 페이지의 이전 페이지 번호 */
	private int nextPage; /* 현재 페이지의 다음 페이지 번호 */
	private int totPage; /* 전체 페이지 수 */
	private int curBlock; /* 현재 블록 번호 */
	private int startBlock; /* 현재 블록 시작의 페이지 번호 */
	private int endBlock; /* 현재 블록 끝의 페이지 번호 */
	private int prevBlock; /* 이전 블록의 끝 페이지 번호 */ 
	private int nextBlock; /* 다음 블록의 시작 페이지 번호 */
	private int totBlock;	/* 전체 블록 수 */
	public int PAGE_PER_POST = 5; /* 한 페이지당 글의 수 */
	public int BLOCK_PER_PAGE = 5; /* 한 블록당 페이지 수 */
	
	public PageMaker(int count, int curPage) {
		this.curBlock = 1;
		this.curPage = curPage;
		if(curPage < 1) {
			this.curPage = 1;
		}
		this.setTotPage(count);
		this.setPageRange();
		this.setTotBlock();
		this.setBlockRange();
		this.setNextBlock();
		this.setPrevBlock();
		this.setBnum();
		this.setStartPost();
		this.setTotPost(count);
		this.setEndPost();
	}
	
	public PageMaker(int count, int curPage, int PAGE_PER_POST) {
		this.PAGE_PER_POST = PAGE_PER_POST;
		this.curBlock = 1;
		this.curPage = curPage;
		if(curPage < 1) {
			this.curPage = 1;
		}
		this.setTotPage(count);
		this.setPageRange();
		this.setTotBlock();
		this.setBlockRange();
		this.setNextBlock();
		this.setPrevBlock();
		this.setBnum();
		this.setStartPost();
		this.setTotPost(count);
		this.setEndPost();
	}
	
	public PageMaker(int count, int curPage, int PAGE_PER_POST, int BLOCK_PER_PAGE) {
		this.PAGE_PER_POST = PAGE_PER_POST;
		this.BLOCK_PER_PAGE = BLOCK_PER_PAGE;
		this.curBlock = 1;
		this.curPage = curPage;
		if(curPage < 1) {
			this.curPage = 1;
		}
		this.setTotPage(count);
		this.setPageRange();
		this.setTotBlock();
		this.setBlockRange();
		this.setNextBlock();
		this.setPrevBlock();
		this.setBnum();
		this.setStartPost();
		this.setTotPost(count);
		this.setEndPost();
	}
	
	public void setBlockRange() {
		//원하는 페이지가 몇 번째 블록에 있는지 계산 
		this.curBlock = (this.curPage-1) / BLOCK_PER_PAGE + 1;
		//현재 블록의 시작 페이지 번호와 끝 페이지 번호 계산
		this.startBlock = (this.curBlock - 1) * BLOCK_PER_PAGE + 1;
		this.endBlock = (this.startBlock + BLOCK_PER_PAGE - 1);
		if(this.startBlock > this.totPage) {
			this.endBlock = this.totPage;
		}
		//[이전]과 [다음]을 눌렀을 때 이동할 페이지 번호 계산
		this.prevPage = (this.curBlock==1) ? 1 : (this.curBlock-1) * BLOCK_PER_PAGE;
		this.nextPage = (this.curBlock>this.totBlock) ? (this.curBlock * BLOCK_PER_PAGE) : (this.curBlock * BLOCK_PER_PAGE)+1;
		if(this.nextPage >= this.totPage) {
			this.nextPage = this.totPage;
		}
	}

	public int getPrevPage() {		return prevPage;	}
	public int getNextPage() {		return nextPage;	}
	public int getCurBlock() {		return curBlock;	}
	public int getStartBlock() {		return startBlock;	}
	public int getEndBlock() {		return endBlock;	}
	public void setTotBlock() { //전체 블록 수 계산
		this.totBlock = (int) Math.ceil(this.totPage*1.0 / BLOCK_PER_PAGE);
	}
	public int getTotBlock() {		return totBlock;	}

	public void setPageRange() {
		//현재 블록의 시작 페이지와 마지막 페이지 번호 계산
		this.startPage = this.curBlock * BLOCK_PER_PAGE - (BLOCK_PER_PAGE - 1);
		this.endPage = this.startPage + BLOCK_PER_PAGE - 1;
		if(this.endPage > this.totPage) {
			this.endPage = this.totPage;
		}
	}
	public int getStartPage() {		return startPage;	}
	public int getEndPage() {		return endPage;	}
	public void setTotPage(int count) {		//전체 페이지수 계산
		this.totPage = (int) Math.ceil(count*1.0 / PAGE_PER_POST);
	}
	
	public int getTotPage() {		return this.totPage;	}
	public int getPrevBlock() {		return prevBlock;	}
	public void setPrevBlock() {
		this.prevBlock = this.startBlock - 1;
		if(this.prevBlock <= 1) {
			this.prevBlock = 1;
		}
	}

	public int getNextBlock() {		return nextBlock;	}

	public void setNextBlock() {
		this.nextBlock = this.endBlock + 1;
		if(this.nextBlock >= this.totPage) {
			this.nextBlock = this.totPage;
		}
	}

	public int getBnum() {		return bnum;	}
	public void setBnum() {		this.bnum = PAGE_PER_POST;	}
	public int getStartPost() {		return startPost;	}
	public void setStartPost() {
		this.startPost = this.curPage * PAGE_PER_POST - PAGE_PER_POST;
	}
	
	public int getEndPost() {		return endPost;	}
	public void setEndPost() {
		this.endPost = this.startPost + PAGE_PER_POST;
		if(this.endPost > this.totPost) { this.endPost = this.totPost; }
	}

	public int getTotPost() {		return totPost;	}
	public void setTotPost(int count) {		this.totPost = count;	}
	public int getCurPage() {		return curPage;	}
}
