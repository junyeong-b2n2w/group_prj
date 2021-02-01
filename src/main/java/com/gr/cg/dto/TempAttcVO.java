package com.gr.cg.dto;

import java.util.Date;

public class TempAttcVO {
	private int ta_no;
	private String ta_writer;
	private String ta_nm;
	private String ta_extnm;
	private String ta_route;
	private String ta_extn;
	private long ta_sz;
	private Date ta_regdt;
	
	public TempAttcVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TempAttcVO(int ta_no, String ta_writer, String ta_nm, String ta_extnm, String ta_route, String ta_extn,
			long ta_sz, Date ta_regdt) {
		super();
		this.ta_no = ta_no;
		this.ta_writer = ta_writer;
		this.ta_nm = ta_nm;
		this.ta_extnm = ta_extnm;
		this.ta_route = ta_route;
		this.ta_extn = ta_extn;
		this.ta_sz = ta_sz;
		this.ta_regdt = ta_regdt;
	}

	public int getTa_no() {
		return ta_no;
	}

	public void setTa_no(int ta_no) {
		this.ta_no = ta_no;
	}

	public String getTa_writer() {
		return ta_writer;
	}

	public void setTa_writer(String ta_writer) {
		this.ta_writer = ta_writer;
	}

	public String getTa_nm() {
		return ta_nm;
	}

	public void setTa_nm(String ta_nm) {
		this.ta_nm = ta_nm;
	}

	public String getTa_extnm() {
		return ta_extnm;
	}

	public void setTa_extnm(String ta_extnm) {
		this.ta_extnm = ta_extnm;
	}

	public String getTa_route() {
		return ta_route;
	}

	public void setTa_route(String ta_route) {
		this.ta_route = ta_route;
	}

	public String getTa_extn() {
		return ta_extn;
	}

	public void setTa_extn(String ta_extn) {
		this.ta_extn = ta_extn;
	}

	public long getTa_sz() {
		return ta_sz;
	}

	public void setTa_sz(long ta_sz) {
		this.ta_sz = ta_sz;
	}

	public Date getTa_regdt() {
		return ta_regdt;
	}

	public void setTa_regdt(Date ta_regdt) {
		this.ta_regdt = ta_regdt;
	}

	@Override
	public String toString() {
		return "TempAttcVO [ta_no=" + ta_no + ", ta_writer=" + ta_writer + ", ta_nm=" + ta_nm + ", ta_extnm=" + ta_extnm
				+ ", ta_route=" + ta_route + ", ta_extn=" + ta_extn + ", ta_sz=" + ta_sz + ", ta_regdt=" + ta_regdt
				+ "]";
	}
	
}
