package com.gr.cg.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gr.cg.command.SearchCriteria;
import com.gr.cg.command.SearchCriteria2;
import com.gr.cg.command.TempSaveCommand;
import com.gr.cg.dto.ApprovalVO;
import com.gr.cg.dto.AttachVO;
import com.gr.cg.dto.ConsensusVO;
import com.gr.cg.dto.ElecDocumentVO;

public interface ElecDocumentService {
	List<ElecDocumentVO> getElecDocumentList(SearchCriteria cri) throws SQLException;
	ElecDocumentVO getElecDocumentByElecDocumentNo(int elecDocumentNo) throws SQLException;
	void registElecDocument(ElecDocumentVO elecDocument, TempSaveCommand tempSave) throws Exception;
	void modifyElecDocument(ElecDocumentVO elecDocument) throws SQLException;
	void removeElecDocument(int elecDocumentNo) throws SQLException;
	List<ElecDocumentVO> getEdocListByUserId(SearchCriteria2 cri) throws SQLException;
	List<ElecDocumentVO> getAprvListByUserId(SearchCriteria2 cri) throws SQLException;
	List<ElecDocumentVO> getSaveListByUserId(SearchCriteria2 cri) throws SQLException;
	List<ElecDocumentVO> getRefReadListByUserId(SearchCriteria2 cri) throws SQLException;
	List<ElecDocumentVO> getReceiverListByUserId(SearchCriteria2 cri) throws SQLException;
	ElecDocumentVO getEdocForDetail(int edno) throws SQLException;
	List<AttachVO> getAttachList(int edno) throws SQLException;
	void registElecDocumentWithAttach(ElecDocumentVO edoc, TempSaveCommand tempSave, int[] delfile) throws Exception;
	void collectElecDocument(int edno) throws SQLException;
	ApprovalVO getAprvDates(int edno, String id) throws SQLException;
	
	// 정상결재시
	void importantApproval(ApprovalVO vo, HttpSession session, HttpServletResponse response) throws Exception;
	
	// 반려시
	void importantReturn(ApprovalVO vo) throws Exception;
	void importantConsYesNo(ConsensusVO vo, int yn) throws SQLException;
	
	void addReadingAuth(List<String> empids, int edno) throws SQLException;
	ApprovalVO getAprvDetail(int aprv_no) throws SQLException;
	ConsensusVO getConsDetail(int cons_no) throws SQLException;
	List<AttachVO> getAprvAttachList(int aprv_no) throws SQLException;
	
	Map<String, String> getMyAprvCnt(String id) throws SQLException;
	List<ElecDocumentVO> getMyAprvList(SearchCriteria2 cri) throws SQLException;
	List<ElecDocumentVO> getMyAprvWaitList(SearchCriteria2 cri) throws SQLException;
	List<ElecDocumentVO> getMyAprvIngList(SearchCriteria2 cri) throws SQLException;
	List<ElecDocumentVO> getMyReceiveList(SearchCriteria2 cri) throws SQLException;
	
	String getAprvPafFile(int edno) throws SQLException;
}
