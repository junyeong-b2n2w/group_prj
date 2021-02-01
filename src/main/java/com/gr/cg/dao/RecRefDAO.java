package com.gr.cg.dao;

import java.sql.SQLException;

import com.gr.cg.dto.ApprovalRefVO;
import com.gr.cg.dto.ReceiverVO;

public interface RecRefDAO {
	void insertRec(ReceiverVO vo) throws SQLException;
	void insertRef(ApprovalRefVO vo) throws SQLException;
}
