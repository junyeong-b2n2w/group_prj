package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gr.cg.dto.FormComponentVO;

public class FormComponentDAOImpl implements FormComponentDAO{

private SqlSession session;
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public void insertFormComponent(FormComponentVO formComponentVO) throws SQLException {
		session.update("FormComponent-Mapper.insertFormComponent",formComponentVO);
		
	}

	@Override
	public void deleteFormComponentByFCAFNO(int af_no) throws SQLException {
		session.update("FormComponent-Mapper.deleteFormComponentByFCAFNO",af_no);
	}

	@Override
	public List<FormComponentVO> selectFormComponentByFCAFNO(int fc_afno) throws SQLException {
		return session.selectList("FormComponent-Mapper.selectFormComponentByFCAFNO",fc_afno);
	}

	@Override
		public void insertFormComponentByAFNO(FormComponentVO formComponentVO) throws SQLException {
		session.update("FormComponent-Mapper.insertFormComponentByAFNO",formComponentVO);
		}
}
