package com.gr.cg.dto;

public class PollPartiVO {
	private int pp_no;
	private int pp_ansno;
	private int pp_pqno;
	private int pp_pollno;
	private String pp_empid;
	
	public PollPartiVO() {
		super();
	}

	public PollPartiVO(int pp_no, int pp_ansno, int pp_pqno, int pp_pollno, String pp_empid) {
		super();
		this.pp_no = pp_no;
		this.pp_ansno = pp_ansno;
		this.pp_pqno = pp_pqno;
		this.pp_pollno = pp_pollno;
		this.pp_empid = pp_empid;
	}

	public int getPp_no() {
		return pp_no;
	}

	public void setPp_no(int pp_no) {
		this.pp_no = pp_no;
	}

	public int getPp_ansno() {
		return pp_ansno;
	}

	public void setPp_ansno(int pp_ansno) {
		this.pp_ansno = pp_ansno;
	}

	public int getPp_pqno() {
		return pp_pqno;
	}

	public void setPp_pqno(int pp_pqno) {
		this.pp_pqno = pp_pqno;
	}

	public int getPp_pollno() {
		return pp_pollno;
	}

	public void setPp_pollno(int pp_pollno) {
		this.pp_pollno = pp_pollno;
	}

	public String getPp_empid() {
		return pp_empid;
	}

	public void setPp_empid(String pp_empid) {
		this.pp_empid = pp_empid;
	}

	@Override
	public String toString() {
		return "PollParticipationVO [pp_no=" + pp_no + ", pp_ansno=" + pp_ansno + ", pp_pqno=" + pp_pqno
				+ ", pp_pollno=" + pp_pollno + ", pp_empid=" + pp_empid + "]";
	}
	
	
}
