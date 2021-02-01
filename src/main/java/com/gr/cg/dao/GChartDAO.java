package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.List;

import com.gr.cg.command.SearchCriteria;
import com.gr.cg.command.SearchCriteria2;
import com.gr.cg.dto.GChartVO;

public interface GChartDAO {
	
	
	List<GChartVO> selectDeptList(int compno) throws SQLException;
	List<GChartVO> selectEmpList(SearchCriteria2 cri) throws SQLException;
	List<GChartVO> selectAllEmpList(SearchCriteria cri) throws SQLException;
	List<GChartVO> chartEmpListByDeptNo(int deptNo) throws SQLException;
	int selectEmpListCountBySearchCri(SearchCriteria cri) throws SQLException;
	
}

