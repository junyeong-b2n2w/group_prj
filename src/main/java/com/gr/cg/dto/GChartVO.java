package com.gr.cg.dto;

import java.util.List;

import com.gr.cg.command.PageMaker2;

public class GChartVO extends PageMaker2{
	
	private int rank_no;
	private String rank_nm;
	private String emp_id;
	private String emp_nm;
	private int emp_deptno;
	private String dept_nm;
	private int dept_no;
	private int dept_updept;
	private int rlevel;
	
	
	private List<GChartVO> empList;
	
	
	
	
//	@Override
//	public String toString() {
//		return dept_nm + "$$" + dept_no + "$$" + dept_upno;
//	}
//	
	
	
	public List<GChartVO> getEmpList() {
		return empList;
	}
	public void setEmpList(List<GChartVO> empList) {
		this.empList = empList;
	}
	
	public int getDept_updept() {
		return dept_updept;
	}
	public void setDept_updept(int dept_updept) {
		this.dept_updept = dept_updept;
	}
	public int getRank_no() {
		return rank_no;
	}
	public void setRank_no(int rank_no) {
		this.rank_no = rank_no;
	}
	public String getRank_nm() {
		return rank_nm;
	}
	public void setRank_nm(String rank_nm) {
		this.rank_nm = rank_nm;
	}
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public String getEmp_nm() {
		return emp_nm;
	}
	public void setEmp_nm(String emp_nm) {
		this.emp_nm = emp_nm;
	}
	public int getEmp_deptno() {
		return emp_deptno;
	}
	public void setEmp_deptno(int emp_deptno) {
		this.emp_deptno = emp_deptno;
	}
	public String getDept_nm() {
		return dept_nm;
	}
	public void setDept_nm(String dept_nm) {
		this.dept_nm = dept_nm;
	}
	public int getDept_no() {
		return dept_no;
	}
	public void setDept_no(int dept_no) {
		this.dept_no = dept_no;
	}
	public int getRlevel() {
		return rlevel;
	}
	public void setRlevel(int rlevel) {
		this.rlevel = rlevel;
	}
	
	
	
	
}

