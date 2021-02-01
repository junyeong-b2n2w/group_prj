package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public class CommonCodeDAOImpl implements CommonCodeDAO{


	private SqlSession session;
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	
	@Override
	public List<Map<String, Object>> selectCommonCodeList() throws SQLException {
		return session.selectList("CommonCode-Mapper.selectCommonCodeList");
	}

	
	
}
