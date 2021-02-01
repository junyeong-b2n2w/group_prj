package com.gr.cg.command;

import com.fasterxml.jackson.annotation.JsonProperty;

public class PageMaker2 {
	private boolean prev;
	private boolean next;
	private int totalcnt;
	private int endPage;
	private int startPage;
	private int realEndPage;
	private int page;
	private int displayPage;
	private int perPageNum;
	@JsonProperty(value="isPrev")
	public boolean isPrev() {
		prev = startPage == 1 ? false : true;
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	@JsonProperty(value="isNext")
	public boolean isNext() {
		next = endPage * getPerPageNum() >= totalcnt ? false : true;
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getTotalcnt() {
		return totalcnt;
	}
	public void setTotalcnt(int totalcnt) {
		this.totalcnt = totalcnt;
	}
	public int getEndPage() {
		endPage = (int) (Math.ceil(page / (double) getDisplayPage()) * getDisplayPage());
		if (endPage > getRealEndPage()) {
			endPage = getRealEndPage();
		}
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getStartPage() {
		startPage = (getEndPage() - getDisplayPage()) + 1;
		if (startPage <= 0) {
			startPage = 1;
		}
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getRealEndPage() {
		realEndPage = (int) (Math.ceil(totalcnt / (double) getPerPageNum()));
		return realEndPage;
	}
	public void setRealEndPage(int realEndPage) {
		this.realEndPage = realEndPage;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getDisplayPage() {
		return displayPage;
	}
	public void setDisplayPage(int displayPage) {
		this.displayPage = displayPage;
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}
}




