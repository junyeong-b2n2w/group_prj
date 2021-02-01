package com.gr.cg.service;

import java.util.Map;

import com.gr.cg.command.SearchCriteria;
import com.gr.cg.dto.ApprovalFormVO;
import com.gr.cg.dto.FormFavoriteVO;

public interface ApprovalFormService {
	
	 Map<String, Object> selectApprovalFormListByCRI(SearchCriteria cri) ;
	
	ApprovalFormVO selectApprovalFormByAFNO(int af_no);
	
	void registApprovalForm(ApprovalFormVO approvalFormVO, String componentArr) ;
	
	void updateApprovalForm(ApprovalFormVO approvalFormVO, String componentArr) ;
	
	void deleteApprovalForm(int af_no) ;
	
	void addFormFavorite(FormFavoriteVO vo);
	
	void removeFormFavorite(int ff_no);
}
