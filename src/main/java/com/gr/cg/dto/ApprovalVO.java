package com.gr.cg.dto;

public class ApprovalVO {
	private int aprv_no;
	private int aprv_edno;
	private String aprv_asgmdt ;
	private String aprv_idntydt;
	private String aprv_dt     ;
	private String aprv_comm   ;
	private int aprv_ord    ;
	private String aprv_printyn;
	private String aprv_empid  ;
	private String aprv_as     ;
	private String aprv_attckey;
	private String emp_nm;
	private String dept_nm;
	private String rank_nm;
	private int[] ta_no;
	
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
	public ApprovalVO() {
		super();
	}
	public ApprovalVO(int aprv_no, int aprv_edno, String aprv_asgmdt, String aprv_idntydt, String aprv_dt, String aprv_comm,
			int aprv_ord, String aprv_printyn, String aprv_empid, String aprv_as, String aprv_attckey) {
		super();
		this.aprv_no = aprv_no;
		this.aprv_edno = aprv_edno;
		this.aprv_asgmdt = aprv_asgmdt;
		this.aprv_idntydt = aprv_idntydt;
		this.aprv_dt = aprv_dt;
		this.aprv_comm = aprv_comm;
		this.aprv_ord = aprv_ord;
		this.aprv_printyn = aprv_printyn;
		this.aprv_empid = aprv_empid;
		this.aprv_as = aprv_as;
		this.aprv_attckey = aprv_attckey;
	}
	public int getAprv_no() {
		return aprv_no;
	}
	public void setAprv_no(int aprv_no) {
		this.aprv_no = aprv_no;
	}
	public int getAprv_edno() {
		return aprv_edno;
	}
	public void setAprv_edno(int aprv_edno) {
		this.aprv_edno = aprv_edno;
	}
	public String getAprv_asgmdt() {
		return aprv_asgmdt;
	}
	public void setAprv_asgmdt(String aprv_asgmdt) {
		this.aprv_asgmdt = aprv_asgmdt;
	}
	public String getAprv_idntydt() {
		return aprv_idntydt;
	}
	public void setAprv_idntydt(String aprv_idntydt) {
		this.aprv_idntydt = aprv_idntydt;
	}
	public String getAprv_dt() {
		return aprv_dt;
	}
	public void setAprv_dt(String aprv_dt) {
		this.aprv_dt = aprv_dt;
	}
	public String getAprv_comm() {
		return aprv_comm;
	}
	public void setAprv_comm(String aprv_comm) {
		this.aprv_comm = aprv_comm;
	}
	public int getAprv_ord() {
		return aprv_ord;
	}
	public void setAprv_ord(int aprv_ord) {
		this.aprv_ord = aprv_ord;
	}
	public String getAprv_printyn() {
		return aprv_printyn;
	}
	public void setAprv_printyn(String aprv_printyn) {
		this.aprv_printyn = aprv_printyn;
	}
	public String getAprv_empid() {
		return aprv_empid;
	}
	public void setAprv_empid(String aprv_empid) {
		this.aprv_empid = aprv_empid;
	}
	public String getAprv_as() {
		return aprv_as;
	}
	public void setAprv_as(String aprv_as) {
		this.aprv_as = aprv_as;
	}
	public String getAprv_attckey() {
		return aprv_attckey;
	}
	public void setAprv_attckey(String aprv_attckey) {
		this.aprv_attckey = aprv_attckey;
	}
	public int[] getTa_no() {
		return ta_no;
	}
	public void setTa_no(int[] ta_no) {
		this.ta_no = ta_no;
	}
}
