package com.gr.cg.dto;

import java.util.Date;



public class PerformerVO {
	private int perf_tascno;
	private String perf_empid;
	private String perf_stt;
	private Date perf_cmpl;
	private String perf_attckey;
	private int perf_progress;
	private String perf_cont;
	private String perf_delyn;
	private String perf_rere;
	
	public String getPerf_rere() {
		return perf_rere;
	}

	public void setPerf_rere(String perf_rere) {
		this.perf_rere = perf_rere;
	}

	public String getPerf_delyn() {
		return perf_delyn;
	}

	public void setPerf_delyn(String perf_delyn) {
		this.perf_delyn = perf_delyn;
	}

	public int getPerf_progress() {
		return perf_progress;
	}

	public void setPerf_progress(int perf_progress) {
		this.perf_progress = perf_progress;
	}

	public String getPerf_cont() {
		return perf_cont;
	}

	public void setPerf_cont(String perf_cont) {
		this.perf_cont = perf_cont;
	}

	public PerformerVO() {
		super();
	}

	public PerformerVO(int perf_tascno, String perf_empid, String perf_stt, Date perf_cmpl, String perf_attckey) {
		super();
		this.perf_tascno = perf_tascno;
		this.perf_empid = perf_empid;
		this.perf_stt = perf_stt;
		this.perf_cmpl = perf_cmpl;
		this.perf_attckey = perf_attckey;
	}

	public int getPerf_tascno() {
		return perf_tascno;
	}

	public void setPerf_tascno(int perf_tascno) {
		this.perf_tascno = perf_tascno;
	}

	public String getPerf_empid() {
		return perf_empid;
	}

	public void setPerf_empid(String perf_empid) {
		this.perf_empid = perf_empid;
	}

	public String getPerf_stt() {
		return perf_stt;
	}

	public void setPerf_stt(String perf_stt) {
		this.perf_stt = perf_stt;
	}

	public Date getPerf_cmpl() {
		return perf_cmpl;
	}

	public void setPerf_cmpl(Date perf_cmpl) {
		this.perf_cmpl = perf_cmpl;
	}

	public String getPerf_attckey() {
		return perf_attckey;
	}

	public void setPerf_attckey(String perf_attckey) {
		this.perf_attckey = perf_attckey;
	}

	@Override
	public String toString() {
		return "PerformerVO [perf_tascno=" + perf_tascno + ", perf_empid=" + perf_empid + ", perf_stt=" + perf_stt
				+ ", perf_cmpl=" + perf_cmpl + ", perf_attckey=" + perf_attckey + ", perf_progress=" + perf_progress
				+ ", perf_cont=" + perf_cont + ", perf_delyn=" + perf_delyn + ", perf_rere=" + perf_rere + "]";
	}
	
}
