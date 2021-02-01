package com.gr.cg.dto;

public class ComponentVO {
	@Override
	public String toString() {
		return "ComponentVO [cp_no=" + cp_no + ", cp_nm=" + cp_nm + ", cp_cont=" + cp_cont + ", cp_tag=" + cp_tag + "]";
	}
	private int cp_no  ;
	private String cp_nm  ;
	private String cp_cont;
	private String cp_tag;
	public int getCp_no() {
		return cp_no;
	}
	public void setCp_no(int cp_no) {
		this.cp_no = cp_no;
	}
	public String getCp_nm() {
		return cp_nm;
	}
	public void setCp_nm(String cp_nm) {
		this.cp_nm = cp_nm;
	}
	public String getCp_cont() {
		return cp_cont;
	}
	public void setCp_cont(String cp_cont) {
		this.cp_cont = cp_cont;
	}
	public String getCp_tag() {
		return cp_tag;
	}
	public void setCp_tag(String cp_tag) {
		this.cp_tag = cp_tag;
	}
}
