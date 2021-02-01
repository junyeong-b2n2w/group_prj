package com.gr.cg.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.gr.cg.command.EmployeePageCommand;
import com.gr.cg.command.PageMaker;
import com.gr.cg.command.SearchCriteria;
import com.gr.cg.command.SearchCriteria2;
import com.gr.cg.dao.DeptDAO;
import com.gr.cg.dto.DepartmentVO;
import com.gr.cg.dto.DeptHeadVO;

public class DeptServiceImpl implements DeptService{

	private DeptDAO deptDAO;
	
	
	public void setDeptDAO(DeptDAO deptDAO) {
		this.deptDAO = deptDAO;
	}
	@Override
	public Map<String, Object> getDeptList(SearchCriteria cri) throws SQLException {
		
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<DepartmentVO> deptList = deptDAO.selectDeptList(cri);
		int totalCnt = deptDAO.getDeptCount(cri);
		
		List<DepartmentVO> allDeptList = deptDAO.selectAllDeptList(cri);

		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCnt);
		
		dataMap.put("deptList", deptList);
		dataMap.put("allDeptList", allDeptList);
//		dataMap.put("companyName", session.com_nm);
		
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	
	
	@Override
	public DepartmentVO GetDeptByDeptNo(int deptNo) throws SQLException {
		return deptDAO.selectDeptByDeptNo(deptNo);
	}
	@Override
	public void registDept(DepartmentVO dept,String emp_headid) throws SQLException {
		
		int seq = deptDAO.selectDeptSeq();
		dept.setDept_no(seq);
		
		deptDAO.registDepartment(dept);	

		if(emp_headid != null) {
			
			EmployeePageCommand empcom = new EmployeePageCommand();
			empcom.setEmp_deptno(seq);
			empcom.setEmp_headid(emp_headid);
			deptDAO.insertdepartmentHead(empcom);
		}
		
		
		
	}
	@Override
	public int modifyDept(DepartmentVO dept) throws SQLException {
	
		int chk = deptDAO.modifyDepartment(dept);	
		return chk;
	}
	@Override
	public Map<String, Object> getDeptListExceptMyDeptNoAndDeHeadVo(DepartmentVO dept) throws SQLException {

		
		Map<String, Object> dataMap = new HashMap<>();
		List<DepartmentVO> deptList = deptDAO.selectDeptListExceptMyDeptNo(dept);
		DeptHeadVO dhead = deptDAO.getDeptHeadByDeptNo(dept.getDept_no());
		
		dataMap.put("deptList", deptList);
		dataMap.put("dhead", dhead);
		return dataMap;
	}
	@Override
	public List<DepartmentVO> getAllDeptList(SearchCriteria cri) throws SQLException {

		List<DepartmentVO> dList = deptDAO.selectDeptList(cri);
		return dList;
	}
	@Override
	public void modifyAtvYn(int dept_no) throws SQLException {
		
		DepartmentVO modifyDept = deptDAO.selectDeptByDeptNo(dept_no);
		
		if(modifyDept.getDept_actvyn().equals("Y")) {
			modifyDept.setDept_actvyn("N");
		}else if(modifyDept.getDept_actvyn().equals("N")){
			modifyDept.setDept_actvyn("Y");
			
		}
		
		 deptDAO.modifyActvYn(modifyDept);
		
	}
	@Override
	public List<EmployeePageCommand> getAllEmpList(SearchCriteria2 cri) throws SQLException {
		// TODO Auto-generated method stub
		return deptDAO.getAllEmpListByCompNo(cri);
	}
	@Override
	public void modifyDeptHead(DeptHeadVO dHead) throws SQLException {
		
	EmployeePageCommand ecom = new EmployeePageCommand();	
	DeptHeadVO dhead = deptDAO.getDeptHeadByDeptNo(dHead.getDepthd_deptno());
	if(dhead == null) {
		ecom.setEmp_deptno(dHead.getDepthd_deptno());
		ecom.setEmp_headid(dHead.getDepthd_empid());
		deptDAO.insertdepartmentHead(ecom);
	}else {
		//직원의 부서정보도 업데이트 해주기
		deptDAO.updatedepartmentHead(dHead);
	}
		
	deptDAO.updateEmpDeptNO(dHead);
		
	}

}

