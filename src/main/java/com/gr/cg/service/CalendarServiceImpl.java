package com.gr.cg.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.gr.cg.dao.CalendarDAO;
import com.gr.cg.dto.CalendarVO;

public class CalendarServiceImpl implements CalendarService {
	
	private CalendarDAO calendarDAO;
	
	public void setCalendarDAO(CalendarDAO calendarDAO) {
		this.calendarDAO = calendarDAO;
	}
	
	@Override
	public int addCalendar(CalendarVO cal) throws SQLException {
		return calendarDAO.insertCalendar(cal);
	}
	
	@Override
	public int updateCalendar(CalendarVO cal) throws SQLException {
		return calendarDAO.updateCalendar(cal);
	}
	
	@Override
	public int deleteCalendar(int cal_no) throws SQLException {
		return calendarDAO.deleteCalendar(cal_no);
	}
	
	@Override
	public List<CalendarVO> getCalendarList(Map<String, Object> paramMap) throws SQLException {
		return calendarDAO.selectCalendar(paramMap);
	}
}
