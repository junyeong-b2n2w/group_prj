package com.gr.cg.dto;

public class PollQVO {
	private int pq_no;
	private int pq_pollno;
	private String pq_cont;
	
	public PollQVO() {
		super();
	}

	public PollQVO(int pq_no, int pq_pollno, String pq_cont) {
		super();
		this.pq_no = pq_no;
		this.pq_pollno = pq_pollno;
		this.pq_cont = pq_cont;
	}

	public int getPq_no() {
		return pq_no;
	}

	public void setPq_no(int pq_no) {
		this.pq_no = pq_no;
	}

	public int getPq_pollno() {
		return pq_pollno;
	}

	public void setPq_pollno(int pq_pollno) {
		this.pq_pollno = pq_pollno;
	}

	public String getPq_cont() {
		return pq_cont;
	}

	public void setPq_cont(String pq_cont) {
		this.pq_cont = pq_cont;
	}

	@Override
	public String toString() {
		return "PollQVO [pq_no=" + pq_no + ", pq_pollno=" + pq_pollno + ", pq_cont=" + pq_cont + "]";
	}

}
