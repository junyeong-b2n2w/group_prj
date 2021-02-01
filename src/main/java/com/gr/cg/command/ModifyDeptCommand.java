package com.gr.cg.command;

import java.sql.Date;

import com.gr.cg.dto.DepartmentVO;
import com.gr.cg.dto.DeptHeadVO;

public class ModifyDeptCommand {
	
	
	private int dept_no    ;
	private int dept_compno;
	private String dept_nm    ;
	private String dept_loc   ;
	private int dept_updept;
	private Date dept_regymd;
	private String dept_udtymd;
	private String dept_ph    ;
	private String dept_actvyn;
	private String dept_upnm; //상위 부서명
	
	private int depthd_deptno;
	private String depthd_empid ;
	
	public ModifyDeptCommand() {
		// TODO Auto-generated constructor stub
	}
	public int getDept_no() {
		return dept_no;
	}
	public void setDept_no(int dept_no) {
		this.dept_no = dept_no;
	}
	public int getDept_compno() {
		return dept_compno;
	}
	public void setDept_compno(int dept_compno) {
		this.dept_compno = dept_compno;
	}
	public String getDept_nm() {
		return dept_nm;
	}
	public void setDept_nm(String dept_nm) {
		this.dept_nm = dept_nm;
	}
	public String getDept_loc() {
		return dept_loc;
	}
	public void setDept_loc(String dept_loc) {
		this.dept_loc = dept_loc;
	}
	public int getDept_updept() {
		return dept_updept;
	}
	public void setDept_updept(int dept_updept) {
		this.dept_updept = dept_updept;
	}
	public Date getDept_regymd() {
		return dept_regymd;
	}
	public void setDept_regymd(Date dept_regymd) {
		this.dept_regymd = dept_regymd;
	}
	public String getDept_udtymd() {
		return dept_udtymd;
	}
	public void setDept_udtymd(String dept_udtymd) {
		this.dept_udtymd = dept_udtymd;
	}
	public String getDept_ph() {
		return dept_ph;
	}
	public void setDept_ph(String dept_ph) {
		this.dept_ph = dept_ph;
	}
	public String getDept_actvyn() {
		return dept_actvyn;
	}
	public void setDept_actvyn(String dept_actvyn) {
		this.dept_actvyn = dept_actvyn;
	}
	public String getDept_upnm() {
		return dept_upnm;
	}
	public void setDept_upnm(String dept_upnm) {
		this.dept_upnm = dept_upnm;
	}
	public int getDepthd_deptno() {
		return depthd_deptno;
	}
	public void setDepthd_deptno(int depthd_deptno) {
		this.depthd_deptno = depthd_deptno;
	}
	public String getDepthd_empid() {
		return depthd_empid;
	}
	public void setDepthd_empid(String depthd_empid) {
		this.depthd_empid = depthd_empid;
	}
	@Override
	public String toString() {
		return "ModifyDeptCommand [dept_no=" + dept_no + ", dept_compno=" + dept_compno + ", dept_nm=" + dept_nm
				+ ", dept_loc=" + dept_loc + ", dept_updept=" + dept_updept + ", dept_regymd=" + dept_regymd
				+ ", dept_udtymd=" + dept_udtymd + ", dept_ph=" + dept_ph + ", dept_actvyn=" + dept_actvyn
				+ ", dept_upnm=" + dept_upnm + ", depthd_deptno=" + depthd_deptno + ", depthd_empid=" + depthd_empid
				+ "]";
	}
	public ModifyDeptCommand(int dept_no, int dept_compno, String dept_nm, String dept_loc, int dept_updept,
			Date dept_regymd, String dept_udtymd, String dept_ph, String dept_actvyn, String dept_upnm,
			int depthd_deptno, String depthd_empid) {
		super();
		this.dept_no = dept_no;
		this.dept_compno = dept_compno;
		this.dept_nm = dept_nm;
		this.dept_loc = dept_loc;
		this.dept_updept = dept_updept;
		this.dept_regymd = dept_regymd;
		this.dept_udtymd = dept_udtymd;
		this.dept_ph = dept_ph;
		this.dept_actvyn = dept_actvyn;
		this.dept_upnm = dept_upnm;
		this.depthd_deptno = depthd_deptno;
		this.depthd_empid = depthd_empid;
	}
	
	
	public DepartmentVO toParseDept() {
		DepartmentVO dept = new DepartmentVO();
		dept.setDept_no(this.dept_no);
		dept.setDept_actvyn(this.dept_actvyn);
		dept.setDept_compno(this.dept_compno);
		dept.setDept_loc(this.dept_loc);
		dept.setDept_nm(this.dept_nm);
		dept.setDept_ph(this.dept_ph);
		dept.setDept_regymd(this.dept_regymd);
		dept.setDept_updept(this.dept_updept);
		dept.setDept_upnm(this.dept_upnm);
		return dept;
	}
	
	public DeptHeadVO toParseDHead() {
		DeptHeadVO dhead = new DeptHeadVO();
		dhead.setDepthd_deptno(this.dept_no);
		dhead.setDepthd_empid(this.depthd_empid);
		
		return dhead;
	}

}
