package com.gr.cg.service;

import java.sql.SQLException;
import java.util.List;

import com.gr.cg.dao.ComponentDAO;
import com.gr.cg.dto.ComponentVO;

public class ComponentServiceImpl implements ComponentService{

	private ComponentDAO componentDAO;
	
	public void setComponentDAO(ComponentDAO componentDAO) {
		this.componentDAO = componentDAO;
	}
	
	@Override
	public ComponentVO selectComponentByCPNO(int cp_no) {
		ComponentVO componentVO = null;
		
		try {
			componentVO = componentDAO.selectComponentByCPNO(cp_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
				
		return componentVO;
	}
	
	@Override
	public List<ComponentVO> selectComponentList()  {
		List<ComponentVO> componentList = null;
		
		try {
			componentList = componentDAO.selectComponentList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return componentList;
	}
	
}

