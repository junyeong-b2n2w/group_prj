package com.gr.cg.service;

import java.sql.SQLException;
import java.util.List;

import com.gr.cg.dto.FormComponentVO;

public interface FormComponentService {

	void insertFormComponent(FormComponentVO formComponentVO) ;
	 
	void deleteFormComponentByFCAFNO(int fc_afno) ;
	
	List<FormComponentVO> selectFormComponentByFCAFNO(int fc_afno);
	
}
