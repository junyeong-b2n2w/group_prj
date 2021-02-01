package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.gr.cg.command.SearchCriteria;
import com.gr.cg.command.SearchCriteria2;
import com.gr.cg.dto.ApprovalVO;
import com.gr.cg.dto.GChartVO;
import com.gr.cg.dto.UserAprvLnGrVO;
import com.gr.cg.dto.UserDefAprvLnVO;

public class ApprovalDAOImpl implements ApprovalDAO{
	
	private SqlSession session;
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public ApprovalVO selectApprovalByApprovalNo(int approvalNo) throws SQLException {
		return session.selectOne("Approval-Mapper.selectApprovalByApprovalNo", approvalNo);
	}

	@Override
	public List<ApprovalVO> selectApprovalList(SearchCriteria cri) throws SQLException {
		return session.selectList("Approval-Mapper.selectApprovalList", cri);
	}

	@Override
	public void insertApproval(ApprovalVO approval) throws SQLException {
		session.update("Approval-Mapper.insertApproval", approval);
	}

	@Override
	public void updateApproval(ApprovalVO approval) throws SQLException {
		session.update("Approval-Mapper.updateApproval", approval);
	}

	@Override
	public void deleteApproval(int approval_no) throws SQLException {
		session.update("Approval-Mapper.deleteApproval", approval_no);
	}

	@Override
	public List<GChartVO> selectApprovalListByName(String text) throws SQLException {
		return session.selectList("Approval-Mapper.selectApprovalListByName", text);
	}

	@Override
	public int selectUserAprvLnSequence() throws SQLException {
		return session.selectOne("Approval-Mapper.selectUserAprvLnSequence");
	}

	@Override
	public void insertUserAprvLn(UserDefAprvLnVO udal) throws SQLException {
		session.update("Approval-Mapper.insertUserAprvLn", udal);
	}

	@Override
	public void insertUserAprvLnGr(UserAprvLnGrVO ualg) throws SQLException {
		session.update("Approval-Mapper.insertUserAprvLnGr", ualg);
	}

	@Override
	public List<UserDefAprvLnVO> selectUserAprvLn(String id) throws SQLException {
		return session.selectList("Approval-Mapper.selectUserAprvLn", id);
	}

	@Override
	public List<UserAprvLnGrVO> selectUserAprvLnGr(int udal_no) throws SQLException {
		return session.selectList("Approval-Mapper.selectUserAprvLnGr", udal_no);
	}

	@Override
	public void deleteUserAprvLn(int udal_no) throws SQLException {
		session.update("Approval-Mapper.deleteUserAprvLn", udal_no);
	}

	@Override
	public List<UserDefAprvLnVO> selectUdalListByCri(SearchCriteria2 cri) throws SQLException {
		return session.selectList("Approval-Mapper.selectUdalListByCri", cri);
	}

	@Override
	public String selectVacAprvDept(String empid) throws SQLException {
		return session.selectOne("Approval-Mapper.selectVacAprvDept", empid);
	}

	@Override
	public String selectVacAprvTop() throws SQLException {
		return session.selectOne("Approval-Mapper.selectVacAprvTop");
	}

}

