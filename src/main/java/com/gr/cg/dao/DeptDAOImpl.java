package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.gr.cg.command.EmployeePageCommand;
import com.gr.cg.command.SearchCriteria;
import com.gr.cg.command.SearchCriteria2;
import com.gr.cg.dto.DepartmentVO;
import com.gr.cg.dto.DeptHeadVO;

public class DeptDAOImpl implements DeptDAO{
	
	private SqlSession session;
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<DepartmentVO> selectDeptList(SearchCriteria cri) throws SQLException {
		
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
	
		List<DepartmentVO> deptList = session.selectList("Dept-Mapper.selectDeptList", cri,rowBounds);
		return deptList;
	}

	@Override
	public DepartmentVO selectDeptByDeptNo(int deptNo) throws SQLException {

		DepartmentVO dept = session.selectOne("Dept-Mapper.selectDeptByDeptNo", deptNo);
		return dept;
	}

	@Override
	public void registDepartment(DepartmentVO dept) throws SQLException {
	
		session.update("Dept-Mapper.registDepartment", dept);
	}

	@Override
	public int modifyDepartment(DepartmentVO dept) throws SQLException {
	int chk =	session.update("Dept-Mapper.modifyDepartment", dept);
		
		return chk;
		
	}

	@Override
	public void modifyActvYn(DepartmentVO dept) throws SQLException {
		session.update("Dept-Mapper.ModifyDeptActvYn", dept);
		
	}


	@Override
	public int getDeptCount(SearchCriteria cri) throws SQLException {
	
		int cnt = session.selectOne("Dept-Mapper.getDeptCount", cri);
		return cnt;
	}

	
	@Override
	public List<DepartmentVO> selectDeptListExceptMyDeptNo(DepartmentVO dept) {

		List<DepartmentVO> deptList = session.selectList("Dept-Mapper.selectDeptListExceptMyDeptNo",dept);
		
		return deptList;
	}

	@Override
	public List<DepartmentVO> selectAllDeptList(SearchCriteria cri) throws SQLException {

		List<DepartmentVO> deptList = session.selectList("Dept-Mapper.selectAllDeptList", cri);
		return deptList;
		
	}

	@Override
	public int selectDeptSeq() throws SQLException {
		int seq = session.selectOne("Dept-Mapper.selectDeptSeq");
		return seq;
	}

	@Override
	public int insertTopDept(DepartmentVO dept) throws SQLException {
		return session.insert("Dept-Mapper.insertTopDept", dept);
	}

	@Override
	public List<EmployeePageCommand> getAllEmpListByCompNo(SearchCriteria2 cri) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectList("Dept-Mapper.getAllEmpListByCompNo", cri);
	}

	@Override
	public void insertdepartmentHead(EmployeePageCommand empcom) throws SQLException {
		// TODO Auto-generated method stub
		session.update("Dept-Mapper.insertdepartmentHead", empcom);
	}

	@Override
	public void updatedepartmentHead(DeptHeadVO dHead) throws SQLException {
		// TODO Auto-generated method stub
		session.update("Dept-Mapper.updatedepartmentHead", dHead);
		
	}
	@Override
	public DeptHeadVO getDeptHeadByDeptNo(int deptno) throws SQLException {
		return session.selectOne("Dept-Mapper.getDeptHeadByDeptNo",deptno);
	}

	@Override
	public void updateEmpDeptNO(DeptHeadVO dhead) throws SQLException {
		session.update("Dept-Mapper.updateEmpDeptNO", dhead);
		// TODO Auto-generated method stub
		
	}

}

