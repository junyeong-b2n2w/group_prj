package com.gr.cg.dto;

import java.util.Date;
import java.util.List;

import com.gr.cg.command.PageMaker2;

public class UserDefAprvLnVO extends PageMaker2{
	private int udal_no;
	private String udal_crt;
	private String udal_aprvlnnm;
	private Date udal_regymd;
	private List<UserAprvLnGrVO> ualgList;
	
	public UserDefAprvLnVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UserDefAprvLnVO(int udal_no, String udal_crt, String udal_aprvlnnm, Date udal_regymd) {
		super();
		this.udal_no = udal_no;
		this.udal_crt = udal_crt;
		this.udal_aprvlnnm = udal_aprvlnnm;
		this.udal_regymd = udal_regymd;
	}

	public int getUdal_no() {
		return udal_no;
	}

	public void setUdal_no(int udal_no) {
		this.udal_no = udal_no;
	}

	public String getUdal_crt() {
		return udal_crt;
	}

	public void setUdal_crt(String udal_crt) {
		this.udal_crt = udal_crt;
	}

	public String getUdal_aprvlnnm() {
		return udal_aprvlnnm;
	}

	public void setUdal_aprvlnnm(String udal_aprvlnnm) {
		this.udal_aprvlnnm = udal_aprvlnnm;
	}

	public Date getUdal_regymd() {
		return udal_regymd;
	}

	public void setUdal_regymd(Date udal_regymd) {
		this.udal_regymd = udal_regymd;
	}

	@Override
	public String toString() {
		return "UserDefAprvLnVO [udal_no=" + udal_no + ", udal_crt=" + udal_crt + ", udal_aprvlnnm=" + udal_aprvlnnm
				+ ", udal_regymd=" + udal_regymd + "]";
	}

	public List<UserAprvLnGrVO> getUalgList() {
		return ualgList;
	}

	public void setUalgList(List<UserAprvLnGrVO> ualgList) {
		this.ualgList = ualgList;
	}
	
}
