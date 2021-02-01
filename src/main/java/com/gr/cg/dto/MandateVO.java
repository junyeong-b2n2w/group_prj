package com.gr.cg.dto;

import java.sql.Date;

public class MandateVO {
	private int mdt_no;
	private String mdt_empid;
	private String mdt_mdtr;
	private String mdt_reason;
	private Date mdt_satymd;
	private Date mdt_endymd;
	private Date mdt_ymd;
	private String mdt_actvyn;
	private String mdt_deptnm;
	
	public MandateVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public MandateVO(int mdt_no, String mdt_empid, String mdt_mdtr, String mdt_reason, Date mdt_satymd, Date mdt_endymd,
			Date mdt_ymd, String mdt_actvyn, String mdt_deptnm) {
		super();
		this.mdt_no = mdt_no;
		this.mdt_empid = mdt_empid;
		this.mdt_mdtr = mdt_mdtr;
		this.mdt_reason = mdt_reason;
		this.mdt_satymd = mdt_satymd;
		this.mdt_endymd = mdt_endymd;
		this.mdt_ymd = mdt_ymd;
		this.mdt_actvyn = mdt_actvyn;
		this.mdt_deptnm = mdt_deptnm;
	}

	public int getMdt_no() {
		return mdt_no;
	}

	public void setMdt_no(int mdt_no) {
		this.mdt_no = mdt_no;
	}

	public String getMdt_empid() {
		return mdt_empid;
	}

	public void setMdt_empid(String mdt_empid) {
		this.mdt_empid = mdt_empid;
	}

	public String getMdt_mdtr() {
		return mdt_mdtr;
	}

	public void setMdt_mdtr(String mdt_mdtr) {
		this.mdt_mdtr = mdt_mdtr;
	}

	public String getMdt_reason() {
		return mdt_reason;
	}

	public void setMdt_reason(String mdt_reason) {
		this.mdt_reason = mdt_reason;
	}

	public Date getMdt_satymd() {
		return mdt_satymd;
	}

	public void setMdt_satymd(Date mdt_satymd) {
		this.mdt_satymd = mdt_satymd;
	}

	public Date getMdt_endymd() {
		return mdt_endymd;
	}

	public void setMdt_endymd(Date mdt_endymd) {
		this.mdt_endymd = mdt_endymd;
	}

	public Date getMdt_ymd() {
		return mdt_ymd;
	}

	public void setMdt_ymd(Date mdt_ymd) {
		this.mdt_ymd = mdt_ymd;
	}

	public String getMdt_actvyn() {
		return mdt_actvyn;
	}

	public void setMdt_actvyn(String mdt_actvyn) {
		this.mdt_actvyn = mdt_actvyn;
	}

	public String getMdt_deptnm() {
		return mdt_deptnm;
	}

	public void setMdt_deptnm(String mdt_deptnm) {
		this.mdt_deptnm = mdt_deptnm;
	}

	@Override
	public String toString() {
		return "MandateVO [mdt_no=" + mdt_no + ", mdt_empid=" + mdt_empid + ", mdt_mdtr=" + mdt_mdtr + ", mdt_reason="
				+ mdt_reason + ", mdt_satymd=" + mdt_satymd + ", mdt_endymd=" + mdt_endymd + ", mdt_ymd=" + mdt_ymd
				+ ", mdt_actvyn=" + mdt_actvyn + ", mdt_deptnm=" + mdt_deptnm + "]";
	}
}