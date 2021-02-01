package com.gr.cg.service;

import java.sql.SQLException;
import java.text.DateFormat;
import java.util.List;

import com.gr.cg.command.SearchCriteria;
import com.gr.cg.command.SearchCriteria2;
import com.gr.cg.dao.ApprovalDAO;
import com.gr.cg.dao.AprvConsDAO;
import com.gr.cg.dao.ElecDocumentDAO;
import com.gr.cg.dto.ApprovalVO;
import com.gr.cg.dto.ElecDocumentVO;
import com.gr.cg.dto.GChartVO;
import com.gr.cg.dto.UserAprvLnGrVO;
import com.gr.cg.dto.UserDefAprvLnVO;
import com.gr.cg.dto.VacationVO;

public class ApprovalServiceImpl implements ApprovalService{

	private ApprovalDAO approvalDAO;
	private ElecDocumentDAO elecDAO;
	private AprvConsDAO aprvConsDAO;
	
	public void setElecDocumentDAO(ElecDocumentDAO elecDAO) {
		this.elecDAO = elecDAO;
	}
	public void setApprovalDAO(ApprovalDAO approvalDAO) {
		this.approvalDAO = approvalDAO;
	}
	public void setAprvConsDAO(AprvConsDAO aprvConsDAO) {
		this.aprvConsDAO = aprvConsDAO;
	}
	@Override
	public List<ApprovalVO> getApprovalList(SearchCriteria cri) throws SQLException {
		return approvalDAO.selectApprovalList(cri);
	}
	@Override
	public ApprovalVO getApprovalByApprovalNo(int approvalNo) throws SQLException {
		return approvalDAO.selectApprovalByApprovalNo(approvalNo);
	}
	@Override
	public void registApproval(ApprovalVO approval) throws SQLException {
		approvalDAO.insertApproval(approval);	}
	@Override
	public void modifyApproval(ApprovalVO approval) throws SQLException {
		approvalDAO.updateApproval(approval);	}
	@Override
	public void removeApproval(int approvalNo) throws SQLException {
		approvalDAO.deleteApproval(approvalNo);	}
	@Override
	public List<GChartVO> searchAprvLnList(String text) throws SQLException {
		return approvalDAO.selectApprovalListByName(text);
	}
	@Override
	public int registAprvLn(UserDefAprvLnVO udal) throws SQLException {
		int seq = approvalDAO.selectUserAprvLnSequence();
		udal.setUdal_no(seq);
		approvalDAO.insertUserAprvLn(udal);
		List<UserAprvLnGrVO> list = udal.getUalgList();
		for(UserAprvLnGrVO ualg : list) {
			ualg.setUalg_no(seq);
			approvalDAO.insertUserAprvLnGr(ualg);
		}
		return seq;
	}
	@Override
	public List<UserDefAprvLnVO> getAprvLnList(String id) throws SQLException {
		return approvalDAO.selectUserAprvLn(id);
	}
	@Override
	public void removeAprvLn(int udal_no) throws SQLException {
		approvalDAO.deleteUserAprvLn(udal_no);
	}
	@Override
	public List<UserAprvLnGrVO> getAprvLnGrList(int udal_no) throws SQLException {
		return approvalDAO.selectUserAprvLnGr(udal_no);
	}
	@Override
	public List<UserDefAprvLnVO> getAprvLnListPage(SearchCriteria2 cri) throws SQLException {
		return approvalDAO.selectUdalListByCri(cri);
	}
	@Override
	public int autoVacApproval(VacationVO vo, int deptno) throws SQLException {
		ElecDocumentVO edoc = new ElecDocumentVO();
		int seq = elecDAO.selectSeq();	// EDOC 기본키 생성
		edoc.setEd_no(seq);	// edocVO seq 세팅
		edoc.setEd_dftr(vo.getVact_id());	// 기안자 설정
		edoc.setEd_aprvstt("DED01");		// 문서상태 상신
		edoc.setEd_aprvtitle("휴가 신청 "+vo.getVact_no() + "호"); // 문서제목 설정
		edoc.setEd_formno(1);	// 양식설정
		edoc.setEd_deptno(deptno);// 부서번호설정
		edoc.setEd_taskno(vo.getVact_no()+"");	// 휴가번호 설정
		
		DateFormat format = DateFormat.getDateInstance(DateFormat.FULL);
		String content = "<p>휴가 시작일자 : "+format.format(vo.getVact_satymd())+"</p><p>휴가 종료일자 : "+format.format(vo.getVact_endymd())+"</p><p>휴가 사유 : "+vo.getVact_reason()+"</p>";
		edoc.setEd_aprv(content);
		
		String id = approvalDAO.selectVacAprvDept(vo.getVact_id());	// deptno, empid
		if(id == null) {
			id = approvalDAO.selectVacAprvTop();
		}
		edoc.setEd_lastapvr(id); // 마지막 결재자설정
		
		elecDAO.insertElecDocument(edoc);
		
		ApprovalVO aprv = new ApprovalVO();
		aprv.setAprv_edno(seq);
		aprv.setAprv_as("DAP05");
		aprv.setAprv_empid(id);
		aprv.setAprv_ord(1);
		aprvConsDAO.insertFirstAprv(aprv);
		return seq;
	}

}

