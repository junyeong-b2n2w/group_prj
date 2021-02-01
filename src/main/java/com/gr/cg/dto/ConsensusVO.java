package com.gr.cg.dto;

import java.util.List;

public class ConsensusVO {
	private int cons_no     ;
	private String cons_empid  ;
	private String cons_comm   ;
	private String cons_asgmdt ;
	private String cons_idntydt;
	private String cons_agredt ;
	private int cons_ord    ;
	private String cons_printyn;
	private String cons_agrestt;
	private int aprv_edno;
	private int cons_edno;
	private String emp_nm;
	private String dept_nm;
	private String rank_nm;
	public String getEmp_nm() {
		return emp_nm;
	}
	public void setEmp_nm(String emp_nm) {
		this.emp_nm = emp_nm;
	}
	public String getDept_nm() {
		return dept_nm;
	}
	public void setDept_nm(String dept_nm) {
		this.dept_nm = dept_nm;
	}
	public String getRank_nm() {
		return rank_nm;
	}
	public void setRank_nm(String rank_nm) {
		this.rank_nm = rank_nm;
	}
	private List<ConsensusVO> consList;
	
	public ConsensusVO(int cons_no, String cons_empid, String cons_comm, String cons_asgmdt, String cons_idntydt,
			String cons_agredt, int cons_ord, String cons_printyn, String cons_agrestt, int aprv_edno, int cons_edno,
			List<ConsensusVO> consList) {
		super();
		this.cons_no = cons_no;
		this.cons_empid = cons_empid;
		this.cons_comm = cons_comm;
		this.cons_asgmdt = cons_asgmdt;
		this.cons_idntydt = cons_idntydt;
		this.cons_agredt = cons_agredt;
		this.cons_ord = cons_ord;
		this.cons_printyn = cons_printyn;
		this.cons_agrestt = cons_agrestt;
		this.aprv_edno = aprv_edno;
		this.cons_edno = cons_edno;
		this.consList = consList;
	}
	public ConsensusVO() {
		super();
	}
	public int getCons_no() {
		return cons_no;
	}
	public void setCons_no(int cons_no) {
		this.cons_no = cons_no;
	}
	public String getCons_empid() {
		return cons_empid;
	}
	public void setCons_empid(String cons_empid) {
		this.cons_empid = cons_empid;
	}
	public String getCons_comm() {
		return cons_comm;
	}
	public void setCons_comm(String cons_comm) {
		this.cons_comm = cons_comm;
	}
	public String getCons_asgmdt() {
		return cons_asgmdt;
	}
	public void setCons_asgmdt(String cons_asgmdt) {
		this.cons_asgmdt = cons_asgmdt;
	}
	public String getCons_idntydt() {
		return cons_idntydt;
	}
	public void setCons_idntydt(String cons_idntydt) {
		this.cons_idntydt = cons_idntydt;
	}
	public String getCons_agredt() {
		return cons_agredt;
	}
	public void setCons_agredt(String cons_agredt) {
		this.cons_agredt = cons_agredt;
	}
	public int getCons_ord() {
		return cons_ord;
	}
	public void setCons_ord(int cons_ord) {
		this.cons_ord = cons_ord;
	}
	public String getCons_printyn() {
		return cons_printyn;
	}
	public void setCons_printyn(String cons_printyn) {
		this.cons_printyn = cons_printyn;
	}
	public String getCons_agrestt() {
		return cons_agrestt;
	}
	public void setCons_agrestt(String cons_agrestt) {
		this.cons_agrestt = cons_agrestt;
	}
	public int getAprv_edno() {
		return aprv_edno;
	}
	public void setAprv_edno(int aprv_edno) {
		this.aprv_edno = aprv_edno;
	}
	public List<ConsensusVO> getConsList() {
		return consList;
	}
	public void setConsList(List<ConsensusVO> consList) {
		this.consList = consList;
	}
	public int getCons_edno() {
		return cons_edno;
	}
	public void setCons_edno(int cons_edno) {
		this.cons_edno = cons_edno;
	}
}
