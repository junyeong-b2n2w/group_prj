package com.gr.cg.dto;

public class WidgetOrdVO {
	private int wo_wgno;
	private String wo_empid;
	private int wo_ord;
	private String wg_icon;
	private String wg_nm;
	private String wo_actvyn;
	
	
	
	public String getWo_actvyn() {
		return wo_actvyn;
	}

	public void setWo_actvyn(String wo_actvyn) {
		this.wo_actvyn = wo_actvyn;
	}

	public String getWg_nm() {
		return wg_nm;
	}

	public void setWg_nm(String wg_nm) {
		this.wg_nm = wg_nm;
	}

	public String getWg_icon() {
		return wg_icon;
	}

	public void setWg_icon(String wg_icon) {
		this.wg_icon = wg_icon;
	}

	public WidgetOrdVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public WidgetOrdVO(int wo_wgno, String wo_empid, int wo_ord) {
		super();
		this.wo_wgno = wo_wgno;
		this.wo_empid = wo_empid;
		this.wo_ord = wo_ord;
	}

	public int getWo_wgno() {
		return wo_wgno;
	}

	public void setWo_wgno(int wo_wgno) {
		this.wo_wgno = wo_wgno;
	}

	public String getWo_empid() {
		return wo_empid;
	}

	public void setWo_empid(String wo_empid) {
		this.wo_empid = wo_empid;
	}

	public int getWo_ord() {
		return wo_ord;
	}

	public void setWo_ord(int wo_ord) {
		this.wo_ord = wo_ord;
	}

	@Override
	public String toString() {
		return "WidgetOrdVO [wo_wgno=" + wo_wgno + ", wo_empid=" + wo_empid + ", wo_ord=" + wo_ord + ", wg_icon="
				+ wg_icon + ", wg_nm=" + wg_nm + ", wo_actvyn=" + wo_actvyn + "]";
	}
	
}
