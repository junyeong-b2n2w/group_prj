package com.gr.cg.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;



public class ReplyVO {
	
	private int re_no;
	private int re_postno;
	private String re_writerid;
	private String re_cont;
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm", timezone="Asia/Seoul")
	private Date re_regdt;
	private Date re_udtdt;
	private Integer re_pcommno;
	private int level;
	
	
	
	
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getRe_no() {
		return re_no;
	}
	public void setRe_no(int re_no) {
		this.re_no = re_no;
	}
	public int getRe_postno() {
		return re_postno;
	}
	public void setRe_postno(int re_postno) {
		this.re_postno = re_postno;
	}
	public String getRe_writerid() {
		return re_writerid;
	}
	public void setRe_writerid(String re_writerid) {
		this.re_writerid = re_writerid;
	}
	public String getRe_cont() {
		return re_cont;
	}
	public void setRe_cont(String re_cont) {
		this.re_cont = re_cont;
	}
	public Date getRe_regdt() {
		return re_regdt;
	}
	public void setRe_regdt(Date re_regdt) {
		this.re_regdt = re_regdt;
	}
	public Date getRe_udtdt() {
		return re_udtdt;
	}
	public void setRe_udtdt(Date re_udtdt) {
		this.re_udtdt = re_udtdt;
	}
	public Integer getRe_pcommno() {
		return re_pcommno;
	}
	public void setRe_pcommno(Integer re_pcommno) {
		this.re_pcommno = re_pcommno;
	}
	@Override
	public String toString() {
		return "ReplyVO [re_no=" + re_no + ", re_postno=" + re_postno + ", re_writerid=" + re_writerid + ", re_cont="
				+ re_cont + ", re_regdt=" + re_regdt + ", re_udtdt=" + re_udtdt + ", re_pcommno=" + re_pcommno
				+ ", level=" + level + "]";
	}
	
	
	
	
}

