package com.gr.cg.dto;

import java.util.Date;

public class MemoVO {
	private int memo_no;
	private String memo_empid;
	private String memo_cont;
	private Date memo_regdt;
	private String memo_color;
	
	public MemoVO() {
		super();
	}

	public MemoVO(int memo_no, String memo_empid, String memo_cont, Date memo_regdt, String memo_color) {
		super();
		this.memo_no = memo_no;
		this.memo_empid = memo_empid;
		this.memo_cont = memo_cont;
		this.memo_regdt = memo_regdt;
		this.memo_color = memo_color;
	}
	
	public int getMemo_no() {
		return memo_no;
	}
	public void setMemo_no(int memo_no) {
		this.memo_no = memo_no;
	}
	public String getMemo_empid() {
		return memo_empid;
	}
	public void setMemo_empid(String memo_empid) {
		this.memo_empid = memo_empid;
	}
	public String getMemo_cont() {
		return memo_cont;
	}
	public void setMemo_cont(String memo_cont) {
		this.memo_cont = memo_cont;
	}
	public Date getMemo_regdt() {
		return memo_regdt;
	}
	public void setMemo_regdt(Date memo_regdt) {
		this.memo_regdt = memo_regdt;
	}
	public String getMemo_color() {
		return memo_color;
	}
	public void setMemo_color(String memo_color) {
		this.memo_color = memo_color;
	}

	@Override
	public String toString() {
		return "MemoVO [memo_no=" + memo_no + ", memo_empid=" + memo_empid + ", memo_cont=" + memo_cont
				+ ", memo_regdt=" + memo_regdt + ", memo_color=" + memo_color + "]";
	}
}
