package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gr.cg.command.SearchCriteria;
import com.gr.cg.dto.ReplyVO;

public class ReplyDAOImpl implements ReplyDAO{
	
	private SqlSession session;
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public ReplyVO selectReplyByReplyNo(int replyNo) throws SQLException {
		return session.selectOne("Reply-Mapper.selectReplyByReplyNo", replyNo);
	}

	@Override
	public List<ReplyVO> selectReplyList(int postNo) throws SQLException {
		return session.selectList("Reply-Mapper.selectReplyList", postNo);
	}

	@Override
	public void insertReply(ReplyVO reply) throws SQLException {
		session.update("Reply-Mapper.insertReply", reply);
	}

	@Override
	public void modifyReply(ReplyVO reply) throws SQLException {
		session.update("Reply-Mapper.modifyReply", reply);
	}

	@Override
	public void removeReply(int reply_no) throws SQLException {
		session.update("Reply-Mapper.removeReply", reply_no);
	}

	@Override
	public int selectReplySequenceNextValue() throws SQLException {
		int seq = session.selectOne("Reply-Mapper.selectReplySequenceNextValue");
		return seq;
	}

}

