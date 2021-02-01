package com.gr.cg.dto;

import java.sql.Date;

public class AttachVO {
	private int attc_no      ;
	private String attc_key      ;
	private String attc_writer  ;
	private String attc_nm      ;
	private String attc_extnm   ;
	private String attc_route   ;
	private String attc_extn    ;
	private long attc_sz      ;
	private Date attc_regdt   ;
	private String attc_deletyn ;
	
	
	public int getAttc_no() {
		return attc_no;
	}
	public void setAttc_no(int attc_no) {
		this.attc_no = attc_no;
	}
	
	public String getAttc_key() {
		return attc_key;
	}
	public void setAttc_key(String attc_key) {
		this.attc_key = attc_key;
	}
	public String getAttc_writer() {
		return attc_writer;
	}
	public void setAttc_writer(String attc_writer) {
		this.attc_writer = attc_writer;
	}
	public String getAttc_nm() {
		return attc_nm;
	}
	public void setAttc_nm(String attc_nm) {
		this.attc_nm = attc_nm;
	}
	public String getAttc_extnm() {
		return attc_extnm;
	}
	public void setAttc_extnm(String attc_extnm) {
		this.attc_extnm = attc_extnm;
	}
	public String getAttc_route() {
		return attc_route;
	}
	public void setAttc_route(String attc_route) {
		this.attc_route = attc_route;
	}
	public String getAttc_extn() {
		return attc_extn;
	}
	public void setAttc_extn(String attc_extn) {
		this.attc_extn = attc_extn;
	}
	public long getAttc_sz() {
		return attc_sz;
	}
	public void setAttc_sz(long attc_sz) {
		this.attc_sz = attc_sz;
	}
	public Date getAttc_regdt() {
		return attc_regdt;
	}
	public void setAttc_regdt(Date attc_regdt) {
		this.attc_regdt = attc_regdt;
	}
	public String getAttc_deletyn() {
		return attc_deletyn;
	}
	public void setAttc_deletyn(String attc_deletyn) {
		this.attc_deletyn = attc_deletyn;
	}
	
	
}
