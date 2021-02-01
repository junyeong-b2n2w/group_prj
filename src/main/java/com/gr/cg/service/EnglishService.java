package com.gr.cg.service;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.gr.cg.command.SearchCriteria;
import com.gr.cg.dto.EnglishVO;

public interface EnglishService {
	List<EnglishVO> getEnglishList(SearchCriteria cri) throws SQLException;
	EnglishVO getEnglishByEnglishNo() throws SQLException;
	void registEnglish(EnglishVO english) throws SQLException;
	void modifyEnglish(EnglishVO english) throws SQLException;
	void removeEnglish(int englishNo) throws SQLException;
}
