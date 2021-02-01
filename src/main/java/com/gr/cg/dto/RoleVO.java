package com.gr.cg.dto;

import java.util.Date;

public class RoleVO {
	private int role_no;
	private String role_nm;
	private String role_regr;
	private Date role_regymd;
	private String role_udt;
	private Date role_udtymd;
	
	public RoleVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RoleVO(int role_no, String role_nm, String role_regr, Date role_regymd, String role_udt, Date role_udtymd) {
		super();
		this.role_no = role_no;
		this.role_nm = role_nm;
		this.role_regr = role_regr;
		this.role_regymd = role_regymd;
		this.role_udt = role_udt;
		this.role_udtymd = role_udtymd;
	}

	public int getRole_no() {
		return role_no;
	}

	public void setRole_no(int role_no) {
		this.role_no = role_no;
	}

	public String getRole_nm() {
		return role_nm;
	}

	public void setRole_nm(String role_nm) {
		this.role_nm = role_nm;
	}

	public String getRole_regr() {
		return role_regr;
	}

	public void setRole_regr(String role_regr) {
		this.role_regr = role_regr;
	}

	public Date getRole_regymd() {
		return role_regymd;
	}

	public void setRole_regymd(Date role_regymd) {
		this.role_regymd = role_regymd;
	}

	public String getRole_udt() {
		return role_udt;
	}

	public void setRole_udt(String role_udt) {
		this.role_udt = role_udt;
	}

	public Date getRole_udtymd() {
		return role_udtymd;
	}

	public void setRole_udtymd(Date role_udtymd) {
		this.role_udtymd = role_udtymd;
	}

	@Override
	public String toString() {
		return "RoleVO [role_no=" + role_no + ", role_nm=" + role_nm + ", role_regr=" + role_regr + ", role_regymd="
				+ role_regymd + ", role_udt=" + role_udt + ", role_udtymd=" + role_udtymd + "]";
	}
	
}
