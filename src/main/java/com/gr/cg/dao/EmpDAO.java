package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.security.core.GrantedAuthority;

import com.gr.cg.command.SearchCriteria;
import com.gr.cg.dto.EmpInformationVO;
import com.gr.cg.dto.EmployeeVO;

public interface EmpDAO {
	List<EmployeeVO> selectEmpList(SearchCriteria cri) throws SQLException;
	EmployeeVO selectEmpById(String emp_id) throws SQLException;
	void insertEmp(EmployeeVO emp) throws SQLException;
	//void updateEmp(EmployeeVO emp) throws SQLException;
	void deleteEmp(int empNo) throws SQLException;
	
	int selectEmpListTotalCount(SearchCriteria cri )throws SQLException;
		
	List<GrantedAuthority> getEmpRoles(String emp_id) throws SQLException;
	List<Map<String, Object>> selectEmpMapList(SearchCriteria cri) throws SQLException ;
	
	
	int isEmpId(String emp_id) throws SQLException;
	
	int updatePassword(EmployeeVO emp) throws SQLException;
	int resetPassword(EmployeeVO emp) throws SQLException;
	
	int insertEmployee(EmployeeVO emp) throws SQLException;
	
	int updateEmp(EmployeeVO emp) throws SQLException;
	
	int dropRole(String emp_id)  throws SQLException;
	int grantRole(EmpInformationVO empRoleInfoVO)  throws SQLException;
	
	
	List<Map<String, Object>> getChart(HashMap<String, Object> check) throws SQLException;
	List<Map<String, Object>> selectRoleCount(HashMap<String, Object> check) throws SQLException;
	
	void insertTopEmp(EmployeeVO emp) throws SQLException; 
	
	List<Map<String, Object>> selectCmListByCompNo( int comp_no) throws SQLException;
}
