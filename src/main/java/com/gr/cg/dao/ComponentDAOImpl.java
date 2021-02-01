package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gr.cg.dto.ComponentVO;

public class ComponentDAOImpl implements ComponentDAO{

private SqlSession session;
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<ComponentVO> selectComponentList() throws SQLException {
		
		return session.selectList("Component-Mapper.selectComponentList");
	}

	@Override
	public ComponentVO selectComponentByCPNO(int cp_no) throws SQLException {
		
		return session.selectOne("Component-Mapper.selectComponentByCPNO",cp_no);
	}
	
	
}
