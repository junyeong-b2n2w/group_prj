package com.gr.cg.dto;

public class ShartGrDocuVO {
	private int sgd_sgno;
	private int sgd_bdno;
	
	public ShartGrDocuVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ShartGrDocuVO(int sgd_sgno, int sgd_bdno) {
		super();
		this.sgd_sgno = sgd_sgno;
		this.sgd_bdno = sgd_bdno;
	}

	public int getSgd_sgno() {
		return sgd_sgno;
	}

	public void setSgd_sgno(int sgd_sgno) {
		this.sgd_sgno = sgd_sgno;
	}

	public int getSgd_bdno() {
		return sgd_bdno;
	}

	public void setSgd_bdno(int sgd_bdno) {
		this.sgd_bdno = sgd_bdno;
	}

	@Override
	public String toString() {
		return "ShartGrDocuVO [sgd_sgno=" + sgd_sgno + ", sgd_bdno=" + sgd_bdno + "]";
	}
	
}
