package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.gr.cg.dto.CalendarVO;

public interface CalendarDAO {
	int insertCalendar(CalendarVO cal) throws SQLException;
	
	int updateCalendar(CalendarVO cal) throws SQLException;
	
	int deleteCalendar(int cal_no) throws SQLException;
	
	List<CalendarVO> selectCalendar(Map<String, Object> paramMap) throws SQLException;
}
