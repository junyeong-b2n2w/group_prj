package com.gr.cg.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.gr.cg.command.SearchCriteria;
import com.gr.cg.command.SearchCriteria2;
import com.gr.cg.dto.GChartVO;

public interface GChartService {
	
	//부서 목록을 가져와 트리구조로 만든다
	List<GChartVO> getDeptList(int compno) throws SQLException;
	//조직도 화면에서 직원 목록을 불러온다
	List<GChartVO> getEmpList(SearchCriteria2 cti) throws SQLException;
	List<GChartVO> getGhartEmpList(int deptNo) throws SQLException;
	Map<String, Object> getAllListBySearchCri(SearchCriteria cri) throws Exception;
	
}
