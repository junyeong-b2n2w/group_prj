package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.gr.cg.dto.ApprovalVO;
import com.gr.cg.dto.ConsensusVO;
import com.gr.cg.dto.ElecDocumentVO;

public interface AprvConsDAO {
	void insertCons(ConsensusVO vo) throws SQLException;
	void insertAprv(ApprovalVO vo) throws SQLException;
	void insertFirstAprv(ApprovalVO vo) throws SQLException;
	void insertFirstCons(ConsensusVO vo) throws SQLException;
	
	// 최종결재자 확인을 위한 전자문서 조회
	ElecDocumentVO selectEdocForAprv(int edno) throws SQLException;
	
	// 결재진행 (현재 결재자의 순서반환)
	int updateAprv(ApprovalVO vo) throws SQLException; 
	// 결재진행된 결재자정보
	ApprovalVO selectAprvForAprv(int aprvno) throws SQLException;

	// 다음 결재자 조회(결재, 합의 합친결과)
	List<ApprovalVO> selectNextAprvList(int edno, int ord) throws SQLException; 
	
	// 최종 결재완료시
	String updateEdocFinal(int edno) throws SQLException;
	
	// 병렬합의 해당되는 사원  결재시작
	void updateParallelCons(int consno, String code) throws SQLException;
	
	// 다음결재자 결재상태 결재중으로 변경
	void updateAprvStt(ApprovalVO vo) throws SQLException;
	
	// 다음결재자 순차합의자일 경우 
	void updateTurnCons(int consno, String code) throws SQLException;
	
	// 반려시 전자문서상태 반려로 변경
	void updateEdocToReturn(int edno) throws SQLException;
	
	// 최초 결재진행시 전자문서상태 진행으로 변경
	void updateEdocToIng(int edno) throws SQLException;
	
	// 합의 진행시 합의상태변경
	void updateCons(ConsensusVO vo) throws SQLException;
	
	// 남은 병렬합의자 숫자구하기
	int selectParConsCnt(int edno) throws SQLException;
	
	// 현재 합의자 정보구하기
	ConsensusVO selectConsForAprv(int consno) throws SQLException;
	
	String selectEdocTaskNo(int edno) throws SQLException;
	
	void insertFinalAprvPdf(Map<String, String> map) throws SQLException;
	
	String selectFinAprvPdf(int edno) throws SQLException;
}
