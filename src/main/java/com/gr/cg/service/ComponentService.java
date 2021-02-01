package com.gr.cg.service;

import java.sql.SQLException;
import java.util.List;

import com.gr.cg.dto.ComponentVO;

public interface ComponentService {

	List<ComponentVO> selectComponentList()  ;
	
	ComponentVO selectComponentByCPNO(int cp_no)  ;

}
