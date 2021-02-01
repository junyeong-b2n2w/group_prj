package com.gr.cg.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.gr.cg.command.PageMaker;
import com.gr.cg.command.SearchCriteria;
import com.gr.cg.command.SearchCriteria2;
import com.gr.cg.dao.VacationDAO;
import com.gr.cg.dto.VacationVO;

public class VacationServiceImpl implements VacationService {
	
	private VacationDAO vacationDAO;
	private ApprovalService aprvService;
	
	public void setVacationDAO(VacationDAO vacationDAO) {
		this.vacationDAO = vacationDAO;
	}
	public void setApprovalService(ApprovalService aprvService) {
		this.aprvService = aprvService;
	}

	@Override
	public Map<String, Object> getAllVactListByCompNo(SearchCriteria cri) throws SQLException {

		List<VacationVO> vactList = vacationDAO.selectVcatAllList(cri);
		VacationVO vact2 =  new VacationVO();
		for( VacationVO vact : vactList) {
			vact2 = vacationDAO.selectAnnualCntByCompno(vact.getVact_id());
			vact.setVact_occurcnt(vact2.getVact_occurcnt());
			vact.setVact_usecnt(vact.getVact_usecnt());
			vact.setVact_remcnt(vact2.getVact_remcnt());
		}
		
		int totalCnt = vacationDAO.selectVcatAllListCnt(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCnt);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("vactList", vactList);
		dataMap.put("pageMaker", pageMaker);
				
		
		return dataMap;
	}

	@Override
	public void updateVacationConfirm(VacationVO vacation) throws SQLException {

//		vacationDAO.updateVactCConfcirm(vacation);
	}

	@Override
	public List<VacationVO> getVactListByVactId(SearchCriteria2 cri) throws SQLException {
		List<VacationVO> vactList = vacationDAO.selectVcatByVactId(cri);
		return vactList;
	}

	@Override
	public List<Map<String, Object>> selectVactIngEmpCount(int comp_no) throws SQLException {

		List<Map<String, Object>> mapList = vacationDAO.selectVactIngEmpCount(comp_no);
		return mapList;
	}

	@Override
	public List<Map<String, Object>> getVactAprvDeptNoByChart2() throws SQLException {
		List<Map<String, Object>> mapList = vacationDAO.selectVactAptvByDeptNo();
		return mapList;
	}

	@Override
	public List<Map<String, Object>> getVactAprvRankNoByChart3() throws SQLException {
		// TODO Auto-generated method stub
		List<Map<String, Object>> mapList = vacationDAO.selectVactAptvByRankNo();
		return mapList;
	}

	@Override
	public List<Map<String, Object>> getVactRemAvgByChart4() throws SQLException {
		List<Map<String, Object>> mapList = vacationDAO.selectVactRemCntByDeptNoAndRankNo();
		return mapList;
	}

	@Override
	public Map<String, Object> getCountBySysdate(int comp_no) throws SQLException {
		Map<String, Object> dataMap = new HashMap<>();
		
		int waitAprv = vacationDAO.selectWaitAprvCount(comp_no);
		int nAprvCnt = vacationDAO.selectAprvIsNCount(comp_no);
		int aprvIngCnt = vacationDAO.selectVacatIngToday(comp_no);
		
		dataMap.put("waitCnt", waitAprv);
		dataMap.put("aprvCnt", aprvIngCnt);
		dataMap.put("nAprvCnt", nAprvCnt);
		return dataMap;
	}

	@Override
	public VacationVO getAnnualCntByVactId(String id) throws SQLException {
		return vacationDAO.selectAnnualCntByCompno(id);
	}

	@Override
	public int registVactById(VacationVO vacation, int deptno) throws SQLException {
		int vact_no = vacationDAO.selectVacationSeq();
		vacation.setVact_no(vact_no);
		int edno = aprvService.autoVacApproval(vacation, deptno);
		
		vacation.setVact_edno(edno);
		vacationDAO.insertVcat(vacation);
		
		return edno;
		
	}

	@Override
	public void modifyMyVactById(VacationVO vacation) throws SQLException {
		vacationDAO.updateMyVcatByVactId(vacation);
		
	}

}



