package com.gr.cg.service;

import java.sql.SQLException;
import java.util.List;

import com.gr.cg.command.SearchCriteria;
import com.gr.cg.dao.ReplyDAO;
import com.gr.cg.dto.ReplyVO;

public class ReplyServiceImpl implements ReplyService{

	private ReplyDAO replyDAO;
	
	public void setReplyDAO(ReplyDAO replyDAO) {
		this.replyDAO = replyDAO;
	}
	@Override
	public List<ReplyVO> getReplyList(int postNo) throws SQLException {
		return replyDAO.selectReplyList(postNo);
	}
	@Override
	public ReplyVO getReplyByReplyNo(int replyNo) throws SQLException {
		return replyDAO.selectReplyByReplyNo(replyNo);
	}
	@Override
	public void insertReply(ReplyVO reply) throws SQLException {
		int seq = replyDAO.selectReplySequenceNextValue();
		
		reply.setRe_no(seq);
		
		replyDAO.insertReply(reply);	
		}
	@Override
	public void modifyReply(ReplyVO reply) throws SQLException {
		replyDAO.modifyReply(reply);	}
	@Override
	public void removeReply(int replyNo) throws SQLException {
		replyDAO.removeReply(replyNo);	}

}

