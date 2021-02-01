package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gr.cg.dto.ShortcutVO;

public class ShortCutDAOImpl implements ShortCutDAO{

private SqlSession session;
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<ShortcutVO> selectShortCutList(String emp_id) throws SQLException {
		
		return session.selectList("ShortCut-Mapper.selectShortCutList", emp_id);
	}

	@Override
	public int selectShortCutSeqNextVal() throws SQLException {
		return session.selectOne("ShortCut-Mapper.selectShortCutSeqNextVal");
	}

	@Override
	public ShortcutVO selectShortCutByNO(int shc_no) throws SQLException {
		
		return session.selectOne("ShortCut-Mapper.selectShortCutByNO",shc_no);
	}

	@Override
	public int insertShortCut(ShortcutVO scVO) throws SQLException {
		return session.update("ShortCut-Mapper.insertShortCut",scVO);
	}

	@Override
	public int updateShortCut(ShortcutVO scVO) throws SQLException {
		return session.update("ShortCut-Mapper.updateShortCut",scVO);
	}

	@Override
	public int deleteShortCut(int shc_no) throws SQLException {
		return  session.update("ShortCut-Mapper.deleteShortCut",shc_no);
	}

	
}
