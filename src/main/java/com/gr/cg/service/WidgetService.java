package com.gr.cg.service;

import java.sql.SQLException;
import java.util.List;

import com.gr.cg.dto.WidgetOrdVO;
import com.gr.cg.dto.WidgetVO;

public interface WidgetService {
	List<WidgetVO> selectWidgetList() throws SQLException;
}
