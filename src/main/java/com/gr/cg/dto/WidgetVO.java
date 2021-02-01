package com.gr.cg.dto;

public class WidgetVO {
	private int wg_no;
	private String wg_nm;
	private String wg_url;
	private String wg_icon;
	private String wg_regid;
	private String wg_udtid;
	private String wg_regdt;
	private String wg_udtdt;
	
	
	
	
	public String getWg_regid() {
		return wg_regid;
	}

	public void setWg_regid(String wg_regid) {
		this.wg_regid = wg_regid;
	}

	public String getWg_udtid() {
		return wg_udtid;
	}

	public void setWg_udtid(String wg_udtid) {
		this.wg_udtid = wg_udtid;
	}

	public String getWg_regdt() {
		return wg_regdt;
	}

	public void setWg_regdt(String wg_regdt) {
		this.wg_regdt = wg_regdt;
	}

	public String getWg_udtdt() {
		return wg_udtdt;
	}

	public void setWg_udtdt(String wg_udtdt) {
		this.wg_udtdt = wg_udtdt;
	}

	public WidgetVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public WidgetVO(int wg_no, String wg_nm, String wg_url, String wg_icon) {
		super();
		this.wg_no = wg_no;
		this.wg_nm = wg_nm;
		this.wg_url = wg_url;
		this.wg_icon = wg_icon;
	}

	public int getWg_no() {
		return wg_no;
	}

	public void setWg_no(int wg_no) {
		this.wg_no = wg_no;
	}

	public String getWg_nm() {
		return wg_nm;
	}

	public void setWg_nm(String wg_nm) {
		this.wg_nm = wg_nm;
	}

	public String getWg_url() {
		return wg_url;
	}

	public void setWg_url(String wg_url) {
		this.wg_url = wg_url;
	}

	public String getWg_icon() {
		return wg_icon;
	}

	public void setWg_icon(String wg_icon) {
		this.wg_icon = wg_icon;
	}

	@Override
	public String toString() {
		return "WidgetVO [wg_no=" + wg_no + ", wg_nm=" + wg_nm + ", wg_url=" + wg_url + ", wg_icon=" + wg_icon
				+ ", wg_regid=" + wg_regid + ", wg_udtid=" + wg_udtid + ", wg_regdt=" + wg_regdt + ", wg_udtdt="
				+ wg_udtdt + "]";
	}
	
}
