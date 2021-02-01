package com.gr.cg.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.gr.cg.dao.MandateDAO;
import com.gr.cg.dto.ApprovalVO;
import com.gr.cg.dto.ConsensusVO;
import com.gr.cg.dto.MandateVO;

public class MandateServiceImpl implements MandateService{
	
	private MandateDAO mandateDAO;
	public void setMandateDAO(MandateDAO mandateDAO) {
		this.mandateDAO = mandateDAO;
	}
	
	@Override
	public List<Map<String, Object>> getMdtList(String id) throws SQLException {
		return mandateDAO.selectMdtListById(id);
	}
	
	@Override
	public void setUnset(List<String> unset) throws SQLException {
		mandateDAO.updateActvyn(unset);
	}
	
	@Override
	public void setMandate(MandateVO mdt) throws SQLException {
		mandateDAO.insertUpdate(mdt);
	}
	
	@Override
	public void setActvyn() throws SQLException {
		mandateDAO.updateEndActvyn();
	}

	@Override
	public void turnOnMandate() throws SQLException {
		List<MandateVO> list = mandateDAO.selectTodayMandateList();	// 오늘날짜에 해당하는 대결리스트 불러오기
		if(list != null && list.size() < 1) {
			for(MandateVO vo : list) {
				// 대결자에 등록되어있는 아이디를 가지고 결재선에 있는지 확인
				List<ApprovalVO> aprvList = mandateDAO.selectAprvByEmpId(vo.getMdt_empid());
				if(aprvList != null && aprvList.size() < 1) {
					for(ApprovalVO aprv : aprvList) {
						// 코드의 마지막 상태코드 저장
						String lastCode = Character.toString(aprv.getAprv_as().charAt(4)); 
						
						// 최종상태코드 저장할 변수
						String code = "";
						
						// 현재 상태가 일반결재인지 전결인지 확인
						if(aprv.getAprv_as().charAt(3) == '0') {	// 일반결재
							code = "DAP4"+lastCode;
						}else if(aprv.getAprv_as().charAt(3) == '3') {	// 전결
							code = "DAP7"+lastCode;
						}
						// 바뀐 상태코드와 대결자 insert
						mandateDAO.updateMandateAprv(vo.getMdt_mdtr(),vo.getMdt_empid(), code);
					}
				}
				
				// 대결자에 등록되어있는 아이디를 가지고있는 합의 확인
				List<ConsensusVO> consList = mandateDAO.selectConsByEmpId(vo.getMdt_empid());
				if(consList != null && consList.size() < 1) {
					for(ConsensusVO cons : consList) {
						String lastCode = Character.toString(cons.getCons_agrestt().charAt(4)); 
						
						// 최종상태코드 저장할 변수
						String code = "";
						
						// 현재 상태가 병렬합의인지 순차합의인지 확인
						if(cons.getCons_agrestt().charAt(3) == '1') {	// 순차합의
							code = "DAP5"+lastCode;
						}else if(cons.getCons_agrestt().charAt(3) == '2') {	// 병렬합의
							code = "DAP6"+lastCode;
						}
						// 바뀐 상태코드와 대결자 insert
						mandateDAO.updateMandateCons(vo.getMdt_mdtr(),vo.getMdt_empid(), code);
					}
				}
			}
		}
	}

	@Override
	public void turnOffMandate() throws SQLException {
		// 어제자로 대결상태가 끝난 사용자들 확인
		List<MandateVO> list = mandateDAO.selectYesterdayEndMandate();
		if(list != null && list.size() < 1) {
			for(MandateVO vo : list) {
				// 대결등록이 되어있는 결재선 확인
				List<ApprovalVO> aprvList = mandateDAO.selectAprvByEmpId(vo.getMdt_mdtr());
				if(aprvList != null && aprvList.size() < 1) {
					for(ApprovalVO aprv : aprvList) {
						// 코드의 마지막 상태코드 저장
						String lastCode = Character.toString(aprv.getAprv_as().charAt(4)); 
						
						// 최종상태코드 저장할 변수
						String code = "";
						
						// 현재 상태가 일반결재인지 전결인지 확인
						if(aprv.getAprv_as().charAt(3) == '4') {	// 일반결재
							code = "DAP0"+lastCode;
						}else if(aprv.getAprv_as().charAt(3) == '7') {	// 전결
							code = "DAP3"+lastCode;
						}
						// 바뀐 상태코드와 대결자 되돌리기
						mandateDAO.updateMandateAprvCancel(vo.getMdt_mdtr(), vo.getMdt_empid(), code);
					}
				}
				
				// 대결등록이 되어있는 합의 확인
				List<ConsensusVO> consList = mandateDAO.selectConsByEmpId(vo.getMdt_mdtr());
				if(consList != null && consList.size() < 1) {
					for(ConsensusVO cons : consList) {
						// 코드의 마지막 상태코드 저장
						String lastCode = Character.toString(cons.getCons_agrestt().charAt(4)); 
						
						// 최종상태코드 저장할 변수
						String code = "";
						
						// 현재 상태가 순차합의인지 병렬합의인지
						if(cons.getCons_agrestt().charAt(3) == '5') {	// 순차합의
							code = "DAP1"+lastCode;
						}else if(cons.getCons_agrestt().charAt(3) == '6') {	// 병렬합의
							code = "DAP2"+lastCode;
						}
						// 바뀐 상태코드와 대결자 insert
						mandateDAO.updateMandateAprvCancel(vo.getMdt_mdtr(), vo.getMdt_empid(), code);
					}
				}
			}
		}
	}
}
