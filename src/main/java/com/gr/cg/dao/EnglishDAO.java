package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.List;

import com.gr.cg.command.SearchCriteria;
import com.gr.cg.dto.EnglishVO;

public interface EnglishDAO {
	List<EnglishVO> selectEnglishList(SearchCriteria cri) throws SQLException;
	EnglishVO selectEnglishByEnglishNo() throws SQLException;
	void insertEnglish(EnglishVO english) throws SQLException;
	void updateEnglish(EnglishVO english) throws SQLException;
	void deleteEnglish(int englishNo) throws SQLException;
}

