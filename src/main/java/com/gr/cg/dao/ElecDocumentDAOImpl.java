package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.gr.cg.command.SearchCriteria;
import com.gr.cg.command.SearchCriteria2;
import com.gr.cg.dto.ApprovalRefVO;
import com.gr.cg.dto.ApprovalVO;
import com.gr.cg.dto.AttachVO;
import com.gr.cg.dto.ConsensusVO;
import com.gr.cg.dto.ElecDocumentVO;
import com.gr.cg.dto.ReceiverVO;

public class ElecDocumentDAOImpl implements ElecDocumentDAO{
	
	private SqlSession session;
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public ElecDocumentVO selectElecDocumentByElecDocumentNo(int elecDocumentNo) throws SQLException {
		return session.selectOne("ElecDocument-Mapper.selectElecDocumentByElecDocumentNo", elecDocumentNo);
	}

	@Override
	public List<ElecDocumentVO> selectElecDocumentList(SearchCriteria cri) throws SQLException {
		return session.selectList("ElecDocument-Mapper.selectElecDocumentList", cri);
	}

	@Override
	public void insertElecDocument(ElecDocumentVO elecDocument) throws SQLException {
		session.update("ElecDocument-Mapper.insertElecDocument", elecDocument);
	}

	@Override
	public void updateElecDocument(ElecDocumentVO elecDocument) throws SQLException {
		session.update("ElecDocument-Mapper.updateElecDocument", elecDocument);
	}

	@Override
	public void deleteElecDocument(int elecDocument_no) throws SQLException {
		session.update("ElecDocument-Mapper.deleteElecDocument", elecDocument_no);
	}

	@Override
	public int selectSeq() throws SQLException {
		return session.selectOne("ElecDocument-Mapper.selectSeq");
	}

	@Override
	public List<ElecDocumentVO> selectEdocListByUserId(SearchCriteria2 cri) throws SQLException {
		return session.selectList("ElecDocument-Mapper.selectEdocListByUserId",cri);
	}

	@Override
	public List<ElecDocumentVO> selectAprvListByUserId(SearchCriteria2 cri) throws SQLException {
		return session.selectList("ElecDocument-Mapper.selectAprvListByUserId",cri);
	}

	@Override
	public List<ElecDocumentVO> selectSaveListByUserId(SearchCriteria2 cri) throws SQLException {
		return session.selectList("ElecDocument-Mapper.selectSaveListByUserId",cri);
	}

	@Override
	public ElecDocumentVO selectEdocForDetail(int edno) throws SQLException {
		return session.selectOne("ElecDocument-Mapper.selectEdocForDetail",edno);
	}
	@Override
	public List<ConsensusVO> selectConsForDetail(int edno) throws SQLException {
		return session.selectList("ElecDocument-Mapper.selectConsForDetail",edno);
	}
	@Override
	public List<ApprovalVO> selectAprvForDetail(int edno) throws SQLException {
		return session.selectList("ElecDocument-Mapper.selectAprvForDetail",edno);
	}
	@Override
	public List<ReceiverVO> selectRecForDetail(int edno) throws SQLException {
		return session.selectList("ElecDocument-Mapper.selectRecForDetail",edno);
	}
	@Override
	public List<ApprovalRefVO> selectRefForDetail(int edno) throws SQLException {
		return session.selectList("ElecDocument-Mapper.selectRefForDetail",edno);
	}

	@Override
	public List<AttachVO> selectAttachList(int edno) throws SQLException {
		return session.selectList("ElecDocument-Mapper.selectAttachList",edno);
	}

	@Override
	public List<ApprovalVO> selectAllAprvLnByEdno(int edno) throws SQLException {
		return session.selectList("ElecDocument-Mapper.selectAllAprvLnByEdno",edno);
	}

	@Override
	public void collectElecDocument(int edno) throws SQLException {
		session.update("ElecDocument-Mapper.collectElecDocument", edno);
	}

	@Override
	public ApprovalVO selectAprvDates(int edno, String id) throws SQLException {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("edno", edno+"");
		paramMap.put("id", id);
		return session.selectOne("ElecDocument-Mapper.selectAprvDates", paramMap);
	}

	@Override
	public void updateAprvChkDate(int aprvno) throws SQLException {
		session.update("ElecDocument-Mapper.updateAprvChkDate", aprvno);
	}

	@Override
	public void updateConsChkDate(int consno) throws SQLException {
		session.update("ElecDocument-Mapper.updateConsChkDate", consno);
	}

	@Override
	public List<ElecDocumentVO> selectRefReadList(SearchCriteria2 cri) throws SQLException {
		return session.selectList("ElecDocument-Mapper.selectRefReadList", cri);
	}

	@Override
	public List<ElecDocumentVO> selectReceiverList(SearchCriteria2 cri) throws SQLException {
		return session.selectList("ElecDocument-Mapper.selectReceiverList", cri);
	}

	@Override
	public void mergeReading(int edno, String empid) throws SQLException {
		Map<String, Object> map = new HashMap<>();
		map.put("edno", edno);
		map.put("empid", empid);
		session.update("ElecDocument-Mapper.mergeReading", map);
	}

	@Override
	public ApprovalVO selectAprvDetail(int aprv_no) throws SQLException {
		return session.selectOne("ElecDocument-Mapper.selectAprvDetail", aprv_no);
	}

	@Override
	public ConsensusVO selectConsDetail(int cons_no) throws SQLException {
		return session.selectOne("ElecDocument-Mapper.selectConsDetail", cons_no);
	}

	@Override
	public List<AttachVO> selectAprvAttachList(int aprv_no) throws SQLException {
		return session.selectList("ElecDocument-Mapper.selectAprvAttachList",aprv_no);
	}

	@Override
	public int selectMyAprvStatusCnt(ElecDocumentVO vo) throws SQLException {
		return session.selectOne("ElecDocument-Mapper.selectMyAprvStatusCnt",vo);
	}

	@Override
	public List<ElecDocumentVO> selectMyAprvList(SearchCriteria2 cri) throws SQLException {
		return session.selectList("ElecDocument-Mapper.selectMyAprvList",cri);
	}

	@Override
	public List<ElecDocumentVO> selectMyAprvWaitList(SearchCriteria2 cri) throws SQLException {
		return session.selectList("ElecDocument-Mapper.selectMyAprvWaitList",cri);
	}

	@Override
	public List<ElecDocumentVO> selectMyAprvIngList(SearchCriteria2 cri) throws SQLException {
		return session.selectList("ElecDocument-Mapper.selectMyAprvIngList",cri);
	}

	@Override
	public List<ElecDocumentVO> selectMyReceiveList(SearchCriteria2 cri) throws SQLException {
		return session.selectList("ElecDocument-Mapper.selectMyReceiveList",cri);
	}

}

