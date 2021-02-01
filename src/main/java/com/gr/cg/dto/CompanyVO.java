package com.gr.cg.dto;

import java.util.Date;

import com.gr.cg.command.PageMaker2;

public class CompanyVO extends PageMaker2 {
	private int comp_no     ;
	private String comp_addr   ;
	private String comp_nm     ;
	private String comp_hp     ;
	private String comp_actvyn ;
	private String comp_crno   ;
	private Date comp_regymd ;
	private String comp_logo   ;
	private String comp_seal   ;
	private String comp_delgnm ;
	private String comp_regid  ;
	private String comp_udtid  ;
	private Date comp_udtymd  ;
	
	public CompanyVO() {
		super();
	}

	public CompanyVO(int comp_no, String comp_addr, String comp_nm, String comp_hp, String comp_actvyn, String comp_crno, Date comp_regymd, String comp_logo, String comp_seal, String comp_delgnm, String comp_regid, String comp_udtid, Date comp_udtymd) {
		super();
		this.comp_no = comp_no;
		this.comp_addr = comp_addr;
		this.comp_nm = comp_nm;
		this.comp_hp = comp_hp;
		this.comp_actvyn = comp_actvyn;
		this.comp_crno = comp_crno;
		this.comp_regymd = comp_regymd;
		this.comp_logo = comp_logo;
		this.comp_seal = comp_seal;
		this.comp_delgnm = comp_delgnm;
		this.comp_regid = comp_regid;
		this.comp_udtid = comp_udtid;
		this.comp_udtymd = comp_udtymd;
	}

	public int getComp_no() {
		return comp_no;
	}

	public void setComp_no(int comp_no) {
		this.comp_no = comp_no;
	}

	public String getComp_addr() {
		return comp_addr;
	}

	public void setComp_addr(String comp_addr) {
		this.comp_addr = comp_addr;
	}

	public String getComp_nm() {
		return comp_nm;
	}

	public void setComp_nm(String comp_nm) {
		this.comp_nm = comp_nm;
	}

	public String getComp_hp() {
		return comp_hp;
	}

	public void setComp_hp(String comp_hp) {
		this.comp_hp = comp_hp;
	}

	public String getComp_actvyn() {
		return comp_actvyn;
	}

	public void setComp_actvyn(String comp_actvyn) {
		this.comp_actvyn = comp_actvyn;
	}

	public String getComp_crno() {
		return comp_crno;
	}

	public void setComp_crno(String comp_crno) {
		this.comp_crno = comp_crno;
	}

	public Date getComp_regymd() {
		return comp_regymd;
	}

	public void setComp_regymd(Date comp_regymd) {
		this.comp_regymd = comp_regymd;
	}

	public String getComp_logo() {
		return comp_logo;
	}

	public void setComp_logo(String comp_logo) {
		this.comp_logo = comp_logo;
	}

	public String getComp_seal() {
		return comp_seal;
	}

	public void setComp_seal(String comp_seal) {
		this.comp_seal = comp_seal;
	}

	public String getComp_delgnm() {
		return comp_delgnm;
	}

	public void setComp_delgnm(String comp_delgnm) {
		this.comp_delgnm = comp_delgnm;
	}

	public String getComp_regid() {
		return comp_regid;
	}

	public void setComp_regid(String comp_regid) {
		this.comp_regid = comp_regid;
	}

	public String getComp_udtid() {
		return comp_udtid;
	}

	public void setComp_udtid(String comp_udtid) {
		this.comp_udtid = comp_udtid;
	}

	public Date getComp_udtymd() {
		return comp_udtymd;
	}

	public void setComp_udtymd(Date comp_udtymd) {
		this.comp_udtymd = comp_udtymd;
	}

	@Override
	public String toString() {
		return "CompanyVO [comp_no=" + comp_no + ", comp_addr=" + comp_addr + ", comp_nm=" + comp_nm + ", comp_hp=" + comp_hp + ", comp_actvyn=" + comp_actvyn + ", comp_crno=" + comp_crno + ", comp_regymd=" + comp_regymd + ", comp_logo=" + comp_logo + ", comp_seal=" + comp_seal + ", comp_delgnm=" + comp_delgnm + ", comp_regid=" + comp_regid + ", comp_udtid=" + comp_udtid + ", comp_udtymd=" + comp_udtymd + "]";
	}

}
