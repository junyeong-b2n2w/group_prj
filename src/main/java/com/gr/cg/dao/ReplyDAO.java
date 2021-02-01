package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.List;

import com.gr.cg.command.SearchCriteria;
import com.gr.cg.dto.ReplyVO;

public interface ReplyDAO {
	List<ReplyVO> selectReplyList(int postNo) throws SQLException;
	int selectReplySequenceNextValue() throws SQLException;
	ReplyVO selectReplyByReplyNo(int replyNo) throws SQLException;
	void insertReply(ReplyVO reply) throws SQLException;
	void modifyReply(ReplyVO reply) throws SQLException;
	void removeReply(int replyNo) throws SQLException;
}

