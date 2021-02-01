package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.gr.cg.command.SearchCriteria;
import com.gr.cg.dto.AttachVO;
import com.gr.cg.dto.PerformerVO;

public interface PerformerDAO {
	List<PerformerVO> selectPerformerList(SearchCriteria cri) throws SQLException;
	List<PerformerVO> selectReturnPerformerList(int preformerNo) throws SQLException;
	List<AttachVO> selectFileList(PerformerVO performer)throws SQLException;
	PerformerVO selectPerformerByPerformerNo(PerformerVO performer) throws SQLException;
	PerformerVO selectPerformerWork(PerformerVO performer) throws SQLException;
	void insertPerformer(PerformerVO performer) throws SQLException;
	void updatePerformer(Map<String, String> map) throws SQLException;
	void deletePerformer(int performerNo) throws SQLException;
	void insertProcessingHistory(PerformerVO performer) throws SQLException;
	void BusinessApprovalPer(PerformerVO performer) throws SQLException;
	void BusinessApprovalPerfBack(PerformerVO performer) throws SQLException;
	void removeModifyPerformer(int performerNo) throws SQLException;
}

