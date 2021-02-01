package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gr.cg.command.SearchCriteria;
import com.gr.cg.command.SearchCriteria2;
import com.gr.cg.dto.ApprovalRefVO;
import com.gr.cg.dto.ApprovalVO;
import com.gr.cg.dto.AttachVO;
import com.gr.cg.dto.ConsensusVO;
import com.gr.cg.dto.ElecDocumentVO;
import com.gr.cg.dto.ReceiverVO;

public interface ElecDocumentDAO {
	List<ElecDocumentVO> selectElecDocumentList(SearchCriteria cri) throws SQLException;
	ElecDocumentVO selectElecDocumentByElecDocumentNo(int elecDocumentNo) throws SQLException;
	void insertElecDocument(ElecDocumentVO elecDocument) throws SQLException;
	void updateElecDocument(ElecDocumentVO elecDocument) throws SQLException;
	void deleteElecDocument(int elecDocumentNo) throws SQLException;
	int selectSeq() throws SQLException;
	List<ElecDocumentVO> selectEdocListByUserId(SearchCriteria2 cri) throws SQLException;
	List<ElecDocumentVO> selectAprvListByUserId(SearchCriteria2 cri) throws SQLException;
	List<ElecDocumentVO> selectSaveListByUserId(SearchCriteria2 cri) throws SQLException;
	ElecDocumentVO selectEdocForDetail(int edno) throws SQLException;
	List<ConsensusVO> selectConsForDetail(int edno) throws SQLException;
	List<ApprovalVO> selectAprvForDetail(int edno) throws SQLException;
	List<ReceiverVO> selectRecForDetail(int edno) throws SQLException;
	List<ApprovalRefVO> selectRefForDetail(int edno) throws SQLException;
	List<AttachVO> selectAttachList(int edno) throws SQLException;
	List<ApprovalVO> selectAllAprvLnByEdno(int edno) throws SQLException;
	void collectElecDocument(int edno) throws SQLException;
	ApprovalVO selectAprvDates(@Param("edno") int edno, @Param("id") String id) throws SQLException;
	void updateAprvChkDate(int aprvno) throws SQLException;
	void updateConsChkDate(int consno) throws SQLException;
	List<ElecDocumentVO> selectRefReadList(SearchCriteria2 cri) throws SQLException;
	List<ElecDocumentVO> selectReceiverList(SearchCriteria2 cri) throws SQLException;
	void mergeReading(int edno, String empid) throws SQLException;
	ApprovalVO selectAprvDetail(int aprv_no) throws SQLException;
	ConsensusVO selectConsDetail(int cons_no) throws SQLException;
	List<AttachVO> selectAprvAttachList(int aprv_no) throws SQLException;
	int selectMyAprvStatusCnt(ElecDocumentVO vo) throws SQLException;
	List<ElecDocumentVO> selectMyAprvList(SearchCriteria2 cri) throws SQLException;
	List<ElecDocumentVO> selectMyAprvWaitList(SearchCriteria2 cri) throws SQLException;
	List<ElecDocumentVO> selectMyAprvIngList(SearchCriteria2 cri) throws SQLException;
	List<ElecDocumentVO> selectMyReceiveList(SearchCriteria2 cri) throws SQLException;
}

