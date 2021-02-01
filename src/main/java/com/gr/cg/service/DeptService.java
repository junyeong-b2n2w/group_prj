package com.gr.cg.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.gr.cg.command.EmployeePageCommand;
import com.gr.cg.command.SearchCriteria;
import com.gr.cg.command.SearchCriteria2;
import com.gr.cg.dto.DepartmentVO;
import com.gr.cg.dto.DeptHeadVO;

public interface DeptService {
	Map<String, Object> getDeptList(SearchCriteria cri) throws SQLException;
	
	Map<String,Object> getDeptListExceptMyDeptNoAndDeHeadVo(DepartmentVO dept) throws SQLException;
	List<DepartmentVO> getAllDeptList(SearchCriteria cri) throws SQLException;
	DepartmentVO GetDeptByDeptNo(int deptNo) throws SQLException;
	void registDept(DepartmentVO dept,String emp_headid) throws SQLException;
	
	int modifyDept(DepartmentVO dept) throws SQLException;
	void modifyDeptHead(DeptHeadVO dHead) throws SQLException;
	//비활성, 활성 수정
	void modifyAtvYn(int dept_no) throws SQLException;
	
	List<EmployeePageCommand> getAllEmpList(SearchCriteria2 cri) throws SQLException;
	
	

}
