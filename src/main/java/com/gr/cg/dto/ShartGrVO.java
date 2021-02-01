package com.gr.cg.dto;

public class ShartGrVO {
	private int sg_no;
	private String sg_nm;
	private String sg_empid;
	
	public ShartGrVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ShartGrVO(int sg_no, String sg_nm, String sg_empid) {
		super();
		this.sg_no = sg_no;
		this.sg_nm = sg_nm;
		this.sg_empid = sg_empid;
	}

	public int getSg_no() {
		return sg_no;
	}

	public void setSg_no(int sg_no) {
		this.sg_no = sg_no;
	}

	public String getSg_nm() {
		return sg_nm;
	}

	public void setSg_nm(String sg_nm) {
		this.sg_nm = sg_nm;
	}

	public String getSg_empid() {
		return sg_empid;
	}

	public void setSg_empid(String sg_empid) {
		this.sg_empid = sg_empid;
	}

	@Override
	public String toString() {
		return "ShartGrVO [sg_no=" + sg_no + ", sg_nm=" + sg_nm + ", sg_empid=" + sg_empid + "]";
	}

}
