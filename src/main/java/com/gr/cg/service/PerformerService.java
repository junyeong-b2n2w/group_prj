package com.gr.cg.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;


import com.gr.cg.command.SearchCriteria;
import com.gr.cg.dto.AttachVO;
import com.gr.cg.dto.PerformerVO;

public interface PerformerService {
	List<PerformerVO> getPerformerList(SearchCriteria cri) throws SQLException;
	List<PerformerVO> selectReturnPerformerList(int performerNo) throws SQLException;
	PerformerVO getPerformerByPerformerNo(PerformerVO performer) throws SQLException;
	void registPerformer(PerformerVO performer,int tasc_no) throws SQLException;
	void modifyPerformer(Map<String, String> map) throws SQLException;
	void removePerformer(int performerNo) throws SQLException;
	void BusinessApprovalPer(PerformerVO performer) throws SQLException;
	void BusinessApprovalPerfBack(PerformerVO performer) throws SQLException;
	void insertProcessingHistory(PerformerVO performer,int[] ta_no,String id,String upload,int[]delfile)throws SQLException, Exception;
	void removeModifyPerformer(int performerNo) throws SQLException;
	List<AttachVO> selectFileList(PerformerVO performer)throws SQLException;
	PerformerVO selectPerformerWork(PerformerVO performer) throws SQLException;
	
}
