package com.gr.cg.command;

import java.util.List;
import java.util.Map;

public class SearchCriteria2 {

	private int page=1; // 페이지 번호
	private int perPageNum=10; // 한페이지당 리스트개수
	private String searchno;
	private int compno;
	
	private Map<String, String> likeMap;
	private Map<String, String> equalMap;
	private Map<String, List<String>> inMap;
	private Map<String, List<String>> notInMap;
	private Map<String, String> dateGtMap;
	private Map<String, String> dateLtMap;
	public Map<String, String> getDateGtMap() {
		return dateGtMap;
	}

	public void setDateGtMap(Map<String, String> dateGtMap) {
		this.dateGtMap = dateGtMap;
	}

	public Map<String, String> getDateLtMap() {
		return dateLtMap;
	}

	public void setDateLtMap(Map<String, String> dateLtMap) {
		this.dateLtMap = dateLtMap;
	}

	private String table;
	private String orderby;
	private String asc = "desc";
	private String primarykey;
	private int displaypage = 10;
	public SearchCriteria2() {}
	
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
	public Map<String, String> getLikeMap() {
		return likeMap;
	}
	public void setLikeMap(Map<String, String> likeMap) {
		this.likeMap = likeMap;
	}
	public Map<String, String> getEqualMap() {
		return equalMap;
	}
	public void setEqualMap(Map<String, String> equalMap) {
		this.equalMap = equalMap;
	}
	public Map<String, List<String>> getInMap() {
		return inMap;
	}
	public void setInMap(Map<String, List<String>> inMap) {
		this.inMap = inMap;
	}
	public Map<String, List<String>> getNotInMap() {
		return notInMap;
	}
	public void setNotInMap(Map<String, List<String>> notInMap) {
		this.notInMap = notInMap;
	}
	public int getStart() {
		return (this.page-1)*perPageNum;
	}
	public int getEnd() {
		return this.page * perPageNum;
	}
	public String getTable() {
		return table;
	}
	public void setTable(String table) {
		this.table = table;
	}
	public String getOrderby() {
		return orderby;
	}
	public void setOrderby(String orderby) {
		this.orderby = orderby;
	}
	public String getAsc() {
		return asc;
	}
	public void setAsc(String asc) {
		this.asc = asc;
	}
	public int getDisplaypage() {
		return displaypage;
	}
	public void setDisplaypage(int displaypage) {
		this.displaypage = displaypage;
	}

	public String getPrimarykey() {
		return primarykey;
	}

	public void setPrimarykey(String primarykey) {
		this.primarykey = primarykey;
	}

	public String getSearchno() {
		return searchno;
	}

	public void setSearchno(String searchno) {
		this.searchno = searchno;
	}

	public int getCompno() {
		return compno;
	}

	public void setCompno(int compno) {
		this.compno = compno;
	}

	
	
	
}
