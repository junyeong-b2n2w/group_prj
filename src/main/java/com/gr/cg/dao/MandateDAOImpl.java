package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.gr.cg.dto.ApprovalVO;
import com.gr.cg.dto.ConsensusVO;
import com.gr.cg.dto.MandateVO;

public class MandateDAOImpl implements MandateDAO {
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<Map<String, Object>> selectMdtListById(String id) throws SQLException {
		return session.selectList("Mandate-Mapper.selectMdtListById",id);
	}
	
	@Override
	public void updateActvyn(List<String> unset) throws SQLException {
		session.update("Mandate-Mapper.updateActvyn", unset);
	}
	
	@Override
	public void insertUpdate(MandateVO mdt) throws SQLException {
		session.insert("Mandate-Mapper.insertMandate", mdt);
	}
	
	@Override
	public void updateEndActvyn() throws SQLException {
		session.update("Mandate-Mapper.updateEndActvyn");
	}

	@Override
	public List<MandateVO> selectTodayMandateList() throws SQLException {
		return session.selectList("Mandate-Mapper.selectTodayMandateList");
	}

	@Override
	public List<MandateVO> selectYesterdayEndMandate() throws SQLException {
		return session.selectList("Mandate-Mapper.selectTodayMandateList");
	}

	@Override
	public void updateMandateAprv(String mandate, String empid, String code) throws SQLException {
		Map<String, String> map = new HashMap<>();
		map.put("mandate", mandate);
		map.put("empid", empid);
		map.put("code", code);
		session.update("Mandate-Mapper.updateMandateAprv",map);
	}

	@Override
	public void updateMandateCons(String mandate, String empid, String code) throws SQLException {
		Map<String, String> map = new HashMap<>();
		map.put("mandate", mandate);
		map.put("empid", empid);
		map.put("code", code);
		session.update("Mandate-Mapper.updateMandateCons",map);
	}

	@Override
	public void updateMandateAprvCancel(String mandate, String empid, String code) throws SQLException {
		Map<String, String> map = new HashMap<>();
		map.put("mandate", mandate);
		map.put("empid", empid);
		map.put("code", code);
		session.update("Mandate-Mapper.updateMandateAprvCancel",map);
	}

	@Override
	public void updateMandateConsCancel(String mandate, String empid, String code) throws SQLException {
		Map<String, String> map = new HashMap<>();
		map.put("mandate", mandate);
		map.put("empid", empid);
		map.put("code", code);
		session.update("Mandate-Mapper.updateMandateConsCancel",map);
	}

	@Override
	public List<ApprovalVO> selectAprvByEmpId(String empid) throws SQLException {
		return session.selectList("Mandate-Mapper.selectAprvByEmpId",empid);
	}

	@Override
	public List<ConsensusVO> selectConsByEmpId(String empid) throws SQLException {
		return session.selectList("Mandate-Mapper.selectConsByEmpId",empid);
	}
}
