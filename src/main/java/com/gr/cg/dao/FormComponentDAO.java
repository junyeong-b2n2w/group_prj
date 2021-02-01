package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.List;

import com.gr.cg.dto.FormComponentVO;

public interface FormComponentDAO {

	void insertFormComponent(FormComponentVO formComponentVO) throws SQLException;

	void insertFormComponentByAFNO(FormComponentVO formComponentVO) throws SQLException;
	 
	void deleteFormComponentByFCAFNO(int fc_afno) throws SQLException;
	
	List<FormComponentVO> selectFormComponentByFCAFNO(int fc_afno) throws SQLException;
	
}
