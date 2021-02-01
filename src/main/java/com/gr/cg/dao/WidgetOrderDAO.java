package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.gr.cg.dto.WidgetOrdVO;

public interface WidgetOrderDAO {
	
		void insertWidget(WidgetOrdVO widgetord)throws SQLException;
		List<WidgetOrdVO> selectListOrd(String empid) throws SQLException;
		List<WidgetOrdVO> selectWidgetYN(String empid) throws SQLException;
		void updateWidget(Map<String, Object> map) throws SQLException;
		void updateWidgetOne(Map<String, Object> map) throws SQLException;
		void widgetdelYN(WidgetOrdVO widgetord) throws SQLException;
	
}
