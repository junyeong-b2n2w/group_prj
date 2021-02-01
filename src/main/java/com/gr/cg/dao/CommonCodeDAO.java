package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface CommonCodeDAO {

	List<Map<String, Object>> selectCommonCodeList() throws SQLException;
	
}
