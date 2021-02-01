package com.gr.cg.dto;

import java.util.List;

public class FormComponentVO {


	@Override
	public String toString() {
		return "FormComponentVO [fc_afno=" + fc_afno + ", fc_no=" + fc_no + ", fc_ord=" + fc_ord + ", compList="
				+ compList + "]";
	}

	public int getFc_afno() {
		return fc_afno;
	}

	public void setFc_afno(int fc_afno) {
		this.fc_afno = fc_afno;
	}

	public int getFc_no() {
		return fc_no;
	}

	public void setFc_no(int fc_no) {
		this.fc_no = fc_no;
	}

	public int getFc_ord() {
		return fc_ord;
	}

	public void setFc_ord(int fc_ord) {
		this.fc_ord = fc_ord;
	} 

	public FormComponentVO() {
		// TODO Auto-generated constructor stub
	}
	
	public FormComponentVO(int fc_afno, int fc_no, int fc_ord) {
		super();
		this.fc_afno = fc_afno;
		this.fc_no = fc_no;
		this.fc_ord = fc_ord;
	}

	private int fc_afno;
	private int fc_no;
	private int fc_ord;
	private List<ComponentVO> compList;
	public List<ComponentVO> getCompList() {
		return compList;
	}

	public void setCompList(List<ComponentVO> compList) {
		this.compList = compList;
	}

}
