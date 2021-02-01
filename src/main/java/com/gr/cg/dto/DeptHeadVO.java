package com.gr.cg.dto;

public class DeptHeadVO {
	private String depthd_empid ;
	private int depthd_deptno;
	private String depthd_empnm ;
	public String getDepthd_empid() {
		return depthd_empid;
	}
	public void setDepthd_empid(String depthd_empid) {
		this.depthd_empid = depthd_empid;
	}
	public int getDepthd_deptno() {
		return depthd_deptno;
	}
	public void setDepthd_deptno(int depthd_deptno) {
		this.depthd_deptno = depthd_deptno;
	}
	public String getDepthd_empnm() {
		return depthd_empnm;
	}
	public void setDepthd_empnm(String depthd_empnm) {
		this.depthd_empnm = depthd_empnm;
	}
	public DeptHeadVO(String depthd_empid, int depthd_deptno, String depthd_empnm) {
		super();
		this.depthd_empid = depthd_empid;
		this.depthd_deptno = depthd_deptno;
		this.depthd_empnm = depthd_empnm;
	}
	@Override
	public String toString() {
		return "DeptHeadVO [depthd_empid=" + depthd_empid + ", depthd_deptno=" + depthd_deptno + ", depthd_empnm="
				+ depthd_empnm + "]";
	}
	
	
	
	public DeptHeadVO() {
		// TODO Auto-generated constructor stub
	}

}
