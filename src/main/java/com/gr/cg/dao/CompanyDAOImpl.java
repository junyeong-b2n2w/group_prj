package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gr.cg.command.SearchCriteria2;
import com.gr.cg.dto.CompanyVO;
import com.gr.cg.dto.DepartmentVO;

public class CompanyDAOImpl implements CompanyDAO {
	
	private SqlSession session;
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<CompanyVO> selectCompanyList(SearchCriteria2 search) throws SQLException {
		return session.selectList("Company-Mapper.selectCompanyList", search);
	}
	
	@Override
	public CompanyVO selectCompany(int comp_no) throws SQLException {
		return session.selectOne("Company-Mapper.selectCompany", comp_no);
	}
	
	@Override
	public int insertCompany(CompanyVO comp) throws SQLException {
		return session.insert("Company-Mapper.insertCompany", comp);
	}
	
	@Override
	public void updateCompany(CompanyVO comp) throws SQLException {
		session.insert("Company-Mapper.updateCompany", comp);
	}
	
	@Override
	public int selectCompanySqlNextValue() throws SQLException {
		int comp_no = session.selectOne("Company-Mapper.selectCompanySeqNextValue");
		return comp_no;
	}
	
	@Override
	public void updateActvN(int comp_no) throws SQLException {
		session.update("Company-Mapper.updateActvN", comp_no);
	}
}