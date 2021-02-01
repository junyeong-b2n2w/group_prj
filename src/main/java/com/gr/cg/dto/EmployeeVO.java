package com.gr.cg.dto;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class EmployeeVO implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String emp_id;
	private String emp_regr;
	private int emp_deptno;
	private int emp_rankno;
	private int emp_compno;
	private String emp_pass;
	private String emp_nm;
	private String emp_gend;
	private String emp_brdt;
	private String emp_pic;
	private String emp_inemail;
	private String emp_outemail;
	private int emp_empno;
	private String emp_ph;
	private String emp_pos;
	private String emp_tnrstt;
	private String emp_salctrstdd;
	private String emp_jncmpymd;
	private String emp_leaveymd;
	private String emp_proter_endymd;
	private int emp_ysal;
	private String emp_actvyn;
	private List<String> role_nm;
	public String getEmp_pwex() {
		return emp_pwex;
	}

	public void setEmp_pwex(String emp_pwex) {
		this.emp_pwex = emp_pwex;
	}

	private String rank_nm;
	private String emp_udtid;
	private String emp_pwex;
	public String getEmp_udtid() {
		return emp_udtid;
	}

	public void setEmp_udtid(String emp_udtid) {
		this.emp_udtid = emp_udtid;
	}

	public Date getEmp_regdt() {
		return emp_regdt;
	}

	public void setEmp_regdt(Date emp_regdt) {
		this.emp_regdt = emp_regdt;
	}

	public Date getEmp_udtdt() {
		return emp_udtdt;
	}

	public void setEmp_udtdt(Date emp_udtdt) {
		this.emp_udtdt = emp_udtdt;
	}

	private Date emp_regdt;
	private Date emp_udtdt;
	
	private int dept_no    ;
	private int dept_compno;
	private String dept_nm    ;
	private String dept_loc   ;
	private int dept_updept;
	private Date dept_regymd;
	private String dept_udtymd;
	private String dept_ph    ;
	private String dept_actvyn;
	
	
	
	
	private int comp_no    ;
	private String comp_addr  ;
	private String comp_nm    ;
	private String comp_hp    ;
	private String comp_actvyn;
	private String comp_brno  ;
	private Date comp_regymd;
	private String comp_logo  ;
	private String comp_seal  ;
	private String comp_delgnm;

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

	public int getComp_no() {
		return comp_no;
	}

	public void setComp_no(int comp_no) {
		this.comp_no = comp_no;
	}

	public String getComp_addr() {
		return comp_addr;
	}

	public void setComp_addr(String comp_addr) {
		this.comp_addr = comp_addr;
	}

	public String getComp_nm() {
		return comp_nm;
	}

	public void setComp_nm(String comp_nm) {
		this.comp_nm = comp_nm;
	}

	public String getComp_hp() {
		return comp_hp;
	}

	public void setComp_hp(String comp_hp) {
		this.comp_hp = comp_hp;
	}

	public String getComp_actvyn() {
		return comp_actvyn;
	}

	public void setComp_actvyn(String comp_actvyn) {
		this.comp_actvyn = comp_actvyn;
	}

	public String getComp_brno() {
		return comp_brno;
	}

	public void setComp_brno(String comp_brno) {
		this.comp_brno = comp_brno;
	}

	public Date getComp_regymd() {
		return comp_regymd;
	}

	public void setComp_regymd(Date comp_regymd) {
		this.comp_regymd = comp_regymd;
	}

	public String getComp_logo() {
		return comp_logo;
	}

	public void setComp_logo(String comp_logo) {
		this.comp_logo = comp_logo;
	}

	public String getComp_seal() {
		return comp_seal;
	}

	public void setComp_seal(String comp_seal) {
		this.comp_seal = comp_seal;
	}

	public String getComp_delgnm() {
		return comp_delgnm;
	}

	public void setComp_delgnm(String comp_delgnm) {
		this.comp_delgnm = comp_delgnm;
	}

	public String getEmp_regr() {
		return emp_regr;
	}

	public void setEmp_regr(String emp_regr) {
		this.emp_regr = emp_regr;
	}

	public int getEmp_deptno() {
		return emp_deptno;
	}

	public void setEmp_deptno(int emp_deptno) {
		this.emp_deptno = emp_deptno;
	}

	public int getEmp_rankno() {
		return emp_rankno;
	}

	public void setEmp_rankno(int emp_rankno) {
		this.emp_rankno = emp_rankno;
	}

	public int getEmp_compno() {
		return emp_compno;
	}

	public void setEmp_compno(int emp_compno) {
		this.emp_compno = emp_compno;
	}

	public String getEmp_nm() {
		return emp_nm;
	}

	public void setEmp_nm(String emp_nm) {
		this.emp_nm = emp_nm;
	}

	public String getEmp_gend() {
		return emp_gend;
	}

	public void setEmp_gend(String emp_gend) {
		this.emp_gend = emp_gend;
	}

	public String getEmp_brdt() {
		return emp_brdt;
	}

	public void setEmp_brdt(String emp_brdt) {
		this.emp_brdt = emp_brdt;
	}

	public String getEmp_pic() {
		return emp_pic;
	}

	public void setEmp_pic(String emp_pic) {
		this.emp_pic = emp_pic;
	}

	public String getEmp_inemail() {
		return emp_inemail;
	}

	public void setEmp_inemail(String emp_inemail) {
		this.emp_inemail = emp_inemail;
	}

	public String getEmp_outemail() {
		return emp_outemail;
	}

	public void setEmp_outemail(String emp_outemail) {
		this.emp_outemail = emp_outemail;
	}

	public int getEmp_empno() {
		return emp_empno;
	}

	public void setEmp_empno(int emp_empno) {
		this.emp_empno = emp_empno;
	}

	public String getEmp_ph() {
		return emp_ph;
	}

	public void setEmp_ph(String emp_ph) {
		this.emp_ph = emp_ph;
	}

	public String getEmp_pos() {
		return emp_pos;
	}

	public void setEmp_pos(String emp_pos) {
		this.emp_pos = emp_pos;
	}

	public String getEmp_tnrstt() {
		return emp_tnrstt;
	}

	public void setEmp_tnrstt(String emp_tnrstt) {
		this.emp_tnrstt = emp_tnrstt;
	}

	public String getEmp_salctrstdd() {
		return emp_salctrstdd;
	}

	public void setEmp_salctrstdd(String emp_salctrstdd) {
		this.emp_salctrstdd = emp_salctrstdd;
	}

	public String getEmp_jncmpymd() {
		return emp_jncmpymd;
	}

	public void setEmp_jncmpymd(String emp_jncmpymd) {
		this.emp_jncmpymd = emp_jncmpymd;
	}

	public String getEmp_leaveymd() {
		return emp_leaveymd;
	}

	public void setEmp_leaveymd(String emp_leaveymd) {
		this.emp_leaveymd = emp_leaveymd;
	}

	public String getEmp_proter_endymd() {
		return emp_proter_endymd;
	}

	public void setEmp_proter_endymd(String emp_proter_endymd) {
		this.emp_proter_endymd = emp_proter_endymd;
	}

	public int getEmp_ysal() {
		return emp_ysal;
	}

	public void setEmp_ysal(int emp_ysal) {
		this.emp_ysal = emp_ysal;
	}

	public String getEmp_actvyn() {
		return emp_actvyn;
	}

	public void setEmp_actvyn(String emp_actvyn) {
		this.emp_actvyn = emp_actvyn;
	}

	public String getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}

	public String getEmp_pass() {
		return emp_pass;
	}

	public void setEmp_pass(String emp_pass) {
		this.emp_pass = emp_pass;
	}

	public List<String> getRole_nm() {
		return role_nm;
	}

	public void setRole_nm(List<String> role_nm) {
		this.role_nm = role_nm;
	}

	public String getRank_nm() {
		return rank_nm;
	}

	public void setRank_nm(String rank_nm) {
		this.rank_nm = rank_nm;
	}
	
}
