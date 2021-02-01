package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gr.cg.command.SearchCriteria;
import com.gr.cg.command.SearchCriteria2;
import com.gr.cg.dto.GChartVO;

public class GChartDAOImpl implements GChartDAO{
	
	private SqlSession session;
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}


	@Override
	public List<GChartVO> selectDeptList(int compno) throws SQLException {
		List<GChartVO> deptList = session.selectList("GChart-Mapper.selectDeptList",compno);
		return deptList;
	}

	@Override
	public List<GChartVO> selectEmpList(SearchCriteria2 cri) throws SQLException {
		
			List<GChartVO> empList = session.selectList("GChart-Mapper.selectEmpListByDeptNo", cri);
		return empList;
	}

	@Override
	public List<GChartVO> selectAllEmpList(SearchCriteria cri) throws SQLException {
		List<GChartVO> empList = session.selectList("GChart-Mapper.selectEmpListBySearchCri",cri);
		return empList;
	}

	@Override
	public int selectEmpListCountBySearchCri(SearchCriteria cri) throws SQLException {
		int cnt = session.selectOne("GChart-Mapper.selectEmpListCountBySearchCri" ,cri);
		return cnt;
	}


	@Override
	public List<GChartVO> chartEmpListByDeptNo(int deptNo) throws SQLException {
		List<GChartVO> empList = session.selectList("GChart-Mapper.chartEmpListByDeptNo",deptNo);
		return empList;
	}

}

