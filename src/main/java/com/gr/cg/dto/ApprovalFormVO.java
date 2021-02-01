package com.gr.cg.dto;

import java.util.List;

public class ApprovalFormVO {
	private int af_no;
	private int af_compno;
	private String af_nm    ;
	private String af_cont  ;
	private int ff_no;
	private List<FormComponentVO> formComponentList;
	
	public List<FormComponentVO> getFormComponentList() {
		return formComponentList;
	}
	public void setFormComponentList(List<FormComponentVO> formComponentList) {
		this.formComponentList = formComponentList;
	}
	public String getAf_cont() {
		return af_cont;
	}
	public void setAf_cont(String af_cont) {
		this.af_cont = af_cont;
	}
	public int getAf_no() {
		return af_no;
	}
	public void setAf_no(int af_no) {
		this.af_no = af_no;
	}
	public int getAf_compno() {
		return af_compno;
	}
	public void setAf_compno(int af_compno) {
		this.af_compno = af_compno;
	}
	public String getAf_nm() {
		return af_nm;
	}
	public void setAf_nm(String af_nm) {
		this.af_nm = af_nm;
	}
	public int getFf_no() {
		return ff_no;
	}
	public void setFf_no(int ff_no) {
		this.ff_no = ff_no;
	}
	@Override
	public String toString() {
		return "ApprovalFormVO [af_no=" + af_no + ", af_compno=" + af_compno + ", af_nm=" + af_nm + ", af_cont="
				+ af_cont + ", ff_no=" + ff_no + ", formComponentList=" + formComponentList + "]";
	}
	
}                        
