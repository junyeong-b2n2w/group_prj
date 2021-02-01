package com.gr.cg.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.gr.cg.command.SearchCriteria;
import com.gr.cg.command.SearchCriteria2;
import com.gr.cg.dto.VacationVO;

public interface VacationService {
	
	Map<String, Object> getAllVactListByCompNo(SearchCriteria cri) throws SQLException;
	
	/**
	 * 휴가 승인/반려 처리
	 * */
	void updateVacationConfirm(VacationVO vacation)throws SQLException;
	
	/**
	 * 사용자 id별 휴가 내역 가져오기
	 * **/
	List<VacationVO> getVactListByVactId(SearchCriteria2 cri) throws SQLException;
	
	List<Map<String, Object>> selectVactIngEmpCount(int comp_no)throws SQLException;
	List<Map<String, Object>> getVactAprvDeptNoByChart2()throws SQLException;
	List<Map<String, Object>> getVactAprvRankNoByChart3()throws SQLException;
	List<Map<String, Object>> getVactRemAvgByChart4()throws SQLException;
	
	Map<String, Object> getCountBySysdate(int comp_no) throws SQLException;
	
	VacationVO getAnnualCntByVactId(String id)throws SQLException;
	
	int registVactById(VacationVO vacation, int deptno) throws SQLException;
	
	void modifyMyVactById(VacationVO vacation) throws SQLException;

}
