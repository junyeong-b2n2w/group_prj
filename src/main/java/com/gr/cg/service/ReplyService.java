package com.gr.cg.service;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.gr.cg.command.SearchCriteria;
import com.gr.cg.dto.ReplyVO;

public interface ReplyService {
	List<ReplyVO> getReplyList(int postNo) throws SQLException;
	ReplyVO getReplyByReplyNo(int replyNo) throws SQLException;
	void insertReply(ReplyVO reply) throws SQLException;
	void modifyReply(ReplyVO reply) throws SQLException;
	void removeReply(int replyNo) throws SQLException;
}
