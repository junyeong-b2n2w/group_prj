package com.gr.cg.dto;

import java.util.Date;

public class PollVO {
	private int poll_no;
	private int poll_compno;
	private String poll_nm;
	private Date poll_satdt;
	private Date poll_enddt;
	
	public PollVO() {
		super();
	}

	public PollVO(int poll_no, int poll_compno, String poll_nm, Date poll_satdt, Date poll_enddt) {
		super();
		this.poll_no = poll_no;
		this.poll_compno = poll_compno;
		this.poll_nm = poll_nm;
		this.poll_satdt = poll_satdt;
		this.poll_enddt = poll_enddt;
	}

	public int getPoll_no() {
		return poll_no;
	}

	public void setPoll_no(int poll_no) {
		this.poll_no = poll_no;
	}

	public int getPoll_compno() {
		return poll_compno;
	}

	public void setPoll_compno(int poll_compno) {
		this.poll_compno = poll_compno;
	}

	public String getPoll_nm() {
		return poll_nm;
	}

	public void setPoll_nm(String poll_nm) {
		this.poll_nm = poll_nm;
	}

	public Date getPoll_satdt() {
		return poll_satdt;
	}

	public void setPoll_satdt(Date poll_satdt) {
		this.poll_satdt = poll_satdt;
	}

	public Date getPoll_enddt() {
		return poll_enddt;
	}

	public void setPoll_enddt(Date poll_enddt) {
		this.poll_enddt = poll_enddt;
	}

	@Override
	public String toString() {
		return "PollVO [poll_no=" + poll_no + ", poll_compno=" + poll_compno + ", poll_nm=" + poll_nm + ", poll_satdt="
				+ poll_satdt + ", poll_enddt=" + poll_enddt + "]";
	}
	
}
