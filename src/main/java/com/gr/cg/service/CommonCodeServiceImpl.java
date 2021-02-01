package com.gr.cg.service;

import java.util.List;
import java.util.Map;

import com.gr.cg.dao.CommonCodeDAO;

public class CommonCodeServiceImpl implements CommonCodeService{

	private CommonCodeDAO commonCodeDAO;
	
	public void setCommonCodeDAO(CommonCodeDAO commonCodeDAO) {
		this.commonCodeDAO = commonCodeDAO;
	}
	
	@Override
	public List<Map<String, Object>> getCommonCodeList() {
		
		List<Map<String, Object>> codeList = null;
		
		try {
			codeList =  commonCodeDAO.selectCommonCodeList();
					
		} catch (Exception e) {

		}
		
		return codeList;
	}

	
	
}
