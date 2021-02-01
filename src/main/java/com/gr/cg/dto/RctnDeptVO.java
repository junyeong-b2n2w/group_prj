package com.gr.cg.dto;

public class RctnDeptVO {
	private int rd_deptno;
	private int rd_edno;
	
	public RctnDeptVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RctnDeptVO(int rd_deptno, int rd_edno) {
		super();
		this.rd_deptno = rd_deptno;
		this.rd_edno = rd_edno;
	}

	public int getRd_deptno() {
		return rd_deptno;
	}

	public void setRd_deptno(int rd_deptno) {
		this.rd_deptno = rd_deptno;
	}

	public int getRd_edno() {
		return rd_edno;
	}

	public void setRd_edno(int rd_edno) {
		this.rd_edno = rd_edno;
	}

	@Override
	public String toString() {
		return "RctnDeptVO [rd_deptno=" + rd_deptno + ", rd_edno=" + rd_edno + "]";
	}
	
}
