package com.gr.cg.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.gr.cg.command.PageMaker;
import com.gr.cg.command.SearchCriteria;
import com.gr.cg.command.SearchCriteria2;
import com.gr.cg.dao.GChartDAO;
import com.gr.cg.dto.GChartVO;

public class GChartServiceImpl implements GChartService{

	private GChartDAO gChartDAO;

	public void setGChartDAO(GChartDAO gChartDAO) {
		this.gChartDAO = gChartDAO;
	}
	@Override
	public List<GChartVO> getDeptList(int compno) throws SQLException {
		//부서 트리구조
		List<GChartVO> deptList = gChartDAO.selectDeptList(compno);
		return deptList;
	}
	
	
	@Override
	public List<GChartVO> getEmpList(SearchCriteria2 cri) throws SQLException {
		
		//조직도 화면에서 직원 목록을 불러온다
		List<GChartVO> empList  =  gChartDAO.selectEmpList(cri);
			
		return empList;
	
	}
	@Override
	public Map<String, Object> getAllListBySearchCri(SearchCriteria cri) throws SQLException, Exception {

		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		
		List<GChartVO> gList = gChartDAO.selectAllEmpList(cri);
		int cnt = gChartDAO.selectEmpListCountBySearchCri(cri);
		
//		List<GChartVO> deptList = gChartDAO.selectDeptList();
//		
//		
//		ObjectMapper mapper = new ObjectMapper();
//		String jsonList = mapper.writeValueAsString(deptList);
//		
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(cnt);
		
		dataMap.put("empList", gList);
		dataMap.put("pageMaker", pageMaker);
		return null;
	}
	@Override
	public List<GChartVO> getGhartEmpList(int deptNo) throws SQLException {
		return gChartDAO.chartEmpListByDeptNo(deptNo);
	}

}

