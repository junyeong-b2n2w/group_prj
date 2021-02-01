package com.gr.cg.service;

import java.sql.SQLException;

import java.util.List;

import com.gr.cg.dao.WidgetDAO;
import com.gr.cg.dto.WidgetVO;

public class WidgetServiceImpl implements WidgetService{
	private WidgetDAO widgetDAO;
	
	public void setWidgetDAO(WidgetDAO widgetDAO) {
		this.widgetDAO = widgetDAO;
	}
	@Override
	public List<WidgetVO> selectWidgetList() throws SQLException {
		
		List<WidgetVO> widget = widgetDAO.selectWidgetList();
		
		return widget;
	}

}
