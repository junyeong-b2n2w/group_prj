package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gr.cg.dto.WidgetVO;

public class WidgetDAOImpl implements WidgetDAO{

private SqlSession session;
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	
	@Override
	public List<WidgetVO> selectWidgetList() throws SQLException {
		
		return session.selectList("Widget-Mapper.selectWidgetList");
	}

}
