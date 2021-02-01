package com.gr.cg.dto;

public class ShareGrUserVO {
	private int sgu_sgno;
	private String sgu_empid;
	
	public ShareGrUserVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ShareGrUserVO(int sgu_sgno, String sgu_empid) {
		super();
		this.sgu_sgno = sgu_sgno;
		this.sgu_empid = sgu_empid;
	}

	public int getSgu_sgno() {
		return sgu_sgno;
	}

	public void setSgu_sgno(int sgu_sgno) {
		this.sgu_sgno = sgu_sgno;
	}

	public String getSgu_empid() {
		return sgu_empid;
	}

	public void setSgu_empid(String sgu_empid) {
		this.sgu_empid = sgu_empid;
	}

	@Override
	public String toString() {
		return "ShareGrUserVO [sgu_sgno=" + sgu_sgno + ", sgu_empid=" + sgu_empid + "]";
	}
	
}
