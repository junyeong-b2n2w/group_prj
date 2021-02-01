package com.gr.cg.service;

import java.sql.SQLException;
import java.util.List;

import com.gr.cg.command.SearchCriteria;
import com.gr.cg.command.SearchCriteria2;
import com.gr.cg.dto.ApprovalVO;
import com.gr.cg.dto.GChartVO;
import com.gr.cg.dto.UserAprvLnGrVO;
import com.gr.cg.dto.UserDefAprvLnVO;
import com.gr.cg.dto.VacationVO;

public interface ApprovalService {
	List<ApprovalVO> getApprovalList(SearchCriteria cri) throws SQLException;
	ApprovalVO getApprovalByApprovalNo(int approvalNo) throws SQLException;
	void registApproval(ApprovalVO approval) throws SQLException;
	void modifyApproval(ApprovalVO approval) throws SQLException;
	void removeApproval(int approvalNo) throws SQLException;
	List<GChartVO> searchAprvLnList(String text) throws SQLException;
	int registAprvLn(UserDefAprvLnVO udal) throws SQLException;
	List<UserDefAprvLnVO> getAprvLnList(String id) throws SQLException;
	List<UserAprvLnGrVO> getAprvLnGrList(int udal_no) throws SQLException;
	void removeAprvLn(int udal_no) throws SQLException;
	List<UserDefAprvLnVO> getAprvLnListPage(SearchCriteria2 cri) throws SQLException;
	int autoVacApproval(VacationVO vo, int deptno) throws SQLException;
}
