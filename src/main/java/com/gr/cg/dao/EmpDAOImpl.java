package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.security.core.GrantedAuthority;

import com.gr.cg.command.SearchCriteria;
import com.gr.cg.dto.EmpInformationVO;
import com.gr.cg.dto.EmployeeVO;

public class EmpDAOImpl implements EmpDAO{
	
	private SqlSession session;
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public EmployeeVO selectEmpById(String emp_id) throws SQLException {
		return session.selectOne("Emp-Mapper.selectEmpById", emp_id);
	}

	@Override
	public List<EmployeeVO> selectEmpList(SearchCriteria cri) throws SQLException {
		
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return session.selectList("Emp-Mapper.selectEmpList", cri,rowBounds);
	}
	
	@Override
	public List<Map<String, Object>> selectEmpMapList(SearchCriteria cri) throws SQLException {
		
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return session.selectList("Emp-Mapper.selectEmpMapList", cri,rowBounds);
	}
	
	@Override
	public int selectEmpListTotalCount(SearchCriteria cri) throws SQLException {
		return session.selectOne("Emp-Mapper.selectEmpListTotalCount", cri);
	}

	@Override
	public void insertEmp(EmployeeVO emp) throws SQLException {
		session.update("Emp-Mapper.insertEmp", emp);
	}

//	@Override
//	public void updateEmp(EmployeeVO emp) throws SQLException {
//		session.update("Emp-Mapper.updateEmp", emp);
//	}

	@Override
	public void deleteEmp(int emp_no) throws SQLException {
		session.update("Emp-Mapper.deleteEmp", emp_no);
	}

	@Override
	public List<GrantedAuthority> getEmpRoles(String emp_id) throws SQLException {
		
		return session.selectList("Emp-Mapper.getEmpRoles", emp_id);
	}

	@Override
	public int isEmpId(String emp_id) throws SQLException {
		return session.selectOne("Emp-Mapper.isEmpId",emp_id);
	}

	@Override
	public int updatePassword(EmployeeVO emp) throws SQLException {
		return session.update("Emp-Mapper.updatePassword",emp);
	}

	
	
	@Override
	public int resetPassword(EmployeeVO emp) throws SQLException {
		return session.update("Emp-Mapper.resetPassword",emp);
	}
	
	@Override
	public int insertEmployee(EmployeeVO emp) throws SQLException {
		return session.update("Emp-Mapper.insertEmployee",emp);
	}

	@Override
	public int updateEmp(EmployeeVO emp) throws SQLException {
		return session.update("Emp-Mapper.updateEmp",emp);
	}
	
	@Override
	public int dropRole(String emp_id) throws SQLException {
		return session.update("Emp-Mapper.dropRole",emp_id);
	}
	@Override
	public int grantRole(EmpInformationVO empRoleInfoVO) throws SQLException {
		return session.update("Emp-Mapper.grantRole",empRoleInfoVO);
	}
	
	@Override
	public List<Map<String, Object>> getChart(HashMap<String, Object> check) throws SQLException {
		return session.selectList("Emp-Mapper.getChart", check);
	}
	
	@Override
	public List<Map<String, Object>> selectRoleCount(HashMap<String, Object> check) throws SQLException {
		return session.selectList("Emp-Mapper.selectRoleCount", check);
	}
	@Override
	public List<Map<String, Object>> selectCmListByCompNo( int comp_no) throws SQLException {
		return session.selectList("Emp-Mapper.selectCmListByCompNo", comp_no);
	}
	
	@Override
	public void insertTopEmp(EmployeeVO emp) throws SQLException {
		session.update("Emp-Mapper.insertTopEmp", emp);
	}
}
