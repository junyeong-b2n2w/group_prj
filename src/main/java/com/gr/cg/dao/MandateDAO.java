package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.gr.cg.dto.ApprovalVO;
import com.gr.cg.dto.ConsensusVO;
import com.gr.cg.dto.MandateVO;

public interface MandateDAO {
	List<Map<String, Object>> selectMdtListById(String id) throws SQLException;
	
	void updateActvyn(List<String> unset) throws SQLException;
	
	void insertUpdate(MandateVO mdt) throws SQLException;

	void updateEndActvyn() throws SQLException;
	
	List<MandateVO> selectTodayMandateList() throws SQLException;
	
	List<MandateVO> selectYesterdayEndMandate() throws SQLException;

	void updateMandateAprv(String mandate, String empid, String code) throws SQLException;
	
	void updateMandateCons(String mandate, String empid, String code) throws SQLException;
	
	void updateMandateAprvCancel(String mandate, String empid, String code) throws SQLException;
	
	void updateMandateConsCancel(String mandate, String empid, String code) throws SQLException;
	
	List<ApprovalVO> selectAprvByEmpId(String empid) throws SQLException;
	List<ConsensusVO> selectConsByEmpId(String empid) throws SQLException;
}
