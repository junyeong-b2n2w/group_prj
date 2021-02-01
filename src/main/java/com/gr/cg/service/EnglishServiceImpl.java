package com.gr.cg.service;

import java.sql.SQLException;
import java.util.List;

import com.gr.cg.command.SearchCriteria;
import com.gr.cg.dao.EnglishDAO;
import com.gr.cg.dto.EnglishVO;

public class EnglishServiceImpl implements EnglishService{

	private EnglishDAO englishDAO;
	
	public void setEnglishDAO(EnglishDAO englishDAO) {
		this.englishDAO = englishDAO;
	}
	@Override
	public List<EnglishVO> getEnglishList(SearchCriteria cri) throws SQLException {
		return englishDAO.selectEnglishList(cri);
	}
	@Override
	public EnglishVO getEnglishByEnglishNo() throws SQLException {
		return englishDAO.selectEnglishByEnglishNo();
	}
	@Override
	public void registEnglish(EnglishVO english) throws SQLException {
		englishDAO.insertEnglish(english);	}
	@Override
	public void modifyEnglish(EnglishVO english) throws SQLException {
		englishDAO.updateEnglish(english);	}
	@Override
	public void removeEnglish(int englishNo) throws SQLException {
		englishDAO.deleteEnglish(englishNo);	}

}

