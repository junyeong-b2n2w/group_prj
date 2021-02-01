package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.List;

import com.gr.cg.dto.WidgetVO;

public interface WidgetDAO {
	
	List<WidgetVO> selectWidgetList() throws SQLException;
}
