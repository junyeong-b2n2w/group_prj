package com.gr.cg.service;

import java.sql.SQLException;
import java.util.List;

import com.gr.cg.command.EncryptionUtils;
import com.gr.cg.command.SearchCriteria2;
import com.gr.cg.dao.CompanyDAO;
import com.gr.cg.dao.DeptDAO;
import com.gr.cg.dao.EmpDAO;
import com.gr.cg.dao.RankDAO;
import com.gr.cg.dto.CompanyVO;
import com.gr.cg.dto.DepartmentVO;
import com.gr.cg.dto.EmpInformationVO;
import com.gr.cg.dto.EmployeeVO;
import com.gr.cg.dto.RankVO;

public class CompanyServiceImpl implements CompanyService {
	
	private CompanyDAO companyDAO;
	
	public void setCompanyDAO(CompanyDAO companyDAO) {
		this.companyDAO = companyDAO;
	}
	
	private DeptDAO deptDAO;
	
	public void setDeptDAO(DeptDAO deptDAO) {
		this.deptDAO = deptDAO;
	}
	
	private RankDAO rankDAO;
	
	public void setRankDAO(RankDAO rankDAO) {
		this.rankDAO = rankDAO;
	}
	
	private EmpDAO empDAO;
	
	public void setEmpDAO(EmpDAO empDAO) {
		this.empDAO = empDAO;
	}
	
	@Override
	public List<CompanyVO> getCompanyList(SearchCriteria2 search) throws SQLException {
		return companyDAO.selectCompanyList(search);
	}
	
	@Override
	public CompanyVO getCompany(int comp_no) throws SQLException {
		return companyDAO.selectCompany(comp_no);
	}
	
	@Override
	public int registCompany(CompanyVO comp) throws SQLException {
		DepartmentVO dept = new DepartmentVO();
		RankVO rank = new RankVO();
		EmployeeVO emp = new EmployeeVO();
		EmpInformationVO erf = new EmpInformationVO();
		
		int compno = companyDAO.selectCompanySqlNextValue();
		comp.setComp_no(compno);
		companyDAO.insertCompany(comp);
		
//		최상위부서 등록
		int deptno = deptDAO.selectDeptSeq();
		
		dept.setDept_no(deptno);
		dept.setDept_compno(compno);
		dept.setDept_nm(comp.getComp_nm());
		dept.setDept_loc(comp.getComp_nm());
		dept.setDept_ph(comp.getComp_hp());
		
		deptDAO.insertTopDept(dept);
		
//		최상위 직급 등록
		int rankno = rankDAO.selectRankSeq();
		rank.setRank_no(rankno);	
		rank.setRank_nm(comp.getComp_nm());
		rank.setRank_compno(compno);
		rank.setRank_regid(comp.getComp_regid());
		
		rankDAO.registSuperRank(rank);
		
//		최상위 직원 등록
		emp.setEmp_id("admin" + compno);
		emp.setEmp_regr(comp.getComp_regid());
		emp.setEmp_compno(compno);
		emp.setEmp_deptno(deptno);
		emp.setEmp_rankno(rankno);
		emp.setEmp_actvyn("Y");
		String enc_pass = EncryptionUtils.encryptSHA256("admin321*");
		emp.setEmp_pass(enc_pass);
		emp.setEmp_nm(comp.getComp_delgnm());
		emp.setEmp_ph(comp.getComp_hp());
		
		empDAO.insertTopEmp(emp);

//		최상위 권한 부여
		erf.setEri_roleno("20");
		erf.setEri_emp_id(emp.getEmp_id());
		erf.setEri_regid(comp.getComp_regid());
		empDAO.grantRole(erf);

		erf.setEri_roleno("2");
		erf.setEri_emp_id(emp.getEmp_id());
		erf.setEri_regid(comp.getComp_regid());
		empDAO.grantRole(erf);

		erf.setEri_roleno("3");
		erf.setEri_emp_id(emp.getEmp_id());
		erf.setEri_regid(comp.getComp_regid());
		empDAO.grantRole(erf);
		
		erf.setEri_roleno("4");
		erf.setEri_emp_id(emp.getEmp_id());
		erf.setEri_regid(comp.getComp_regid());
		empDAO.grantRole(erf);
		
		erf.setEri_roleno("5");
		erf.setEri_emp_id(emp.getEmp_id());
		erf.setEri_regid(comp.getComp_regid());
		empDAO.grantRole(erf);
		
		erf.setEri_roleno("6");
		erf.setEri_emp_id(emp.getEmp_id());
		erf.setEri_regid(comp.getComp_regid());
		empDAO.grantRole(erf);
		
		return compno;
	}

	@Override
	public void updateCompany(CompanyVO comp) throws SQLException {
		companyDAO.updateCompany(comp);	
	}
	
	@Override
	public void updateInactive(int comp_no) throws SQLException {
		companyDAO.updateActvN(comp_no);
	}
}
