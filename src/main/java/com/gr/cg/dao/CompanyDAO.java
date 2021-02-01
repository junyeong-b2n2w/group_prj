package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.List;

import com.gr.cg.command.SearchCriteria2;
import com.gr.cg.dto.CompanyVO;
import com.gr.cg.dto.DepartmentVO;

public interface CompanyDAO {
	List<CompanyVO> selectCompanyList(SearchCriteria2 search) throws SQLException;
	
	CompanyVO selectCompany(int comp_no) throws SQLException;

	int insertCompany(CompanyVO comp) throws SQLException;
	
	void updateCompany(CompanyVO comp) throws SQLException;
	
	int selectCompanySqlNextValue() throws SQLException;
	
	void updateActvN(int comp_no) throws SQLException;
}
