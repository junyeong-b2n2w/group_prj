package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.List;

import com.gr.cg.command.SearchCriteria;
import com.gr.cg.dto.ApprovalFormVO;
import com.gr.cg.dto.FormFavoriteVO;

public interface ApprovalFormDAO {

	List<ApprovalFormVO> selectApprovalFormListByCRI(SearchCriteria cri) throws SQLException;
	
	ApprovalFormVO selectApprovalFormByAFNO(int af_no) throws SQLException;
	
	void insertApprovalForm(ApprovalFormVO approvalFormVO) throws SQLException;
	
	void updateApprovalForm(ApprovalFormVO approvalFormVO) throws SQLException;
	
	void deleteApprovalForm(int af_no) throws SQLException;

	int selectApprovalFromNextSeq() throws SQLException;
	
	int selectApprovalFormListByCRITotalCount(SearchCriteria cri) throws SQLException;
	void insertFormFavorite(FormFavoriteVO vo) throws SQLException;
	void deleteFormFavorite(int ff_no) throws SQLException;
}

