package com.gr.cg.dto;

import java.sql.Date;

public class BoardVO {
	private int board_no;
	private Date board_ymd;
	private String board_actvyn;
	private String board_crt;
	private String board_nm;
	private int board_pboardno;
	private int board_compno;
	
	public int getBoard_compno() {
		return board_compno;
	}
	public void setBoard_compno(int board_compno) {
		this.board_compno = board_compno;
	}
	public int getBoard_pboardno() {
		return board_pboardno;
	}
	public void setBoard_pboardno(int board_pboardno) {
		this.board_pboardno = board_pboardno;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public Date getBoard_ymd() {
		return board_ymd;
	}
	public void setBoard_ymd(Date board_ymd) {
		this.board_ymd = board_ymd;
	}
	public String getBoard_actvyn() {
		return board_actvyn;
	}
	public void setBoard_actvyn(String board_actvyn) {
		this.board_actvyn = board_actvyn;
	}
	public String getBoard_crt() {
		return board_crt;
	}
	public void setBoard_crt(String board_crt) {
		this.board_crt = board_crt;
	}
	public String getBoard_nm() {
		return board_nm;
	}
	public void setBoard_nm(String board_nm) {
		this.board_nm = board_nm;
	}
	@Override
	public String toString() {
		return "BoardVO [board_no=" + board_no + ", board_ymd=" + board_ymd + ", board_actvyn=" + board_actvyn
				+ ", board_crt=" + board_crt + ", board_nm=" + board_nm + ", board_pboardno=" + board_pboardno
				+ ", board_compno=" + board_compno + "]";
	}
	
	
}
