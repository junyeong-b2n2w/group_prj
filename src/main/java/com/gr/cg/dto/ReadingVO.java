package com.gr.cg.dto;

public class ReadingVO {
	private int read_edno;
	private String read_empid;
	
	public ReadingVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReadingVO(int read_edno, String read_empid) {
		super();
		this.read_edno = read_edno;
		this.read_empid = read_empid;
	}

	public int getRead_edno() {
		return read_edno;
	}

	public void setRead_edno(int read_edno) {
		this.read_edno = read_edno;
	}

	public String getRead_empid() {
		return read_empid;
	}

	public void setRead_empid(String read_empid) {
		this.read_empid = read_empid;
	}

	@Override
	public String toString() {
		return "ReadingVO [read_edno=" + read_edno + ", read_empid=" + read_empid + "]";
	}
	
}
