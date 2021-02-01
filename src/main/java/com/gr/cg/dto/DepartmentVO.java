package com.gr.cg.dto;

import java.sql.Date;

public class DepartmentVO {
	private int dept_no    ;
	private int dept_compno;
	private String dept_nm    ;
	private String dept_loc   ;
	private int dept_updept;
	private Date dept_regymd;
	private String dept_udtymd;
	private String dept_ph    ;
	private String dept_actvyn;
	private String dept_upnm; //상위 부서명
	
	public int getDept_no() {
		return dept_no;
	}
	public void setDept_no(int dept_no) {
		this.dept_no = dept_no;
	}
	public int getDept_compno() {
		return dept_compno;
	}
	public void setDept_compno(int dept_compno) {
		this.dept_compno = dept_compno;
	}
	public String getDept_nm() {
		return dept_nm;
	}
	public void setDept_nm(String dept_nm) {
		this.dept_nm = dept_nm;
	}
	public String getDept_loc() {
		return dept_loc;
	}
	public void setDept_loc(String dept_loc) {
		this.dept_loc = dept_loc;
	}
	public int getDept_updept() {
		return dept_updept;
	}
	public void setDept_updept(int dept_updept) {
		this.dept_updept = dept_updept;
	}
	public Date getDept_regymd() {
		return dept_regymd;
	}
	public void setDept_regymd(Date dept_regymd) {
		this.dept_regymd = dept_regymd;
	}
	public String getDept_udtymd() {
		return dept_udtymd;
	}
	public void setDept_udtymd(String dept_udtymd) {
		this.dept_udtymd = dept_udtymd;
	}
	public String getDept_ph() {
		return dept_ph;
	}
	public void setDept_ph(String dept_ph) {
		this.dept_ph = dept_ph;
	}
	public String getDept_actvyn() {
		return dept_actvyn;
	}
	public void setDept_actvyn(String dept_actvyn) {
		this.dept_actvyn = dept_actvyn;
	}
	public String getDept_upnm() {
		return dept_upnm;
	}
	public void setDept_upnm(String dept_upnm) {
		this.dept_upnm = dept_upnm;
	}
	
}
