package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.gr.cg.command.EmployeePageCommand;
import com.gr.cg.command.SearchCriteria;
import com.gr.cg.command.SearchCriteria2;
import com.gr.cg.dto.DepartmentVO;
import com.gr.cg.dto.DeptHeadVO;

public interface DeptDAO {
	
	//최상위 부서  제외한 전체 리스트
	List<DepartmentVO> selectDeptList(SearchCriteria cri) throws SQLException;
	int getDeptCount(SearchCriteria cri)throws SQLException;
	
	//맨 상위 포함한 회사별 전체 부서리스트 
	List<DepartmentVO> selectAllDeptList(SearchCriteria cri) throws SQLException;
	
	//해당 부서 제외한 모든 부서 가져오기
	List<DepartmentVO> selectDeptListExceptMyDeptNo(DepartmentVO dept);
	
	DepartmentVO selectDeptByDeptNo(int deptNo) throws SQLException;
	
	void registDepartment(DepartmentVO dept) throws SQLException;
	int  modifyDepartment(DepartmentVO dept) throws SQLException;
	
	//활성 비활성 수정
	void modifyActvYn(DepartmentVO dept)  throws SQLException;
	
	//시퀀스
	int selectDeptSeq()throws SQLException;
	
	int insertTopDept(DepartmentVO dept) throws SQLException;
	
	List<EmployeePageCommand> getAllEmpListByCompNo(SearchCriteria2 cri) throws SQLException;
	
	void insertdepartmentHead(EmployeePageCommand empcom)throws SQLException;
	void updatedepartmentHead(DeptHeadVO dhead)throws SQLException;
	void updateEmpDeptNO(DeptHeadVO dhead)throws SQLException;
	
	
	DeptHeadVO getDeptHeadByDeptNo(int deptno)throws SQLException;
	
}

