package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.gr.cg.command.SearchCriteria;
import com.gr.cg.dto.ApprovalFormVO;
import com.gr.cg.dto.FormFavoriteVO;

public class ApprovalFormDAOImpl implements ApprovalFormDAO{

private SqlSession session;
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<ApprovalFormVO> selectApprovalFormListByCRI(SearchCriteria cri) throws SQLException {
		
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return session.selectList("ApprovalForm-Mapper.selectApprovalFormListByCRI",cri,rowBounds );
	}
	

	@Override
	public ApprovalFormVO selectApprovalFormByAFNO(int af_no) throws SQLException {
		return session.selectOne("ApprovalForm-Mapper.selectApprovalFromByAFNO", af_no);
	}

	@Override
	public void insertApprovalForm(ApprovalFormVO approvalFormVO) throws SQLException {
		session.selectOne("ApprovalForm-Mapper.insertApprovalForm", approvalFormVO);
	}

	@Override
	public void updateApprovalForm(ApprovalFormVO approvalFormVO) throws SQLException {
		session.selectOne("ApprovalForm-Mapper.updateApprovalFormByAFNO", approvalFormVO);
	}

	@Override
	public void deleteApprovalForm(int af_no) throws SQLException {
		session.selectOne("ApprovalForm-Mapper.deleteApprovalFormByAFNO", af_no);
	}
	
	@Override
		public int selectApprovalFromNextSeq() throws SQLException {
		return session.selectOne("ApprovalForm-Mapper.selectApprovalFromNextSeq");
	}
	
	@Override
		public int selectApprovalFormListByCRITotalCount(SearchCriteria cri) throws SQLException {
		
		return session.selectOne("ApprovalForm-Mapper.selectApprovalFormListByCRITotalCount",cri);
		}

	@Override
	public void insertFormFavorite(FormFavoriteVO vo) throws SQLException {
		session.update("ApprovalForm-Mapper.insertFormFavorite", vo);
	}

	@Override
	public void deleteFormFavorite(int ff_no) throws SQLException {
		session.update("ApprovalForm-Mapper.deleteFormFavorite", ff_no);
	}
}
