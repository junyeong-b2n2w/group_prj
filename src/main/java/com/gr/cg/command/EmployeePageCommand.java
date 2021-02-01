package com.gr.cg.command;

public class EmployeePageCommand extends PageMaker2{
	
	private String emp_id;
	private String emp_nm;
	private int emp_compno;
	private int emp_rankno;
	private String emp_ranknm;
	private int emp_deptno;
	private String emp_deptnm;
	private String emp_headid;
	
	public EmployeePageCommand() {
		// TODO Auto-generated constructor stub
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
	public int getEmp_compno() {
		return emp_compno;
	}
	public void setEmp_compno(int emp_compno) {
		this.emp_compno = emp_compno;
	}
	public int getEmp_rankno() {
		return emp_rankno;
	}
	public void setEmp_rankno(int emp_rankno) {
		this.emp_rankno = emp_rankno;
	}
	public String getEmp_ranknm() {
		return emp_ranknm;
	}
	public void setEmp_ranknm(String emp_ranknm) {
		this.emp_ranknm = emp_ranknm;
	}
	public int getEmp_deptno() {
		return emp_deptno;
	}
	public void setEmp_deptno(int emp_deptno) {
		this.emp_deptno = emp_deptno;
	}
	public String getEmp_deptnm() {
		return emp_deptnm;
	}
	public void setEmp_deptnm(String emp_deptnm) {
		this.emp_deptnm = emp_deptnm;
	}
	public String getEmp_headid() {
		return emp_headid;
	}
	public void setEmp_headid(String emp_headid) {
		this.emp_headid = emp_headid;
	}
	public EmployeePageCommand(String emp_id, String emp_nm, int emp_compno, int emp_rankno, String emp_ranknm,
			int emp_deptno, String emp_deptnm, String emp_headid) {
		super();
		this.emp_id = emp_id;
		this.emp_nm = emp_nm;
		this.emp_compno = emp_compno;
		this.emp_rankno = emp_rankno;
		this.emp_ranknm = emp_ranknm;
		this.emp_deptno = emp_deptno;
		this.emp_deptnm = emp_deptnm;
		this.emp_headid = emp_headid;
	}
	@Override
	public String toString() {
		return "EmployeePageCommand [emp_id=" + emp_id + ", emp_nm=" + emp_nm + ", emp_compno=" + emp_compno
				+ ", emp_rankno=" + emp_rankno + ", emp_ranknm=" + emp_ranknm + ", emp_deptno=" + emp_deptno
				+ ", emp_deptnm=" + emp_deptnm + ", emp_headid=" + emp_headid + "]";
	}
	

	
	
	
	

}
