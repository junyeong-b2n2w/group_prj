package com.gr.cg.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.gr.cg.command.PageMaker2;

public class TaskVO extends PageMaker2{
	private int tasc_no;
	private String task_title;
	private String task_cont;
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date task_regdt;
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date task_ddlndt;
	private String task_color;
	private String task_stt;
	private String task_shape;
	private int task_impt;
	private String task_empid;
	private String task_attckey;
	private String perf_empid;
	private String emp_nm;
	private String rank_nm;
	private String task_delyn;
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date task_udtdt;
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date perf_cmpl;	
	private String empnm;
	private int count;
	private String emprank;
	private int perf_progress;
	private String perf_stt;
	private int perf_tascno;
	
	
	public int getPerf_tascno() {
		return perf_tascno;
	}

	public void setPerf_tascno(int perf_tascno) {
		this.perf_tascno = perf_tascno;
	}

	public String getPerf_stt() {
		return perf_stt;
	}

	public void setPerf_stt(String perf_stt) {
		this.perf_stt = perf_stt;
	}

	public int getPerf_progress() {
		return perf_progress;
	}

	public void setPerf_progress(int perf_progress) {
		this.perf_progress = perf_progress;
	}

	public String getEmpnm() {
		return empnm;
	}

	public void setEmpnm(String empnm) {
		this.empnm = empnm;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getEmprank() {
		return emprank;
	}

	public void setEmprank(String emprank) {
		this.emprank = emprank;
	}

	public Date getPerf_cmpl() {
		return perf_cmpl;
	}

	public void setPerf_cmpl(Date perf_cmpl) {
		this.perf_cmpl = perf_cmpl;
	}

	public Date getTask_udtdt() {
		return task_udtdt;
	}

	public void setTask_udtdt(Date task_udtdt) {
		this.task_udtdt = task_udtdt;
	}

	public String getTask_delyn() {
		return task_delyn;
	}

	public void setTask_delyn(String task_delyn) {
		this.task_delyn = task_delyn;
	}

	public String getEmp_nm() {
		return emp_nm;
	}

	public void setEmp_nm(String emp_nm) {
		this.emp_nm = emp_nm;
	}

	public String getRank_nm() {
		return rank_nm;
	}

	public void setRank_nm(String rank_nm) {
		this.rank_nm = rank_nm;
	}

	public String getPerf_empid() {
		return perf_empid;
	}

	public void setPerf_empid(String perf_empid) {
		this.perf_empid = perf_empid;
	}

	public TaskVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TaskVO(int tasc_no, String task_title, String task_cont, Date task_regdt, Date task_ddlndt,
			String task_color, String task_stt, String task_shape, int task_impt, String task_empid,
			String task_attckey) {
		super();
		this.tasc_no = tasc_no;
		this.task_title = task_title;
		this.task_cont = task_cont;
		this.task_regdt = task_regdt;
		this.task_ddlndt = task_ddlndt;
		this.task_color = task_color;
		this.task_stt = task_stt;
		this.task_shape = task_shape;
		this.task_impt = task_impt;
		this.task_empid = task_empid;
		this.task_attckey = task_attckey;
	}

	public int getTasc_no() {
		return tasc_no;
	}

	public void setTasc_no(int tasc_no) {
		this.tasc_no = tasc_no;
	}

	public String getTask_title() {
		return task_title;
	}

	public void setTask_title(String task_title) {
		this.task_title = task_title;
	}

	public String getTask_cont() {
		return task_cont;
	}

	public void setTask_cont(String task_cont) {
		this.task_cont = task_cont;
	}

	public Date getTask_regdt() {
		return task_regdt;
	}

	public void setTask_regdt(Date task_regdt) {
		this.task_regdt = task_regdt;
	}

	public Date getTask_ddlndt() {
		return task_ddlndt;
	}

	public void setTask_ddlndt(Date task_ddlndt) {
		this.task_ddlndt = task_ddlndt;
	}

	public String getTask_color() {
		return task_color;
	}

	public void setTask_color(String task_color) {
		this.task_color = task_color;
	}

	public String getTask_stt() {
		return task_stt;
	}

	public void setTask_stt(String task_stt) {
		this.task_stt = task_stt;
	}

	public String getTask_shape() {
		return task_shape;
	}

	public void setTask_shape(String task_shape) {
		this.task_shape = task_shape;
	}

	public int getTask_impt() {
		return task_impt;
	}

	public void setTask_impt(int task_impt) {
		this.task_impt = task_impt;
	}

	public String getTask_empid() {
		return task_empid;
	}

	public void setTask_empid(String task_empid) {
		this.task_empid = task_empid;
	}

	public String getTask_attckey() {
		return task_attckey;
	}

	public void setTask_attckey(String task_attckey) {
		this.task_attckey = task_attckey;
	}

	@Override
	public String toString() {
		return "TaskVO [tasc_no=" + tasc_no + ", task_title=" + task_title + ", task_cont=" + task_cont
				+ ", task_regdt=" + task_regdt + ", task_ddlndt=" + task_ddlndt + ", task_color=" + task_color
				+ ", task_stt=" + task_stt + ", task_shape=" + task_shape + ", task_impt=" + task_impt + ", task_empid="
				+ task_empid + ", task_attckey=" + task_attckey + ", perf_empid=" + perf_empid + ", emp_nm=" + emp_nm
				+ ", rank_nm=" + rank_nm + ", task_delyn=" + task_delyn + ", task_udtdt=" + task_udtdt + ", perf_cmpl="
				+ perf_cmpl + ", empnm=" + empnm + ", count=" + count + ", emprank=" + emprank + ", perf_progress="
				+ perf_progress + ", perf_stt=" + perf_stt + ", perf_tascno=" + perf_tascno + "]";
	}
	
}
