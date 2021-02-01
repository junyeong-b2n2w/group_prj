package com.gr.cg.dto;

import java.sql.Date;

public class ApprovalRefVO {
	private int ar_no      ;
	private int ar_edno    ;
	private String ar_empid   ;
	private String ar_hidrefyn;
	private Date ar_readdt;
	private String emp_nm;
	private String dept_nm;
	private String rank_nm;
	
	public String getEmp_nm() {
		return emp_nm;
	}
	public void setEmp_nm(String emp_nm) {
		this.emp_nm = emp_nm;
	}
	public String getDept_nm() {
		return dept_nm;
	}
	public void setDept_nm(String dept_nm) {
		this.dept_nm = dept_nm;
	}
	public String getRank_nm() {
		return rank_nm;
	}
	public void setRank_nm(String rank_nm) {
		this.rank_nm = rank_nm;
	}
	public ApprovalRefVO() {
		super();
	}
	public ApprovalRefVO(int ar_no, int ar_edno, String ar_empid, String ar_hidrefyn, Date ar_readdt) {
		super();
		this.ar_no = ar_no;
		this.ar_edno = ar_edno;
		this.ar_empid = ar_empid;
		this.ar_hidrefyn = ar_hidrefyn;
		this.ar_readdt = ar_readdt;
	}
	public int getAr_no() {
		return ar_no;
	}
	public void setAr_no(int ar_no) {
		this.ar_no = ar_no;
	}
	public int getAr_edno() {
		return ar_edno;
	}
	public void setAr_edno(int ar_edno) {
		this.ar_edno = ar_edno;
	}
	public String getAr_empid() {
		return ar_empid;
	}
	public void setAr_empid(String ar_empid) {
		this.ar_empid = ar_empid;
	}
	public String getAr_hidrefyn() {
		return ar_hidrefyn;
	}
	public void setAr_hidrefyn(String ar_hidrefyn) {
		this.ar_hidrefyn = ar_hidrefyn;
	}
	public Date getAr_readdt() {
		return ar_readdt;
	}
	public void setAr_readdt(Date ar_readdt) {
		this.ar_readdt = ar_readdt;
	}
}
