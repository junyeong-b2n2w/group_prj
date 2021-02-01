package com.gr.cg.dto;

import java.util.Date;

public class PersonGrVO {
	private int pg_no;
	private String pg_empid;
	private String pg_nm;
	private Date pg_regymd;
	private String pg_memo;
	
	public PersonGrVO() {
		super();
	}

	public PersonGrVO(int pg_no, String pg_empid, String pg_nm, Date pg_regymd, String pg_memo) {
		super();
		this.pg_no = pg_no;
		this.pg_empid = pg_empid;
		this.pg_nm = pg_nm;
		this.pg_regymd = pg_regymd;
		this.pg_memo = pg_memo;
	}

	public int getPg_no() {
		return pg_no;
	}

	public void setPg_no(int pg_no) {
		this.pg_no = pg_no;
	}

	public String getPg_empid() {
		return pg_empid;
	}

	public void setPg_empid(String pg_empid) {
		this.pg_empid = pg_empid;
	}

	public String getPg_nm() {
		return pg_nm;
	}

	public void setPg_nm(String pg_nm) {
		this.pg_nm = pg_nm;
	}

	public Date getPg_regymd() {
		return pg_regymd;
	}

	public void setPg_regymd(Date pg_regymd) {
		this.pg_regymd = pg_regymd;
	}

	public String getPg_memo() {
		return pg_memo;
	}

	public void setPg_memo(String pg_memo) {
		this.pg_memo = pg_memo;
	}

	@Override
	public String toString() {
		return "PersonalGroupVO [pg_no=" + pg_no + ", pg_empid=" + pg_empid + ", pg_nm=" + pg_nm + ", pg_regymd="
				+ pg_regymd + ", pg_memo=" + pg_memo + "]";
	}
	
	
}
