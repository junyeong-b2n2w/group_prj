package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.gr.cg.dto.CalendarVO;

public class CalendarDAOImpl implements CalendarDAO {
	private SqlSession session;
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public int insertCalendar(CalendarVO cal) throws SQLException {
		return session.insert("Calendal-Mapper.insertCalendar", cal);
	}
	
	@Override
	public int updateCalendar(CalendarVO cal) throws SQLException {
		return session.update("Calendal-Mapper.updateCalendar", cal);
	}
	
	@Override
	public int deleteCalendar(int cal_no) throws SQLException {
		return session.update("Calendal-Mapper.deleteCalendar", cal_no);
	}
	
	@Override
	public List<CalendarVO> selectCalendar(Map<String, Object> paramMap) throws SQLException{
		return session.selectList("Calendal-Mapper.selectCalendar", paramMap);
	}
}
