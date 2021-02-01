package com.gr.cg.service;

import java.sql.SQLException;
import java.util.List;

import com.gr.cg.dao.FormComponentDAO;
import com.gr.cg.dto.FormComponentVO;

public class FormComponentServiceImpl implements FormComponentService{

	private FormComponentDAO formComponentDAO;
	public void setFormComponentDAO(FormComponentDAO formComponentDAO) {
		this.formComponentDAO = formComponentDAO;
	}
	@Override
	public void insertFormComponent(FormComponentVO formComponentVO) {
		try {
			formComponentDAO.insertFormComponent(formComponentVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	@Override
	public void deleteFormComponentByFCAFNO(int fc_afno) {
		try {
			formComponentDAO.deleteFormComponentByFCAFNO(fc_afno);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	@Override
	public List<FormComponentVO> selectFormComponentByFCAFNO(int fc_afno) {
		List<FormComponentVO> FormComponentList = null;
		try {
			FormComponentList = formComponentDAO.selectFormComponentByFCAFNO(fc_afno);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return FormComponentList;
	}
	
}
