package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.gr.cg.dto.ApprovalVO;
import com.gr.cg.dto.ConsensusVO;
import com.gr.cg.dto.ElecDocumentVO;

public class AprvConsDAOImpl implements AprvConsDAO{
	
	private SqlSession session;
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public void insertCons(ConsensusVO vo) throws SQLException {
		session.update("AprvCons-Mapper.insertCons", vo);
	}

	@Override
	public void insertAprv(ApprovalVO vo) throws SQLException {
		session.update("AprvCons-Mapper.insertAprv", vo);		
	}

	@Override
	public void insertFirstAprv(ApprovalVO vo) throws SQLException {
		session.update("AprvCons-Mapper.insertFirstAprv", vo);
	}

	@Override
	public void insertFirstCons(ConsensusVO vo) throws SQLException {
		session.update("AprvCons-Mapper.insertFirstCons", vo);
	}

	@Override
	public ElecDocumentVO selectEdocForAprv(int edno) throws SQLException {
		return session.selectOne("AprvCons-Mapper.selectEdocForAprv", edno);
	}

	@Override
	public int updateAprv(ApprovalVO vo) throws SQLException {
		return session.update("AprvCons-Mapper.updateAprv", vo);
	}

	@Override
	public List<ApprovalVO> selectNextAprvList(int edno, int ord) throws SQLException {
		Map<String, Integer> paramMap = new HashMap<String, Integer>();
		paramMap.put("edno", edno);
		paramMap.put("ord", ord);
		return session.selectList("AprvCons-Mapper.selectNextAprvList", paramMap);
	}

	@Override
	public String updateEdocFinal(int edno) throws SQLException {
		return session.update("AprvCons-Mapper.updateEdocFinal", edno) + "";
	}

	@Override
	public void updateParallelCons(int consno, String code) throws SQLException {
		Map<String, Object> map = new HashMap<>();
		map.put("consno", consno);
		map.put("code", code);
		session.update("AprvCons-Mapper.updateParallelCons", map);
	}

	@Override
	public ApprovalVO selectAprvForAprv(int aprvno) throws SQLException {
		return session.selectOne("AprvCons-Mapper.selectAprvForAprv", aprvno);
	}

	@Override
	public void updateAprvStt(ApprovalVO vo) throws SQLException {
		session.update("AprvCons-Mapper.updateAprvStt", vo);
	}

	@Override
	public void updateTurnCons(int consno, String code) throws SQLException {
		Map<String, Object> map = new HashMap<>();
		map.put("consno", consno);
		map.put("code", code);
		session.update("AprvCons-Mapper.updateTurnCons", map);
	}

	@Override
	public void updateEdocToReturn(int edno) throws SQLException {
		session.update("AprvCons-Mapper.updateEdocToReturn", edno);
	}

	@Override
	public void updateEdocToIng(int edno) throws SQLException {
		session.update("AprvCons-Mapper.updateEdocToIng", edno);
	}

	@Override
	public void updateCons(ConsensusVO vo) throws SQLException {
		session.update("AprvCons-Mapper.updateCons", vo);
	}

	@Override
	public int selectParConsCnt(int edno) throws SQLException {
		return session.selectOne("AprvCons-Mapper.selectParConsCnt", edno);
	}

	@Override
	public ConsensusVO selectConsForAprv(int consno) throws SQLException {
		return session.selectOne("AprvCons-Mapper.selectConsForAprv", consno);
	}

	@Override
	public String selectEdocTaskNo(int edno) throws SQLException {
		return session.selectOne("AprvCons-Mapper.selectEdocTaskNo", edno);
	}

	@Override
	public void insertFinalAprvPdf(Map<String, String> map) throws SQLException {
		session.update("AprvCons-Mapper.insertFinalAprvPdf",map);
	}

	@Override
	public String selectFinAprvPdf(int edno) throws SQLException {
		return session.selectOne("AprvCons-Mapper.selectFinAprvPdf", edno);
	}
	
}
