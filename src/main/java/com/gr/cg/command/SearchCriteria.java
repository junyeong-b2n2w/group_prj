package com.gr.cg.command;

public class SearchCriteria {
	

	private int page=1; // 페이지 번호
	private int perPageNum=10; // 한페이지당 리스트개수
	private String searchType=""; // 검색구분
	private String searchType2=""; // 검색구분
	public String getSearchType2() {
		return searchType2;
	}
	public void setSearchType2(String searchType2) {
		this.searchType2 = searchType2;
	}
	private String keyword=""; //검색어
	private int comp_no = 0;
	private int primaryKey = 0; 
	
	
	
	public int getPrimaryKey() {
		return primaryKey;
	}
	public void setPrimaryKey(int primaryKey) {
		this.primaryKey = primaryKey;
	}
	public int getComp_no() {
		return comp_no;
	}
	public void setComp_no(int comp_no) {
		this.comp_no = comp_no;
	}
	public SearchCriteria() {}
	public SearchCriteria(int page, int perPageNum, String searchType, String keyword,int comp_no, String searchType2) {
		super();
		this.page = page;
		this.perPageNum = perPageNum;
		this.searchType = searchType;
		this.searchType2 = searchType2;
		this.keyword = keyword;
		this.comp_no = comp_no;
		
	}
	public SearchCriteria(String page, String perPageNum, String searchType, String keyword,String comp_no , String searchType2) {
		super();
		if(page!=null && !page.isEmpty())this.page = Integer.parseInt(page);
		if(perPageNum!=null && !perPageNum.isEmpty())this.perPageNum = Integer.parseInt(perPageNum);
		if(searchType!=null)this.searchType = searchType;
		if(searchType2!=null)this.searchType2 = searchType2;
		if(keyword!=null)this.keyword = keyword;
		if(comp_no!=null && !comp_no.isEmpty())this.comp_no = Integer.parseInt(comp_no);
	}
	
	
	public int getPageStartRowNum(){ //각 페이지마다 시작하는 행번호
		return (this.page-1)*perPageNum;
	}
	
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public void setPage(String page) {
		if(page!=null && !page.isEmpty())
		this.page = Integer.parseInt(page);
	}
	
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}
	public void setPerPageNum(String perPageNum) {
		if(perPageNum!=null && !perPageNum.isEmpty())
		this.perPageNum = Integer.parseInt(perPageNum);
	}

	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	
	
}
