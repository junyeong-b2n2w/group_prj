package com.gr.cg.service;

import java.sql.SQLException;
import java.util.List;

import com.gr.cg.command.SearchCriteria2;
import com.gr.cg.dto.CompanyVO;
import com.gr.cg.dto.DepartmentVO;

public interface CompanyService {
	
	List<CompanyVO> getCompanyList(SearchCriteria2 search) throws SQLException;

	CompanyVO getCompany(int comp_no) throws SQLException;
	
	int registCompany(CompanyVO comp) throws SQLException;
	
	void updateCompany(CompanyVO comp) throws SQLException;
	
	void updateInactive(int comp_no) throws SQLException;
}
