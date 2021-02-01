package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gr.cg.command.SearchCriteria;
import com.gr.cg.dto.EnglishVO;

public class EnglishDAOImpl implements EnglishDAO{
	
	private SqlSession session;
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public EnglishVO selectEnglishByEnglishNo() throws SQLException {
		return session.selectOne("English-Mapper.selectEnglishByEnglishNo");
	}

	@Override
	public List<EnglishVO> selectEnglishList(SearchCriteria cri) throws SQLException {
		return session.selectList("English-Mapper.selectEnglishList", cri);
	}

	@Override
	public void insertEnglish(EnglishVO english) throws SQLException {
		session.update("English-Mapper.insertEnglish", english);
	}

	@Override
	public void updateEnglish(EnglishVO english) throws SQLException {
		session.update("English-Mapper.updateEnglish", english);
	}

	@Override
	public void deleteEnglish(int english_no) throws SQLException {
		session.update("English-Mapper.deleteEnglish", english_no);
	}

}

