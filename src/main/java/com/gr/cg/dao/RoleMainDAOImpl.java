package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public class RoleMainDAOImpl implements RoleMainDAO{

	private SqlSession session;
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public Map<String, Object> selectTodayEdocByCompNO(Map<String, Object> paramMap) throws SQLException {
		return session.selectOne("RoleMain-Mapper.selectTodayEdocByCompNO",paramMap);
	}

	@Override
	public Map<String, Object> selectTodayTaskByCompNO(Map<String, Object> paramMap) throws SQLException {
		return session.selectOne("RoleMain-Mapper.selectTodayTaskByCompNO",paramMap);
	}

	@Override
	public Map<String, Object> selectTodayCalByCompNO(Map<String, Object> paramMap) throws SQLException {
		return session.selectOne("RoleMain-Mapper.selectTodayCalByCompNO",paramMap); 
	}
	

	
}
