package com.gr.cg.dto;

import java.sql.Date;

public class BusinessDocumentVO {
	private int bd_no        ;
	private String bd_empid     ;
	private String bd_useyn     ;
	private String bd_fileyn    ;
	private String bd_shareyn   ;
	private int bd_upfd      ;
	private String bd_attckey   ;
	private Date bd_regdt     ;
	private String bd_udtid     ;
	private Date bd_udtdt     ;
	private int bd_cmpno     ;
	private int bd_deptno     ;
	private String shareType ;
	private String bd_nm;
	private String attc_extnm;
	private int attc_no;
	private int upfolder;
	private String attc_extn;
	
	public String getAttc_extn() {
		return attc_extn;
	}
	public void setAttc_extn(String attc_extn) {
		this.attc_extn = attc_extn;
	}
	public int getUpfolder() {
		return upfolder;
	}
	public void setUpfolder(int upfolder) {
		this.upfolder = upfolder;
	}
	public String getAttc_extnm() {
		return attc_extnm;
	}
	public void setAttc_extnm(String attc_extnm) {
		this.attc_extnm = attc_extnm;
	}
	public int getAttc_no() {
		return attc_no;
	}
	public void setAttc_no(int attc_no) {
		this.attc_no = attc_no;
	}
	public String getBd_nm() {
		return bd_nm;
	}
	public void setBd_nm(String bd_nm) {
		this.bd_nm = bd_nm;
	}
	public String getShareType() {
		return shareType;
	}
	public void setShareType(String shareType) {
		this.shareType = shareType;
	}
	public int getBd_deptno() {
		return bd_deptno;
	}
	public void setBd_deptno(int bd_deptno) {
		this.bd_deptno = bd_deptno;
	}
	public int getBd_no() {
		return bd_no;
	}
	public void setBd_no(int bd_no) {
		this.bd_no = bd_no;
	}
	public String getBd_empid() {
		return bd_empid;
	}
	public void setBd_empid(String bd_empid) {
		this.bd_empid = bd_empid;
	}
	public String getBd_useyn() {
		return bd_useyn;
	}
	public void setBd_useyn(String bd_useyn) {
		this.bd_useyn = bd_useyn;
	}
	public String getBd_fileyn() {
		return bd_fileyn;
	}
	public void setBd_fileyn(String bd_fileyn) {
		this.bd_fileyn = bd_fileyn;
	}
	public String getBd_shareyn() {
		return bd_shareyn;
	}
	public void setBd_shareyn(String bd_shareyn) {
		this.bd_shareyn = bd_shareyn;
	}
	public int getBd_upfd() {
		return bd_upfd;
	}
	public void setBd_upfd(int bd_upfd) {
		this.bd_upfd = bd_upfd;
	}
	public String getBd_attckey() {
		return bd_attckey;
	}
	public void setBd_attckey(String bd_attckey) {
		this.bd_attckey = bd_attckey;
	}
	public Date getBd_regdt() {
		return bd_regdt;
	}
	public void setBd_regdt(Date bd_regdt) {
		this.bd_regdt = bd_regdt;
	}
	public String getBd_udtid() {
		return bd_udtid;
	}
	public void setBd_udtid(String bd_udtid) {
		this.bd_udtid = bd_udtid;
	}
	public Date getBd_udtdt() {
		return bd_udtdt;
	}
	public void setBd_udtdt(Date bd_udtdt) {
		this.bd_udtdt = bd_udtdt;
	}
	public int getBd_cmpno() {
		return bd_cmpno;
	}
	public void setBd_cmpno(int bd_cmpno) {
		this.bd_cmpno = bd_cmpno;
	}
	
	
}
