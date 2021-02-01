package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.gr.cg.dto.WidgetOrdVO;

public class WidgetOrderDAOImpl implements WidgetOrderDAO{
	
	private SqlSession session;
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	@Override
	public void insertWidget(WidgetOrdVO widgetord) throws SQLException {
		session.update("WidgetOrd-Mapper.insertWidget",widgetord);
		
	}
	@Override
	public List<WidgetOrdVO> selectListOrd(String empid) throws SQLException {
		return session.selectList("WidgetOrd-Mapper.selectListOrd",empid);
	}
	@Override
	public void updateWidget(Map<String, Object> map) throws SQLException {
		// TODO Auto-generated method stub
		session.update("WidgetOrd-Mapper.updateWidget",map);
	}
	@Override
	public void updateWidgetOne(Map<String, Object> map) throws SQLException {

		session.update("WidgetOrd-Mapper.updateWidgetOne",map);
	}
	@Override
	public List<WidgetOrdVO> selectWidgetYN(String empid) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectList("WidgetOrd-Mapper.selectWidgetYN",empid);
	}
	@Override
	public void widgetdelYN(WidgetOrdVO widgetord) throws SQLException {
		// TODO Auto-generated method stub
		session.update("WidgetOrd-Mapper.widgetdelYN",widgetord);
		
	}

}
