package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.List;

import com.gr.cg.dto.ComponentVO;

public interface ComponentDAO {

	List<ComponentVO> selectComponentList() throws SQLException ;
	
	ComponentVO selectComponentByCPNO(int cp_no) throws SQLException ;
}
