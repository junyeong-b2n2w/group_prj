package com.gr.cg.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.gr.cg.command.SearchCriteria;
import com.gr.cg.dto.EmpInformationVO;
import com.gr.cg.dto.EmployeeVO;
import com.gr.cg.exception.InvalidPasswordException;
import com.gr.cg.exception.NotFoundIDException;

public interface EmpService {
	void login(String emp_id, String emp_pwd, HttpSession session) throws SQLException, NotFoundIDException, InvalidPasswordException;
	Map<String, Object> getEmpList(SearchCriteria cri) ;
	Map<String, Object> GetEmpByEmpId(String emp_id);
	void registEmp(EmployeeVO emp) ;
	void modifyEmp(EmployeeVO emp) ;
	void removeEmp(int empNo) throws SQLException;
	public Map<String,Object> registEmpForm(int comp_no);
	String isEmpId(String emp_id);
	String resetPassword(String emp_id);
	
	public Map<String,Object> modifyEmpForm(String emp_id);
	
	void grantRoles(EmpInformationVO empRoleInfoVO ,List<String> roleList);
	
	String changePassword(String emp_id, String old_pass, String new_pass) throws InvalidPasswordException;
	
	List<Map<String,Object>> empChart(HashMap<String, Object> check);
	List<Map<String,Object>> empRoleCount(HashMap<String, Object> check);
	
	public void registCompanyAdmin (String comp_no);
	List<Map<String, Object>> getCmList(int comp_no);
		
}
