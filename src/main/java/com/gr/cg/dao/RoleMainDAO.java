package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.Map;

public interface RoleMainDAO {

	Map<String, Object> selectTodayEdocByCompNO(Map<String, Object> paramMap) throws SQLException;
	
	Map<String, Object> selectTodayTaskByCompNO(Map<String, Object> paramMap) throws SQLException;
	
	Map<String, Object> selectTodayCalByCompNO(Map<String, Object> paramMap) throws SQLException;
	
}
