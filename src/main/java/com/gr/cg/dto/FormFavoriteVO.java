package com.gr.cg.dto;

public class FormFavoriteVO {
	private String ff_empid;
	private int ff_no;
	public String getFf_empid() {
		return ff_empid;
	}
	public void setFf_empid(String ff_empid) {
		this.ff_empid = ff_empid;
	}
	public int getFf_no() {
		return ff_no;
	}
	public void setFf_no(int ff_no) {
		this.ff_no = ff_no;
	}
	@Override
	public String toString() {
		return "FormFavoriteVO [ff_empid=" + ff_empid + ", ff_no=" + ff_no + "]";
	}
}
