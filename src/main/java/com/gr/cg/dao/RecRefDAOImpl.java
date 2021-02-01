package com.gr.cg.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import com.gr.cg.dto.ApprovalRefVO;
import com.gr.cg.dto.ReceiverVO;

public class RecRefDAOImpl implements RecRefDAO{
	
	private SqlSession session;
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public void insertRef(ApprovalRefVO vo) throws SQLException {
		session.update("RecRef-Mapper.insertAprvRef", vo);
	}

	@Override
	public void insertRec(ReceiverVO vo) throws SQLException {
		session.update("RecRef-Mapper.insertReceiver", vo);
	}
	
}
