package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.gr.cg.command.SearchCriteria;
import com.gr.cg.dto.AttachVO;
import com.gr.cg.dto.PerformerVO;

public class PerformerDAOImpl implements PerformerDAO{
	
	private SqlSession session;
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public PerformerVO selectPerformerByPerformerNo(PerformerVO performer) throws SQLException {
		return session.selectOne("Performer-Mapper.selectPerformerByPerformerNo", performer);
	}

	@Override
	public List<PerformerVO> selectPerformerList(SearchCriteria cri) throws SQLException {
		return session.selectList("Performer-Mapper.selectPerformerList", cri);
	}

	@Override
	public void insertPerformer(PerformerVO performer) throws SQLException {
		session.update("Performer-Mapper.insertPerformer", performer);
	}

	@Override
	public void updatePerformer(Map<String, String> map) throws SQLException {
		session.update("Performer-Mapper.updatePerformer", map);
	}

	@Override
	public void deletePerformer(int performer_no) throws SQLException {
		session.update("Performer-Mapper.deletePerformer", performer_no);
	}

	@Override
	public void insertProcessingHistory(PerformerVO performer) throws SQLException {
		session.update("Performer-Mapper.insertProcessingHistory",performer);
	}

	@Override
	public void BusinessApprovalPer(PerformerVO performer) throws SQLException {
		session.update("Performer-Mapper.BusinessApprovalPer",performer);
		
	}

	@Override
	public void removeModifyPerformer(int performerNo) throws SQLException {
		session.delete("Performer-Mapper.removeModifyPerformer",performerNo);
	}

	@Override
	public void BusinessApprovalPerfBack(PerformerVO performer) throws SQLException {
		// TODO Auto-generated method stub
		session.update("Performer-Mapper.BusinessApprovalPerfBack",performer);
		
	}

	@Override
	public List<PerformerVO> selectReturnPerformerList(int preformerNo) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectList("Performer-Mapper.selectReturnPerformerList",preformerNo);
	}

	@Override
	public List<AttachVO> selectFileList(PerformerVO performer) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectList("Performer-Mapper.selectFileList",performer);
	}

	@Override
	public PerformerVO selectPerformerWork(PerformerVO performer) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectOne("Performer-Mapper.selectPerformerWork",performer);
	}

}

