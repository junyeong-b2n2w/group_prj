package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.List;

import com.gr.cg.command.SearchCriteria;
import com.gr.cg.command.SearchCriteria2;
import com.gr.cg.dto.ApprovalVO;
import com.gr.cg.dto.GChartVO;
import com.gr.cg.dto.UserAprvLnGrVO;
import com.gr.cg.dto.UserDefAprvLnVO;

public interface ApprovalDAO {
	List<ApprovalVO> selectApprovalList(SearchCriteria cri) throws SQLException;
	ApprovalVO selectApprovalByApprovalNo(int approvalNo) throws SQLException;
	void insertApproval(ApprovalVO approval) throws SQLException;
	void updateApproval(ApprovalVO approval) throws SQLException;
	void deleteApproval(int approvalNo) throws SQLException;
	List<GChartVO> selectApprovalListByName(String text) throws SQLException;
	int selectUserAprvLnSequence() throws SQLException;
	void insertUserAprvLn(UserDefAprvLnVO udal) throws SQLException;
	void insertUserAprvLnGr(UserAprvLnGrVO ualg) throws SQLException;
	List<UserDefAprvLnVO> selectUserAprvLn(String id) throws SQLException;
	List<UserAprvLnGrVO> selectUserAprvLnGr(int udal_no) throws SQLException;
	void deleteUserAprvLn(int udal_no) throws SQLException;
	List<UserDefAprvLnVO> selectUdalListByCri(SearchCriteria2 cri) throws SQLException;
	String selectVacAprvDept(String empid) throws SQLException;
	String selectVacAprvTop() throws SQLException;
}

