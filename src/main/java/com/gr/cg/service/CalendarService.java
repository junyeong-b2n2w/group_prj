package com.gr.cg.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.gr.cg.dto.CalendarVO;

public interface CalendarService {
	
	int addCalendar(CalendarVO cal) throws SQLException;
	
	int updateCalendar(CalendarVO cal) throws SQLException;
	
	int deleteCalendar(int cal_no) throws SQLException;
	
	List<CalendarVO> getCalendarList(Map<String, Object> paramMap) throws SQLException;
}
