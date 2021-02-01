package com.gr.cg.dto;

public class ReceiverVO {
	private int rec_edno;
	private String rec_empid;
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

	public ReceiverVO() {
	}

	public ReceiverVO(int rec_edno, String rec_empid) {
		super();
		this.rec_edno = rec_edno;
		this.rec_empid = rec_empid;
	}

	public int getRec_edno() {
		return rec_edno;
	}

	public void setRec_edno(int rec_edno) {
		this.rec_edno = rec_edno;
	}

	public String getRec_empid() {
		return rec_empid;
	}

	public void setRec_empid(String rec_empid) {
		this.rec_empid = rec_empid;
	}

	@Override
	public String toString() {
		return "ReceiverVO [rec_edno=" + rec_edno + ", rec_empid=" + rec_empid + "]";
	}
	
}
