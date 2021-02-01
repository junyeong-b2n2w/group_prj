package com.gr.cg.dto;

public class UserAprvLnGrVO {
	private int ualg_no;
	private String ualg_empid;
	private int ualg_ord;
	private String ualg_aprvtype;
	private String emp_nm;
	private String dept_nm;
	private String rank_nm;

	public int getUalg_no() {
		return ualg_no;
	}

	public void setUalg_no(int ualg_no) {
		this.ualg_no = ualg_no;
	}

	public String getUalg_empid() {
		return ualg_empid;
	}

	public void setUalg_empid(String ualg_empid) {
		this.ualg_empid = ualg_empid;
	}

	public int getUalg_ord() {
		return ualg_ord;
	}

	public void setUalg_ord(int ualg_ord) {
		this.ualg_ord = ualg_ord;
	}

	public String getUalg_aprvtype() {
		return ualg_aprvtype;
	}

	public void setUalg_aprvtype(String ualg_aprvtype) {
		this.ualg_aprvtype = ualg_aprvtype;
	}

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

	@Override
	public String toString() {
		return "UserAprvLnGrVO [ualg_no=" + ualg_no + ", ualg_empid=" + ualg_empid + ", ualg_ord=" + ualg_ord
				+ ", ualg_aprvtype=" + ualg_aprvtype + ", emp_nm=" + emp_nm + ", dept_nm=" + dept_nm + "]";
	}

	public String getRank_nm() {
		return rank_nm;
	}

	public void setRank_nm(String rank_nm) {
		this.rank_nm = rank_nm;
	}
	
	
}
